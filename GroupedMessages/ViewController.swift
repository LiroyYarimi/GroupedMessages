//
//  ViewController.swift
//  GroupedMessages
//
//  Created by liroy yarimi on 01/10/2018.
//  Copyright © 2018 Liroy Yarimi. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    fileprivate let cellId = "id"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true //make the title large
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = "We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line"

        cell.textLabel?.numberOfLines = 0//make the cell size dynamic
        
        return cell
    }


}

