//
//  ViewController.swift
//  Collection View
//
//  Created by Macbook Air 2017 on 8. 11. 2023..
//

import UIKit

class ViewController: UIViewController {
    
    let princesses = [
        Princess(name: "Jasmine", imageName: "jasmine"),
        Princess(name: "Rapunzel", imageName: "rapunzel"),
        Princess(name: "Cinderella", imageName: "cinderella"),
        Princess(name: "Ariel", imageName: "ariel"),
        Princess(name: "Belle", imageName: "belle"),
        Princess(name: "Snow White", imageName: "snowwhite"),
        Princess(name: "Aurora", imageName: "aurora"),
        Princess(name: "Pocahontas", imageName: "pocahontas"),
        Princess(name: "Mulan", imageName: "mulan"),
        Princess(name: "Tiana", imageName: "tiana"),
        Princess(name: "Merida", imageName: "merida"),
        Princess(name: "Raya", imageName: "raya")
    ]
    
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: 170, height: 170)
        flowLayout.sectionInset = UIEdgeInsets(top: 3,
                                               left: 3,
                                               bottom: 3,
                                               right: 3)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collection.showsVerticalScrollIndicator = true
        collection.showsHorizontalScrollIndicator = false
        collection.allowsSelection = false
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setCollectionView()
    }
    
    private func setCollectionView() {
        view.addSubview(collectionView)
        collectionView.frame = CGRect(x: 0,
                                      y: 100,
                                      width: view.frame.size.width,
                                      height: view.frame.size.height - 100)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return princesses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let princess = princesses[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        cell.configure(with: princess)
        return cell
    }
}
