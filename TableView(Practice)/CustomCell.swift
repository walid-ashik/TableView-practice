//
//  CustomCell.swift
//  TableView(Practice)
//
//  Created by Walid AITS on 7/30/19.
//  Copyright © 2019 Walid AITS. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell{
    
    var message: String?
    var thumbnail: UIImage?
    
    var messageView : UITextView = {
       var textview = UITextView()
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.isScrollEnabled = false 
        return textview
    }()
    
    var thumbnailView: UIImageView = {
       var imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(thumbnailView)
        self.addSubview(messageView)
        
        //show vertical linear style
        thumbnailView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        thumbnailView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        thumbnailView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        thumbnailView.bottomAnchor.constraint(equalTo: self.messageView.topAnchor).isActive = true
        
        //define the height otherwise it'll get the image default height and look messy
        thumbnailView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        messageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        messageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        messageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        //this will show image and text besides
        
//        thumbnailView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        thumbnailView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        thumbnailView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        thumbnailView.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        thumbnailView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//
//        messageView.leftAnchor.constraint(equalTo: thumbnailView.rightAnchor).isActive = true
//        messageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        messageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        messageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let message = message {
            messageView.text = message
        }
        
        if let thumbnail = thumbnail{
            thumbnailView.image = thumbnail
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
