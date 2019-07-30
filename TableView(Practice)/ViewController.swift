//
//  ViewController.swift
//  TableView(Practice)
//
//  Created by Walid AITS on 7/30/19.
//  Copyright © 2019 Walid AITS. All rights reserved.
//

import UIKit

struct CellData{
    let image: UIImage?
    let message: String?
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    

    var data = [CellData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        data = [CellData.init(image: UIImage(named: "img_login"), message: "Something to start of! Something to start of Something to start of Something to start of Something to start of Something to start of Something to start of Something to start of Something to start of "), CellData.init(image: UIImage(named: "img_empty"), message: "Something to start of!"), CellData.init(image: UIImage(named: "img_login"), message: "Something to start of!"), CellData.init(image: UIImage(named: "img_location_illustration"), message: "Something to start of!")]
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection_cell", for: indexPath) as! CollectionViewCell
        cell.imageView.image  = data[indexPath.item].image
        cell.label.text = data[indexPath.item].message
        return cell
    }
    
}

