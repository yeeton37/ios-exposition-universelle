//
//  ExhibitOfKoreaViewController.swift
//  Expo1900
//
//  Created by 최정민 on 2021/04/09.
//

import UIKit

class ExhibitOfKoreaViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    private var exhibitItem: [ExhibitItem] = []
    private var tableViewIndex: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.topItem?.title = "메인"
        self.navigationItem.title = "한국의 출품작"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let tableViewNib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(tableViewNib, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        
        switch initExpoData(fileName: FileName.items, model: [ExhibitItem].self) {
        case .success(let data):
            exhibitItem = data
        case .failure(let error):
            print(error.localizedDescription)
        }
        
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
}

extension ExhibitOfKoreaViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
            return exhibitItem.count
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            guard let cell = tableView.dequeueReusableCell(withIdentifier : TableViewCell.reuseIdentifier ) as? TableViewCell else {
                return UITableViewCell()
            }
            
            cell.exhibitItemImage.image = UIImage(named: exhibitItem[indexPath.row].imageName)
            cell.exhibitItemName.text = exhibitItem[indexPath.row].name
            cell.exhibitItemShortDescription.text = exhibitItem[indexPath.row].shortDescriptions
            cell.exhibitItemShortDescription.numberOfLines = 0
            
            return cell
        }
}

extension ExhibitOfKoreaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableViewIndex = indexPath.row
        self.performSegue(withIdentifier: SegueIdentifier.exhibitOfKoreaToExhibitOfKoreaItem, sender: nil)
    }
}

extension ExhibitOfKoreaViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination
        
        guard let exhibitItemViewController = destination as? ExhibitItemViewController else {
            return
        }
        
        exhibitItemViewController.tableViewIndex = self.tableViewIndex
    }
}
