//
//  SecondViewController.swift
//  SOPT-29th-Project
//
//  Created by 조양원 on 2021/10/07.
//

import UIKit

class SecondViewController: UIViewController {
    
    static let identifier = "SecondViewController"
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonDefaultSetting()
        textFieldAddTargetSetting()
        setNameText()
    }
    
    func buttonDefaultSetting() {
        nextBtn.isEnabled = false
        nextBtn.backgroundColor = .systemGray
        passwordTextField.isSecureTextEntry = true
    }
    
    func textFieldAddTargetSetting() {
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        phoneNumTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }
    
    
    // 도도전과제
    func setNameText() {
        if let nameTxt = UserDefaults.standard.string(forKey: "name") {
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
      requestSignUp()
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
}





extension SecondViewController {
    func nextVC() {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "ThirdViewController") else {return}
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    func showAlert(
        alertText : String,
        alertMessage : String,
        isSuccess: Bool
    )
    {
        let alert = UIAlertController(title: alertText,
                                      message: alertMessage,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { (_) in
            if isSuccess {
                self.nextVC()
            }
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }

    
    
    func requestSignUp() {
        UserSignService.shared.signUp(email: phoneNumTextField.text ?? "",
                                      name: nameTextField.text ?? "",
                                      password: passwordTextField.text ?? "") { networkResult in
            switch networkResult {
            case .success(let loginResponse):
                guard let response = loginResponse as? SignUpResponseData else {return}
                    if let userData = response.data {
                    self.showAlert(alertText: "회원가입",
                                   alertMessage: response.message,
                                   isSuccess: true
                    )
                    UserDefaults.standard.set(userData.name, forKey: "name")
                }

            case .requestErr(let msg):
                if let message = msg as? String {
                    self.showAlert(alertText: "회원가입",
                                   alertMessage: message,
                                   isSuccess: false
                    )
                }
            
            case .pathErr(let msg):
                guard let message = msg as? String else { return }
                self.showAlert(alertText: "회원가입",
                               alertMessage: message,
                               isSuccess: false
                )
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
