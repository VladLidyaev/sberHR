//
//  questionTableViewCell.swift
//  TestQ&A
//
//  Created by Vlad on 27.02.2021.
//

import UIKit

class questionTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var solvedOrNo: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var like : UIButton!
    @IBOutlet weak var countLikes: UILabel!
    @IBOutlet weak var countDisLike: UILabel!
    @IBOutlet weak var dislike: UIButton!
    @IBOutlet weak var bookmark : UIButton!
    @IBOutlet weak var name : UILabel!
    
    @IBOutlet weak var back: UIView!
    @IBOutlet weak var background: UIView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        background.layer.cornerRadius = 10
        background.backgroundColor = UIColor.systemGray2
        collectionView.backgroundColor = UIColor.systemGray2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    func initFromData(data : shortQuestion) {
        title.text = data.header
        points.text = String(data.rating!)
        if data.isSolved! {
            solvedOrNo.imageView?.image = UIImage(systemName: "checkmark.seal.fill")
        } else {
            solvedOrNo.imageView?.image = UIImage(systemName: "checkmark.seal")
        }
        name.text = data.createdBy
    }
}
