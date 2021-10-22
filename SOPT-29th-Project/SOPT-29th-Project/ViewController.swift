//
//  ViewController.swift
//  SOPT-29th-Project
//
//  Created by 조양원 on 2021/10/02.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var nextVcBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton()
        setupTextFieldAddTarget()
        setupNameTextFieldUserDefaults()
        setupPasswordTextField()
    }

    
    
  
    private func setupButton(){
        nextVcBtn.isEnabled = false
        nextVcBtn.backgroundColor = .systemGray
    }
    
    private func setupTextFieldAddTarget(){
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        phoneNumTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }
    
    private func setupPasswordTextField(){
        passwordTextField.isSecureTextEntry = true
    }
    

    private func setupNameTextFieldUserDefaults(){
        nameTextField.text = UserDefaults.standard.string(forKey: "nameText")
    }
    
    
    
    
    
    // hasText로 간결하게 바꿀 수 있다
    @objc func textFieldDidChange(textField: UITextField) {
        
        if nameTextField.text?.isEmpty == true ||
            phoneNumTextField.text?.isEmpty == true ||
            passwordTextField.text?.isEmpty == true {
            nextVcBtn.isEnabled = false
            nextVcBtn.backgroundColor = .systemGray
            
        } else {
            nextVcBtn.isEnabled = true
            nextVcBtn.backgroundColor = .systemBlue
        }
    }
    
    
    
    // Push. Navigation을 통해 SecondVC로 이동
    @IBAction func accountBtn(_ sender: Any) {
        // 도도전과제
        UserDefaults.standard.set(nameTextField.text, forKey: "nameText")
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") else {return}
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
    
    
    // Present. Modal을 통해 ThirdVC로 이동
    @IBAction func nextBtn(_ sender: Any) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "ThirdViewController") as? ThirdViewController else {return}
        // as?를 통해 해당 뷰컨에 있는 것을 확인한다
        
        nextVC.nameText = nameTextField.text
    
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    
    
    
    
    @IBAction func checkBoxTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        passwordTextField.isSecureTextEntry.toggle()
    }
}

