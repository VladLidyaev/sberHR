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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareController()
        
    }
    
    func prepareController() {
        let barView = UIView(frame: CGRect(x: view.frame.width/8, y: view.frame.height-72, width: view.frame.width*3/4, height: 60))
        barView.backgroundColor = UIColor.systemBlue
        view.addSubview(barView)
        ba
    }
    
    @IBAction func xButtonTap(_ sender: Any) {
    }
    
    @IBAction func settingsButtonTap(_ sender: Any) {
        
    }
    
    @IBAction func doneButtonTap(_ sender: Any) {
        
    }
}
