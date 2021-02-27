//
//  tagsCollectionViewCell.swift
//  TestQ&A
//
//  Created by Vlad on 27.02.2021.
//

import UIKit

class tagsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var background: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        background.layer.cornerRadius = 20
        background.backgroundColor = UIColor.systemGray
    }
    
    func initFromString(text: String) {
        label.text = text
    }
    
}
