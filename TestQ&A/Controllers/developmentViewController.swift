//
//  developmentViewController.swift
//  TestQ&A
//
//  Created by Vlad on 26.02.2021.
//

import UIKit
import RxSwift
import RxCocoa

class developmentViewController: UIViewController, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    let DBag = DisposeBag()

    
    let testDataCategories = BehaviorRelay<[(String,String, Int)]>.init(value: [("Q&A","Задай свой вопрос!",1),("Курсы","Выбери свой!",2),("Статьи","Время разобраться!",3),("Новости","Что нового?",4),("Раздел","Описание!",5),("Q&A","Задай свой вопрос!",1),("Курсы","Выбери свой!",2),("Статьи","Время разобраться!",3),("Новости","Что нового?",4),("Раздел","Описание!",5)])
    
    let testDataCataloge = BehaviorRelay<[(Int,String,String,Int)]>.init(value:[(1,"Настроим ленту?","Повторяйте за нами!",1),(2,"Персональные статьи","Больше читаете - лучше подборка",2),(3,"Последние обновления","Посмотрите что теперь доступно",3),(4,"Доступные курсы","Учиться никогда не поздно!",4),(5,"Оставьте нам резенцию","Мы становимся лучше!",5),(1,"Настроим ленту?","Повторяйте за нами!",1),(2,"Персональные статьи","Больше читаете - лучше подборка",2),(3,"Последние обновления","Посмотрите что теперь доступно",3),(4,"Доступные курсы","Учиться никогда не поздно!",4),(5,"Оставьте нам резенцию","Мы становимся лучше!",5)])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        
        
//        let data = UIImage(systemName: "chevron.compact.right")!.pngData()
//        let bytes = getArrayOfBytesFromImage(imageData: data! as NSData)
//
//        print("oaoaoaoaoaoaoaao")
//        print(bytes)
//
//        let datos: NSData = NSData(bytes: bytes, length: bytes.count)
//        let newImage = UIImage(data: datos as Data)
        
        
        tableView.register(UINib(nibName: "catalogTableViewCell", bundle: nil), forCellReuseIdentifier: "catalogeCell")
        
        collectionView.register(UINib(nibName: "categoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "categoryCell")
        
        _ = testDataCataloge.bind(to: tableView.rx.items(cellIdentifier: "catalogeCell",cellType: catalogTableViewCell.self)) {
            (row,item,cell) in
            cell.initFromData(icon: item.0, newTitle: item.1, newSubtitle: item.2, color: item.3)
        }.disposed(by: DBag)
            
            
        _ = testDataCategories.bind(to: collectionView.rx.items(cellIdentifier: "categoryCell", cellType: categoryCollectionViewCell.self)) {
            (row,item,cell) in
            cell.initFromPair(newTitle: item.0, newSubtitle: item.1, color: item.2)
        }.disposed(by: DBag)
        
        
        
        
        collectionView
            .rx
            .itemSelected
            .subscribe(onNext: {
                [weak self] indexPath in
                if (indexPath[1] == 0) {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let detailVC = storyboard.instantiateViewController(withIdentifier: "goToQ&A") as! QAViewController
                    self?.navigationController?.pushViewController(detailVC, animated: true)
                }
            }).disposed(by: DBag)
    }
    
    func getArrayOfBytesFromImage(imageData:NSData) -> Array<UInt8>
    {

      // the number of elements:
      let count = imageData.length / MemoryLayout<Int8>.size

      // create array of appropriate length:
      var bytes = [UInt8](repeating: 0, count: count)

      // copy bytes into array
      imageData.getBytes(&bytes, length:count * MemoryLayout<Int8>.size)

      var byteArray:Array = Array<UInt8>()

      for i in 0 ..< count {
        byteArray.append(bytes[i])
      }

      return byteArray
    }
}
