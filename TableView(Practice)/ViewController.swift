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

class ViewController: UITableViewController {

    var data = [CellData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = [CellData.init(image: UIImage(named: "img_login"), message: "Something to start of! Something to start of Something to start of Something to start of Something to start of Something to start of Something to start of Something to start of Something to start of "), CellData.init(image: UIImage(named: "img_empty"), message: "Something to start of!"), CellData.init(image: UIImage(named: "img_login"), message: "Something to start of!"), CellData.init(image: UIImage(named: "img_location_illustration"), message: "Something to start of!")]
        
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "custom_cell")
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 200
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom_cell") as! CustomCell
        cell.thumbnail = data[indexPath.row].image
        cell.message = data[indexPath.row].message
        cell.layoutSubviews()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }


}

