//
//  ChatMessageCell.swift
//  GroupedMessages
//
//  Created by liroy yarimi on 03/10/2018.
//  Copyright © 2018 Liroy Yarimi. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {

    let messageLabel = UILabel()
    let bubbleBackgroundView = UIView()
    
    var isIncoming: Bool! {
        didSet{
            print(123)
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        bubbleBackgroundView.backgroundColor = .yellow
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        bubbleBackgroundView.layer.cornerRadius = 5
        addSubview(bubbleBackgroundView)
        
        addSubview(messageLabel)
//        messageLabel.backgroundColor = .green
        messageLabel.text = "We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line"
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
        messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
        messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32 ), //left side
        messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
//        messageLabel.widthAnchor.constraint(equalToConstant: 250),
        messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
        
        bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant:-16),
        bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant:-16),
        bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant:16),
        bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant:16)
        ]
        
        
        
        NSLayoutConstraint.activate(constraints)//make label active
        
//        messageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
