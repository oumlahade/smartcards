//
//  ViewController.swift
//  smartcardsApp
//
//  Created by Oum Lahade on 12/5/20.
//

import UIKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let username = defaults.string(forKey: "username")
        let password = defaults.string(forKey: "password")
        
        if (username != nil || password != nil) {
            print("User already logged in with credentials:")
            print("\tUsername \(username!)")
            print("\tPassword \(password!)")
            
            // switch to the flashcard screen
            self.performSegue(withIdentifier: "authenticatedSegue", sender: nil)
        }
        else {
            print("User not logged in")
        }
    }

}

