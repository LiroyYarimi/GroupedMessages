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
    let date: Date
}

extension Date{
    static func dateFromCustomString(customString: String) -> Date{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy" //"MM/dd/yyyy" //
        return dateFormatter.date(from: customString) ?? Date()

    }
    //$$$
    func reduceToMonthDayYear() -> Date {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: self)
        let day = calendar.component(.day, from: self)
        let year = calendar.component(.year, from: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: "\(day)/\(month)/\(year)") ?? Date()
    }
}

class ViewController: UITableViewController {
    
    fileprivate let cellId = "id"
    
//    let chatMessages = [
//        [
//            ChatMessage(text: "Here's my very firsy message", isComing: true, date: Date.dateFromCustomString(customString: "03/08/2018")),
//            ChatMessage(text: "We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line", isComing: true, date: Date.dateFromCustomString(customString: "03/08/2018"))
//        ],
//        [
//            ChatMessage(text: "We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line, We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line , We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line", isComing: false, date: Date.dateFromCustomString(customString: "15/09/2018")),
//            ChatMessage(text: "great!", isComing: true, date: Date.dateFromCustomString(customString: "15/09/2018"))
//        ],
//        [
//            ChatMessage(text: "third section message", isComing: true, date: Date.dateFromCustomString(customString: "31/10/2018"))
//        ]
//    ]
    
    let messagesFromServer = [
        ChatMessage(text: "Here's my very firsy message", isComing: true, date: Date.dateFromCustomString(customString: "03/08/2018")),
        ChatMessage(text: "We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line", isComing: true, date: Date.dateFromCustomString(customString: "03/08/2018")),
        ChatMessage(text: "We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line, We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line , We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line", isComing: false, date: Date.dateFromCustomString(customString: "15/09/2018")),
        ChatMessage(text: "great!", isComing: true, date: Date.dateFromCustomString(customString: "15/09/2018")),
        ChatMessage(text: "third section message", isComing: true, date: Date.dateFromCustomString(customString: "31/10/2018")),
        ChatMessage(text: "very old message", isComing: true, date: Date.dateFromCustomString(customString: "12/10/2015"))
    ]
    
    var chatMessages = [[ChatMessage]]()
    
    fileprivate func attemptToAssembleGroupedMessages(){

        let groupedMessages = Dictionary(grouping: messagesFromServer) { (element) -> Date in
            return element.date
        }
        
        //sort by the date
        let sortedKeys = groupedMessages.keys.sorted()
        
        sortedKeys.forEach { (key) in
            let values = groupedMessages[key]
            chatMessages.append(values ?? [])
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        attemptToAssembleGroupedMessages()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true //make the title large
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none //delete the separator line
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    class DateHeaderLabel: UILabel{
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            backgroundColor = .black
            textColor = .white
            textAlignment = .center
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        //this is for make the label background view a little larger
        override var intrinsicContentSize: CGSize{
            let originalContenSize = super.intrinsicContentSize
            let height = originalContenSize.height + 12
            layer.cornerRadius = height / 2
            layer.masksToBounds = true
            return CGSize(width: originalContenSize.width + 20, height: height)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if let firstMessageInSection = chatMessages[section].first{ //chatMessages[section][0]
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy" //"MM/dd/yyyy"
            let dateString = dateFormatter.string(from: firstMessageInSection.date)
            
            
            let label = DateHeaderLabel()
            label.text = dateString
            label.font = UIFont.boldSystemFont(ofSize: 14)
            let containerView = UIView()
            //        containerView.layer.cornerRadius = containerView.frame.width / 2
            
            containerView.addSubview(label)
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            
            return containerView
        }
        return nil
        
    }
    
    //make a spacing between the first header to the top anchor
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//        if let firstMessageInSection = chatMessages[section].first{ //chatMessages[section][0]
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "dd/MM/yyyy" //"MM/dd/yyyy"
//            let dateString = dateFormatter.string(from: firstMessageInSection.date)
//            return dateString
//        }
//
//        return "Section: \(Date())"
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return chatMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
        
//        let chatMessage = chatMessages[indexPath.row]

        let chatMessage = chatMessages[indexPath.section][indexPath.row]
        cell.chatMessage = chatMessage
        
        return cell
    }


}

