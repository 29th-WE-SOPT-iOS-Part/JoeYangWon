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
    
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton()
        setupTextFieldAddTarget()
        setupNameTextFieldUserDefaults()
        setupPasswordTextField()
    }
    
  
    func setupButton(){
        nextBtn.isEnabled = false
        nextBtn.backgroundColor = .systemGray
    }
    
    func setupTextFieldAddTarget(){
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        phoneNumTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }
    
    func setupPasswordTextField(){
        passwordTextField.isSecureTextEntry = true
    }
    

    func setupNameTextFieldUserDefaults(){
        nameTextField.text = UserDefaults.standard.string(forKey: "nameText")
    }
    
    
    
    
    
    
    @objc func textFieldDidChange(textField: UITextField) {
        
        if nameTextField.text?.isEmpty == true ||
            phoneNumTextField.text?.isEmpty == true ||
            passwordTextField.text?.isEmpty == true {
            nextBtn.isEnabled = false
            nextBtn.backgroundColor = .systemGray
            
        } else {
            nextBtn.isEnabled = true
            nextBtn.backgroundColor = .systemBlue
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
        if sender.isSelected {
            sender.isSelected = false
            passwordTextField.isSecureTextEntry = true

        } else {
            sender.isSelected = true
            passwordTextField.isSecureTextEntry = false
        }
        
    }
    
}

