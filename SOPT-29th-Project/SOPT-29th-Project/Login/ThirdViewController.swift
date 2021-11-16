//
//  ThirdViewController.swift
//  SOPT-29th-Project
//
//  Created by 조양원 on 2021/10/07.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var nameText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setNameInLabel()
    }
    
    func setNameInLabel() {
        nameLabel.text = UserDefaults.standard.string(forKey: "name")
    }

    @IBAction func okBtnTapped(_ sender: Any) {

        let tabbarStoryboard: UIStoryboard = UIStoryboard(
            name: "Tabbar",
            bundle: nil
        )
        
        guard let homeVC = tabbarStoryboard.instantiateViewController(withIdentifier: "TabbarController") as?
                TabbarController else { return }
                
        homeVC.modalPresentationStyle = .fullScreen
        self.present(homeVC, animated: true, completion: nil)
    }
    
    
    @IBAction func anotherAcountBtn(_ sender: Any) {
        guard let firstVC = presentingViewController as? UINavigationController else { return }
        dismiss(animated: true) {
            firstVC.popToRootViewController(animated: true)
        }
    }
}


