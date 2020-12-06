//
//  CardSetTableViewCell.swift
//  smartcardsApp
//
//  Created by Oum Lahade on 12/6/20.
//

import UIKit

protocol CardSetTableViewCellDelegate: AnyObject {
    func didTapButton(with title: String)
}

class CardSetTableViewCell: UITableViewCell {
    
    weak var delegate: CardSetTableViewCellDelegate?
    
    static let identifier = "CardSetTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CardSetTableViewCell", bundle: nil)
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
