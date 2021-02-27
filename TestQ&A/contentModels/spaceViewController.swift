//
//  spaceViewController.swift
//  TestQ&A
//
//  Created by Vlad on 27.02.2021.
//

import UIKit
import RxCocoa
import RxSwift

class spaceViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let DBag = DisposeBag()
    
    let itemBeginning = PublishSubject<[Product]>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareController()
        
        tableView.register(UINib(nibName: "beginningTableViewCell", bundle: nil), forCellReuseIdentifier: "contentCell")
        tableView.register(UINib(nibName: "endingTableViewCell", bundle: nil), forCellReuseIdentifier: "contentCell")
        tableView.register(UINib(nibName: "contentTableViewCell", bundle: nil), forCellReuseIdentifier: "contentCell")
        
        
        
        
    }
    
    func prepareController() {
        let barView = UIView(frame: CGRect(x: view.frame.width/12, y: view.frame.height-84, width: view.frame.width*5/6, height: 60))
        barView.backgroundColor = UIColor.systemYellow
        view.addSubview(barView)
        barView.layer.cornerRadius = 30
        
        let newTextButton = UIButton(frame: CGRect(x: ((barView.frame.width-40)*0/4)+20+(((barView.frame.width-40)*1/4-40)/2), y: 10, width: 40, height: 40))
//        newTextButton.imageView?.image = UIImage(systemName: "xmark")
        newTextButton.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
//        newTextButton.titleLabel?.text = "D"
//        newTextButton.backgroundColor = UIColor.yellow
        barView.addSubview(newTextButton)
        
        let newPhotoButton = UIButton(frame: CGRect(x: ((barView.frame.width-40)*1/4)+20+(((barView.frame.width-40)*1/4-40)/2), y: 10, width: 40, height: 40))
        newPhotoButton.setImage(UIImage(systemName: "camera.on.rectangle"), for: .normal)
//        newPhotoButton.backgroundColor = UIColor.yellow
        barView.addSubview(newPhotoButton)
        
        let newVideoButton = UIButton(frame: CGRect(x: ((barView.frame.width-40)*2/4)+20+(((barView.frame.width-40)*1/4-40)/2), y: 10, width: 40, height: 40))
        newVideoButton.setImage(UIImage(systemName: "video"), for: .normal)
//        newVideoButton.backgroundColor = UIColor.yellow
        barView.addSubview(newVideoButton)
        
        let newOprButton = UIButton(frame: CGRect(x: ((barView.frame.width-40)*3/4)+20+(((barView.frame.width-40)*1/4-40)/2), y: 10, width: 40, height: 40))
        newOprButton.setImage(UIImage(systemName: "person.2"), for: .normal)
//        newOprButton.backgroundColor = UIColor.yellow
        barView.addSubview(newOprButton)
        
    }
    
    @IBAction func xButtonTap(_ sender: Any) {
    }
    
    @IBAction func settingsButtonTap(_ sender: Any) {
        
    }
    
    @IBAction func doneButtonTap(_ sender: Any) {
        
    }
}
