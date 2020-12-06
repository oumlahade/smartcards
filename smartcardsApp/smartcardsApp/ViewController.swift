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
            print("\tUsername \(String(describing: username))")
            print("\tPassword \(String(describing: password))")
            
            // switch to the flashcard screen
            let flashcardSetsViewController = self.storyboard?.instantiateViewController(withIdentifier: "flashcardSets") as! FlashcardSets
            let navController = UINavigationController(rootViewController: flashcardSetsViewController)
            navController.setToolbarHidden(false, animated: true)
            navController.modalPresentationStyle = .fullScreen
            navController.modalTransitionStyle = .crossDissolve

            self.navigationController?.present(navController, animated: true, completion: nil)
        }
        else {
            print("User not logged in")
        }
    }

}

