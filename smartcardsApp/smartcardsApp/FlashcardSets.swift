//
//  FlashCardSets.swift
//  smartcardsApp
//
//  Created by Oum Lahade on 12/5/20.
//

import UIKit

class FlashcardSets: UIViewController , UITableViewDataSource {

    @IBOutlet var table: UITableView!
    
    let data = ["Biology Unit 1 Vocab", "Chemistry Practice Problems", "Math Symbol Definitions", "Spanish Vocab", "Thermodynamics Laws"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(CardSetTableViewCell.nib(), forCellReuseIdentifier: CardSetTableViewCell.identifier)
        table.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  CardSetTableViewCell.identifier, for: indexPath) as! CardSetTableViewCell
        cell.configure(with: data[indexPath.row])
        cell.delegate = self
        return cell
    }
   

}

extension FlashcardSets: CardSetTableViewCellDelegate {
    func didTapButton(with title: String) {
        //print(title)
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "FlashCardTable") as! FlashCardTable
        secondViewController.father = title
        self.navigationController!.pushViewController(secondViewController, animated: true)
    }
}
