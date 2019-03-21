//
//  ProductEnqueryViewController.swift
//  ChemistHelper
//
//  Created by MATTEW MA on 14/3/19.
//  Copyright © 2019 Mathhew MA. All rights reserved.
//

import UIKit
import SwipeCellKit
import SDWebImage
import SVProgressHUD

class ProductEnqueryViewController: UITableViewController, UISearchBarDelegate {
    
    
    
    private let database = DataBase()
    private var productArray: [Product] = [Product]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CustomProductCell", bundle: nil), forCellReuseIdentifier: "customProductCell")
        configureTableView()
        searchBar.delegate = self
        self.title = "Product Search"
    }
    
   
    //MARK:- Searching Bar Method
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        SVProgressHUD.show()
        database.searchProduct(searchBar.text!) { (result) in
            if let resultObtained = result{
                self.productArray = resultObtained
                self.tableView.reloadData()
            }
        }
        SVProgressHUD.dismiss()
    }
    
    
    
    //MARK:- tableview Configuration Method
    func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150.0
        tableView.separatorStyle = .singleLine
    }
    
    //MARK:- Tableview delegate methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customProductCell", for: indexPath) as! CustomProductCell
        cell.productName.text = productArray[indexPath.row].getName()
        cell.productPrice.text = productArray[indexPath.row].getPrice()
        cell.productRetailer.text = productArray[indexPath.row].getRetailer()
        if let imageUrl = productArray[indexPath.row].getImageURL(){
            cell.productImage.sd_setImage(with: URL(string: imageUrl))
        }
        return cell
    }
    
    //MARK:- Tableview DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArray.count
    }
    
   

}
