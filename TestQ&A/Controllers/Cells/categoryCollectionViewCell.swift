//
//  categoryCollectionViewCell.swift
//  TestQ&A
//
//  Created by Vlad on 26.02.2021.
//

import UIKit

class categoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var back: UIView!
    
    let radius = CGFloat(10)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        back.layer.cornerRadius = radius
    }

    func initFromPair(newTitle: String, newSubtitle: String, color: Int) {
        title.text = "none"
        subtitle.text = "none"
        title.text = newTitle
        subtitle.text = newSubtitle
        back.backgroundColor = getColor(num: color)
    }
    
    func getColor(num: Int) -> (UIColor) {
        switch num {
        case 1:
            return UIColor.systemRed
        case 2:
            return UIColor.systemYellow
        case 3:
            return UIColor.systemBlue
        case 4:
            return UIColor.systemGreen
        case 5:
            return UIColor.systemOrange
        default:
            return UIColor.systemPink
        }
    }
}
