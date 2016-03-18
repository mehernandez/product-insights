//
//  ViewController.swift
//  Product Insights
//
//  Created by Mario Hernandez on 3/13/16.
//  Copyright © 2016 Mario Hernandez. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func seleccionarUsuario(){
        
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(textField.text, forKey: "user")
    }


}

