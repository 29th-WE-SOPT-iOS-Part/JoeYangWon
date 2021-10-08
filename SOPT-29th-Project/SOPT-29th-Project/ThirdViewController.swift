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
        if let nameTxt = nameText {
            nameLabel.text = nameTxt
        }
    }
    
    
    

    @IBAction func dismissBtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
