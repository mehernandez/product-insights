//
//  firstTableViewController.swift
//  Product Insights
//
//  Created by Mario Hernandez on 3/13/16.
//  Copyright © 2016 Mario Hernandez. All rights reserved.
//

import UIKit
import Alamofire


class firstTableViewController : UITableViewController {
    
    
    let prod = [["img":"logo", "title":"bmw", "price":"$5.000.000"], ["img":"logo", "title":"Kawasaki", "price":"$15.000.000"]]
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        Alamofire.request(.GET, "/api/productos/usuario/"+"usuario", parameters: ["limit": 10])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prod.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! mainTableViewCell
        
        
        let product = prod[indexPath.row]
        
        cell.img.image = UIImage(named: product["img"]!)
        
        cell.title.text = product["title"]
        
        cell.price.text = product["price"]
        
        return cell
    }
    
}
