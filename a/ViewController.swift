//
//  ViewController.swift
//  TableView_Person
//
//  Created by shubham Pandey on 20/09/19.
//  Copyright © 2019 shubham Pandey. All rights reserved.
//

import UIKit
import Foundation

enum Department {
    case iOS
    case android
    case frontend
    case backend
    case Testing
}
class ViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{
    
    let departments:[Department] = [.iOS, .android, .frontend, .backend, .Testing]
    var iOSArr : [ String] = ["Shubham Pandey" , "Komal Sharma" , "Ankur Barnwal" ,"Jaishankar Tiwari" ,"Sayeed Ali"]
    var androidArr : [String] = ["Partishtha " , "Kajal" , "Avinash" , "Sanjana" , "Babita"]
    var frontendArr : [String] = ["Savita" , "Radha" , "Deepika" ,"Kangana" , "Vasudha"]
    var backendArr : [String] = ["Piyush" , "Rishabh" , "Anupam" , "Kashish" ,"Gonic"]
    var TestingArr : [String] = ["Sandeep" , "Vineet" ,"Samar" , "Samridhi" , "Riya"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        switch departments[section] {
        case .iOS:
            return iOSArr.count
        case .android:
            return androidArr.count
        case .frontend :
            return frontendArr.count
        case .backend :
            return backendArr.count
        case .Testing:
            return TestingArr.count
//        default:
//            return 0
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName: String
        switch section {
        case 0:
            sectionName = "iOS"
            tableView.backgroundColor = .red
            tableView.separatorColor = .darkGray
        case 1:
            sectionName = "ANDROID"
            tableView.backgroundColor = .orange
        case 2:
            sectionName = "FRONTEND"
            tableView.backgroundColor = .red
        case 3:
            sectionName = "BACKEND"
           tableView.backgroundColor = .orange
        case 4:
            sectionName = "TESTING"
            tableView.backgroundColor = .red
        // ...
        default:
            sectionName = ""
        }
        return sectionName
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.textColor = .black
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return departments.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch departments[indexPath.section]{
        case .iOS:
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "iOSCell") as? iOSCell ?? UITableViewCell()
            cell1.textLabel?.text = iOSArr[indexPath.row]
            
            return cell1
            
        case .android:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "AndroidCell") as? AndroidCell ?? UITableViewCell()
            cell2.textLabel?.text = androidArr[indexPath.row]
            return cell2
        case .frontend:
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "FrontendCell") as? FrontendCell ?? UITableViewCell()
            cell3.textLabel?.text = frontendArr[indexPath.row]
            return cell3
        case .backend:
            let cell4 = tableView.dequeueReusableCell(withIdentifier: "BackendCell") as? BackendCell ?? UITableViewCell()
            cell4.textLabel?.text = backendArr[indexPath.row]
            return cell4
        case .Testing:
            let cell5 = tableView.dequeueReusableCell(withIdentifier: "TestingCell") as? TestingCell ?? UITableViewCell()
            cell5.textLabel?.text = TestingArr[indexPath.row]
            return cell5
        }
    
       
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
            switch departments[indexPath.section]
            {
            case .iOS:
                vc?.name = iOSArr[indexPath.row]
            case .android:
                  vc?.name = androidArr[indexPath.row]
            case .frontend:
                 vc?.name = frontendArr[indexPath.row]
            case .backend:
                    vc?.name = backendArr[indexPath.row]
            case .Testing:
                vc?.name = TestingArr[indexPath.row]
        }
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    @IBOutlet var TableView_Person: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView_Person.delegate = self
        TableView_Person.dataSource = self
        TableView_Person.register(UINib.init(nibName: "iOSCell", bundle:nil), forCellReuseIdentifier: "iOSCell")
        TableView_Person.register(UINib.init(nibName: "AndroidCell", bundle:nil), forCellReuseIdentifier: "AndroidCell")
        TableView_Person.register(UINib.init(nibName: "FrontendCell", bundle:nil), forCellReuseIdentifier: "FrontendCell")
        TableView_Person.register(UINib.init(nibName: "BackendCell", bundle:nil), forCellReuseIdentifier: "BackendCell")
        TableView_Person.register(UINib.init(nibName: "TestingCell", bundle:nil), forCellReuseIdentifier: "TestingCell")
    }
    
    
}

