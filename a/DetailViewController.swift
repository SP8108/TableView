//
//  DetailViewController.swift
//  TableView_Person
//
//  Created by shubham Pandey on 20/09/19.
//  Copyright © 2019 shubham Pandey. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
     var name = ""
    @IBOutlet weak var name_Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        name_Label.text = name
    }
    
   
   

}
