//
//  FlashCardTable.swift
//  smartcardsApp
//
//  Created by Oum Lahade on 12/6/20.
// TODO: MAKE SURE TO RESET WHEN PAGE IS REVISITED

import UIKit

class FlashCardTable: UIViewController , UITableViewDataSource {

    @IBOutlet var table: UITableView!
    
    let data = ["hola", "biblioteca", "como estas", "pantalones", "zapatos"]
    let vals = ["hola":"Hello", "biblioteca":"Library", "como estas":"How are you?", "pantalones":"pants", "zapatos":"shoes"]
    
    var father: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(CardRowTableViewCell.nib(), forCellReuseIdentifier: CardRowTableViewCell.identifier)
        table.dataSource = self
        navigationItem.title = father
        print(father)
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  CardRowTableViewCell.identifier, for: indexPath) as! CardRowTableViewCell
        cell.configure(with: data[indexPath.row])
        cell.delegate = self
        return cell
    }
   

}

extension FlashCardTable: CardRowTableViewCellDelegate{
    func didTapButton(with title: String) {
        print(title)
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "card") as! Card
        secondViewController.father = [title, vals[title]!]
        self.navigationController!.pushViewController(secondViewController, animated: true)
    }
}
