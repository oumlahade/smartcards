//
//  Card.swift
//  smartcardsApp
//
//  Created by Oum Lahade on 12/6/20.
//

import UIKit

class Card: UIViewController {
    
    let data = ["Hello", "Library", "How are you?", "pants", "shoes"]

    override func viewDidLoad() {
        super.viewDidLoad()
        term.text = father[0]
        // Do any additional setup after loading the view.
        def.text = father[1]
    }
    
    var father: [String] = []
    
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
