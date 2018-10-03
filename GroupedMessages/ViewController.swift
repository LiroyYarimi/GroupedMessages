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
    
    let textMessages = [
        "Here's my very fisrt message",
        "We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line",
        "We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line, We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line , We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line"
        ,"great!"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true //make the title large
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none //delete the separator line
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return textMessages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
//        cell.textLabel?.text = "We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line"

//        cell.textLabel?.numberOfLines = 0//make the cell size dynamic
        
        cell.messageLabel.text = textMessages[indexPath.row]
        
        return cell
    }


}

