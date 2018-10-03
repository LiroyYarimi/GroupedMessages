//
//  ViewController.swift
//  GroupedMessages
//
//  Created by liroy yarimi on 01/10/2018.
//  Copyright © 2018 Liroy Yarimi. All rights reserved.
//

import UIKit

struct ChatMessage {
    let text: String
    let isComing: Bool
}

class ViewController: UITableViewController {
    
    fileprivate let cellId = "id"
    
    let chatMessages = [
        ChatMessage(text: "Here's my very firsy message", isComing: true),
        ChatMessage(text: "We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line", isComing: true),
        ChatMessage(text: "We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line, We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line , We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line", isComing: false),
        ChatMessage(text: "great!", isComing: true),

    ]
    
//    let textMessages = [
//        "Here's my very fisrt message",
//        "We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line",
//        "We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line, We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line , We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line"
//        ,"great!"
//    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true //make the title large
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none //delete the separator line
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return chatMessages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
        
        let chatMessage = chatMessages[indexPath.row]

//        cell.messageLabel.text = chatMessage.text
//        cell.isIncoming = chatMessage.isComing
        
        cell.chatMessage = chatMessage
        
        return cell
    }


}

