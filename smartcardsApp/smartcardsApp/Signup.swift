//
//  Credentials.swift
//  smartcardsApp
//
//  Created by Oum Lahade on 12/5/20.
//

import UIKit
import Alamofire

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
            let parameters = ["username": user, "password": pass]
                    
            AF.request("http://quickstart-1603319439833.ue.r.appspot.com/user.signup", method: .post, parameters: parameters, encoding: JSONEncoding.default)
                .responseJSON { response in
                    switch response.result {
                        case .success(let value as [String: Any]):
                            if (value["message"] as! String == "user created") {
                                // if username and password are valid:
                                print(user)
                                print(pass)
                                self.defaults.set(user, forKey: "username")
                                self.defaults.set(pass, forKey: "password")
                                self.performSegue(withIdentifier: "signupSegue", sender: nil)
                            }
                            else {
                                let alert = UIAlertController(title: "Invalid username", message: "That username has already been taken", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                                self.present(alert, animated: true)
                            }

                        case .failure(let error):
                            print(error)
                            let alert = UIAlertController(title: "Server Error", message: "The server encountered an error. Please try again later", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                            self.present(alert, animated: true)

                        default:
                            fatalError("received non-dictionary JSON response")
                    }
                }
            
        }
    }

}
