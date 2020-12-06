//
//  FlashCardTable.swift
//  smartcardsApp
//
//  Created by Oum Lahade on 12/6/20.
//

import UIKit

class FlashCardTable: UIViewController , UITableViewDataSource {

    @IBOutlet var table: UITableView!
    
    let data = ["1", "2", "3", "4", "5"]
    
    var father: String = ""
    
    override func viewDidLoad() {
        print(father)
        super.viewDidLoad()
        table.register(CardRowTableViewCell.nib(), forCellReuseIdentifier: CardRowTableViewCell.identifier)
        table.dataSource = self

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
    }
}
