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
        //        cell.image1?.image = UIImage(named: "bangjja")
        //        cell.topTitle?.text = "하이"
        //        cell.bottomDescription?.text = "오만방자한 글으투입니다"
        ////        var content = cell.defaultContentConfiguration()
        ////        content.secondaryText = "hi"
        
        var content = cell.defaultContentConfiguration()
        
        content.text = "하이"
        content.textProperties.font = UIFont.systemFont(ofSize: 20) // 폰트 사이즈
        content.image = UIImage(named: "bangjja")
        content.imageProperties.maximumSize.height = 30 // 이미지 높이
        content.imageProperties.maximumSize.width = 30
        content.secondaryText = "오만방자한 글으투입니다"

        
        cell.contentConfiguration = content
        
        /* 셀 자체 커스텀은 cell에서 직접 접근 */
        
        
        
        return cell
    }
}

