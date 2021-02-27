//
//  QAViewController.swift
//  TestQ&A
//
//  Created by Vlad on 27.02.2021.
//

import UIKit
import RxSwift
import RxCocoa

class QAViewController: UIViewController {

    @IBOutlet weak var beackgroundView: UIView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let DBag = DisposeBag()
    
    let mainData = BehaviorRelay<[shortQuestion]>.init(value:[])
    
    let tags = BehaviorRelay<[String]>.init(value:["#Разработка","#Аналитика","#Python","#Java","#Swift","#Хабр","#Всякое"])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beackgroundView.layer.cornerRadius = 10
        
        
        tableView.register(UINib(nibName: "questionTableViewCell", bundle: nil), forCellReuseIdentifier: "questionCell")
        
        collectionView.register(UINib(nibName: "tagsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "tagCell")
        
        _ = mainData.bind(to: tableView.rx.items(cellIdentifier: "questionCell",cellType: questionTableViewCell.self)) {
            (row,item,cell) in
            cell.initFromData(data: item)
        }.disposed(by: DBag)
            
            
        _ = tags.bind(to: collectionView.rx.items(cellIdentifier: "tagCell", cellType: tagsCollectionViewCell.self)) {
            (row,item,cell) in
            cell.initFromString(text: item)
        }.disposed(by: DBag)
        
        updateQuestions()
        
        tableView.separatorStyle = .none
        
    }
    
    
    private func updateQuestions() {
        var newData = [shortQuestion]()
        for i in 1...10 {
            let semaphore = DispatchSemaphore(value: 1)
            DispatchQueue.global(qos: .userInitiated).async {
                shortQuestionsDataProvider(id: i).getList { (result) in
                    switch result {
                    case .success(let data):
                        newData.append(data)
                        self.mainData.accept(newData)
                        print("rrr")
                        semaphore.signal()
                    case .failure(_):
                        print("meeee....:(")
                        semaphore.signal()
                    }
                }
                semaphore.wait()
            }
        }
//        mainData.accept(newData)
    }
    
    
    @IBAction func addQuestion(_ sender: Any) {
    }
}
