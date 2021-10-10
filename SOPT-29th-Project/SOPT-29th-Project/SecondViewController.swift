//
//  SecondViewController.swift
//  SOPT-29th-Project
//
//  Created by 조양원 on 2021/10/07.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextBtn.isEnabled = false
        nextBtn.backgroundColor = .systemGray

        nameTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        phoneNumTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)

        
        setNameText()
        
        passwordTextField.isSecureTextEntry = true
        
    }
    
    
    // 도도전과제
    func setNameText() {
        if let nameTxt = UserDefaults.standard.string(forKey: "nameText") {
            nameTextField.text = nameTxt
        }
    }
    
    
    
    // 도전과제 1. 값변경이 되었을 때 적용할 함수
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
    
    
    
    
    @IBAction func nextBtn(_ sender: Any) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "ThirdViewController") else {return}
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    
    
    
    // 도전과제 2
    @IBAction func checkBoxTapped(_ sender: UIButton) {

        
        if sender.isSelected {
            sender.isSelected.toggle()
            passwordTextField.isSecureTextEntry.toggle()
            
        } else {
            sender.isSelected.toggle()
            passwordTextField.isSecureTextEntry.toggle()
        }
    }
    
//    @IBAction func checkBoxTapped(_ sender: UIButton) {
//        if sender.isSelected {
//            sender.isSelected = false
//            passwordTextField.isSecureTextEntry = true
//
//        } else {
//            sender.isSelected = true
//            passwordTextField.isSecureTextEntry = false
//        }
//    }
}
