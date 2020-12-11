//
//  UserInformation.swift
//  smartcardsApp
//
//  Created by Neel Runton on 12/11/20.
//

import UIKit

class UserInformation: UIViewController {

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var password: UILabel!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        username.text = defaults.string(forKey: "username")
        password.text = defaults.string(forKey: "password")
    }
}
