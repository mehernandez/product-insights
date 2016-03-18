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
    
    
    var items = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        let defaults = NSUserDefaults.standardUserDefaults()
        if let user = defaults.stringForKey("user")
        {
        
        Alamofire.request(.GET, "https://gentle-eyrie-60371.herokuapp.com/api/productos/usuario/"+user, parameters: ["limit": 10])
            .responseJSON
            { response in switch response.result {
            case .Success(let JSON):
                print("Success with JSON: \(JSON)")
                
                self.items = JSON as! NSArray
                
               /* let response = JSON[0] as! NSDictionary
                
                //example if there is an id
                let userId = response.objectForKey("thumbnail")!
                
                print(userId)

*/
                
                self.tableView.reloadData()
                
            case .Failure(let error):
                print("Request failed with error: \(error)")
                }
        }
        
        }
        
    }
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        

        
        return 1
    }


    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
     
        
        /*
        let parameters = [
        "foo": [1,2,3],
        "bar": [
        "baz": "qux"
        ]
        ]
        
        
        
        Alamofire.request(.POST, "https://gentle-eyrie-60371.herokuapp.com/api/relacionados", parameters: parameters, encoding: .JSON)
        .responseJSON { response in
        print(response.request)  // original URL request
        print(response.response) // URL response
        print(response.data)     // server data
        print(response.result)   // result of response serialization
        
        if let JSON = response.result.value {
        print("JSON: \(JSON)")
        }
        }
        */
        
        
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! mainTableViewCell
        
        
        /*let product = prod[indexPath.row]
        
        cell.img.image = UIImage(named: product["img"]!)
        
        cell.title.text = product["title"]
        
        cell.price.text = product["price"]
*/
        
        let product = items[indexPath.row]
        
        let im = product.objectForKey("thumbnail") as! String
        
        if let url  = NSURL(string: im),
            data = NSData(contentsOfURL: url)
        {
            cell.img.image = UIImage(data: data)
        }

        
        cell.title.text = product.objectForKey("title") as! String
        let num = product.objectForKey("price") as! Int
        
        cell.price.text = "$ \(num)"

        
        return cell
    }
    
}
