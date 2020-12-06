//
//  CardRowTableViewCell.swift
//  smartcardsApp
//
//  Created by Oum Lahade on 12/6/20.
//

import UIKit

protocol CardRowTableViewCellDelegate: AnyObject {
    func didTapButton(with title: String)
}

class CardRowTableViewCell: UITableViewCell {

    weak var delegate: CardRowTableViewCellDelegate?
    
    static let identifier = "CardRowTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CardRowTableViewCell", bundle: nil)
    }
    
    @IBOutlet var button: UIButton!
    private var title: String = ""
    
    @IBAction func didTapButton() {
        delegate?.didTapButton(with: title)
    }
    
    func configure (with title: String){
        self.title = title
        button.setTitle(title, for: .normal)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        button.setTitleColor(.link, for: .normal)
    }

    
}
