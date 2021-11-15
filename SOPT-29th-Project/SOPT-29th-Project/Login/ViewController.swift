//
//  ViewController.swift
//  SOPT-29th-Project
//
//  Created by 조양원 on 2021/10/02.
//

/*
 금잔디 리뷰 후 처리할 일
 - 다른 계정으로 로그인 시 생기는 이슈
 - 버튼명 수정
 - 뷰컨 이름 변경
 - 레이아웃 정확하게 맞추기
 - 금잔디에
 
 */


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
//        UserDefaults.standard.set(nameTextField.text, forKey: "nameText")
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else {return}
        self.navigationController?.pushViewController(nextVC, animated: true)
        print("---> \(nextVC)")
    }
    
    
    // Present. Modal을 통해 ThirdVC로 이동
    @IBAction func nextBtn(_ sender: Any) {
        requestLogin()
    }
    
    @IBAction func checkBoxTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        passwordTextField.isSecureTextEntry.toggle()
    }
}



extension ViewController {
    func nextVC() {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "ThirdViewController") as? ThirdViewController else {return}
        
        nextVC.nameText = nameTextField.text
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
    
    
    
    func requestLogin() {
        UserSignService.shared.login(email: phoneNumTextField.text ?? "",
                                     password: passwordTextField.text ?? "") { [self] networkResult in
            switch networkResult {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else {return}
                if let userData = response.data {
                    self.showAlert(alertText: "로그인",
                                   alertMessage: response.message,
                                   isSuccess: true
                    )
                    UserDefaults.standard.set(userData.name, forKey: "name")
                }
                
            case .requestErr(let msg):
                if let message = msg as? String {
                    self.showAlert(alertText: "로그인",
                                   alertMessage: message,
                                   isSuccess: false
                    )
                }
                
            case .pathErr(let msg):
                guard let message = msg as? String else { return }
                self.showAlert(alertText: "로그인",
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


