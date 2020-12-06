//
//  Card.swift
//  smartcardsApp
//
//  Created by Oum Lahade on 12/6/20.
//

import UIKit

class Card: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        term.text = father
        // Do any additional setup after loading the view.
    }
    
    var father: String = ""
    
    @IBOutlet var term: UILabel!
    @IBOutlet var def: UILabel!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
