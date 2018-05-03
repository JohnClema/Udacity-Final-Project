//
//  PictureOfTheDayViewController.swift
//  
//
//  Created by John Clema on 30/4/18.
//

import UIKit
import Cards

class PictureOfTheDayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.brown
        self.navigationController?.isNavigationBarHidden = true
        
        self.tableView = UITableView(frame: self.view.bounds)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView!)

        // Aspect Ratio of 5:6 is preferred
        
        
//        self.view.addSubview(card)
    }
    
    func initCard() -> CardHighlight {
        let frame = self.tableView!.frame
        
        return card
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.width * 1.6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel!.text = "Nice"
        let card = self.initCard()
        cell.addSubview(card)
        return cell
    }
    
    
}
