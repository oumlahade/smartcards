//
//  LoginViewController.swift
//  smartcardsApp
//
//  Created by Neel Runton on 12/6/20.
//

import UIKit
import Alamofire

class Login: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func login(_ sender: Any) {
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
            spinner.startAnimating()
            let parameters = ["username": user, "password": pass]
                    
            AF.request("\(Http.url)/user.login", method: .post, parameters: parameters, encoding: JSONEncoding.default)
                .responseJSON { response in
                    switch response.result {
                        case .success(let value as [String: Any]):
                            if (value["message"] as! String == "user login successful") {
                                // if username and password are valid:
                                print("Authenticated with:")
                                print("\t\(user)")
                                print("\t\(pass)")
                                self.defaults.set(user, forKey: "username")
                                self.defaults.set(pass, forKey: "password")
                                self.spinner.stopAnimating()
                                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                            }
                            else {
                                print(value["message"]!)
                                print("Failed Authentication with:")
                                print("\t\(user)")
                                print("\t\(pass)")
                                let alert = UIAlertController(title: "Invalid Username or Password", message: "Your username or password is incorrect", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                                self.spinner.stopAnimating()
                                self.present(alert, animated: true)
                            }

                        case .failure(let error):
                            print(error)
                            let alert = UIAlertController(title: "Server Error", message: "The server encountered an error. Please try again later", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                            self.spinner.stopAnimating()
                            self.present(alert, animated: true)

                        default:
                            fatalError("received non-dictionary JSON response")
                    }
                }
        }
    }
}
