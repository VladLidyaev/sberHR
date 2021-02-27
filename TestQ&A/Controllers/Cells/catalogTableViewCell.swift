//
//  catalogTableViewCell.swift
//  TestQ&A
//
//  Created by Vlad on 27.02.2021.
//

import UIKit

class catalogTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var back: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        back.layer.cornerRadius = 10
        background.image = UIImage(systemName: "chevron.compact.right")
    }
    
    
    func initFromData(icon: Int, newTitle: String, newSubtitle: String, color: Int) {
        self.icon.image = UIImage(systemName: getIcon(num: icon))
        title.text = newTitle
        subtitle.text = newSubtitle
        back.backgroundColor = getColor(num: color)
    }
    
    func getIcon(num: Int) -> (String){
        switch num {
        case 5:
            return "character.book.closed.ja"
        case 4:
            return "square.grid.3x3.fill.square"
        case 3:
            return "internaldrive"
        case 2:
            return "greetingcard"
        case 1:
            return "case"
        default:
            return "square.grid.3x3.fill.square"
        }
    }
    
    func getColor(num: Int) -> (UIColor) {
        switch num {
        case 5:
            return UIColor.systemRed
        case 4:
            return UIColor.systemYellow
        case 3:
            return UIColor.systemBlue
        case 2:
            return UIColor.systemGreen
        case 1:
            return UIColor.systemOrange
        default:
            return UIColor.systemPink
        }
    }
}
