//
//  Credentials.swift
//  smartcardsApp
//
//  Created by Oum Lahade on 12/5/20.
//

import UIKit

class Signup: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signup(_ sender: Any) {
        let user = username.text!
        let pass = password.text!
        
        // do checks
        if (user.count == 0) {
            let alert = UIAlertController(title: "Invalid Username", message: "You must enter a username", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else if (pass.count < 6) {
            let alert = UIAlertController(title: "Invalid Password", message: "Your password must be at least 6 characters long", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else {
            // do request to see if username and password is valid
            
            // if username and password are valid:
            print(user)
            print(pass)
            //defaults.set(user, forKey: "username")
            //defaults.set(pass, forKey: "password")
            self.performSegue(withIdentifier: "signupSegue", sender: nil)
        }
    }

}
