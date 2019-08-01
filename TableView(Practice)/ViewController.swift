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

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var spacing:CGFloat = 16.0
    var data = [CellData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing , left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        self.collectionView?.collectionViewLayout = layout
        
//        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.sectionInset = UIEdgeInsets.init(top: 0,left: 10,bottom: 0,right: 10)
//        layout.minimumInteritemSpacing = 5
//        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width - 20)/2, height: 280)
        
        data = [CellData.init(image: UIImage(named: "img_login"), message: "Something to start of! Something to start of Something to start of Something to start of Something to start of Something to start of Something to start of Something to start of Something to start of "), CellData.init(image: UIImage(named: "img_empty"), message: "Something to start of!"), CellData.init(image: UIImage(named: "img_login"), message: "Something to start of!"), CellData.init(image: UIImage(named: "img_location_illustration"), message: "Something to start of!"), CellData.init(image: UIImage(named: "img_empty"), message: "Something to start of!"), CellData.init(image: UIImage(named: "img_login"), message: "Something to start of!"), CellData.init(image: UIImage(named: "img_location_illustration"), message: "Something to start of!"), CellData.init(image: UIImage(named: "img_empty"), message: "Something to start of!"), CellData.init(image: UIImage(named: "img_login"), message: "Something to start of!"), CellData.init(image: UIImage(named: "img_location_illustration"), message: "Something to start of!")]
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection_cell", for: indexPath) as! CollectionViewCell
        cell.imageView.image  = data[indexPath.item].image
        //make the text uppercase
        cell.label.text = data[indexPath.item].message?.uppercased()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "2nd_page") as! PageTwoViewController
        vc.text = "\(indexPath)"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemPerRow: CGFloat = 2
        let spacingBetweenCells: CGFloat = 16
        
        //amount of total spacing in a row
        let totalSpacing = (2 * self.spacing) + ((numberOfItemPerRow - 1) * spacingBetweenCells)
        
            let width = (self.collectionView.bounds.width - totalSpacing) / numberOfItemPerRow
        
        if UIScreen.main.nativeBounds.height == 1136 {
            return CGSize(width: width, height: 260)
        }
            return CGSize(width: width, height: 280)
    }
}
