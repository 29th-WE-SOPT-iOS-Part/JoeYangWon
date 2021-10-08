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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.isSecureTextEntry = true

    }
    
  
    
    // Push. Navigation을 통해 SecondVC로 이동
    @IBAction func accountBtn(_ sender: Any) {
        
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

