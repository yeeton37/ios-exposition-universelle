//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class KoreaEntry: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.imageView?.image = UIImage(named: "bangjja")
        cell.topTitle?.text = "하이"
        cell.bottomDescription?.text = "오만방자한 글으투입니다"
//        var content = cell.defaultContentConfiguration()
//        content.secondaryText = "hi"
        
        return cell
    }
}

