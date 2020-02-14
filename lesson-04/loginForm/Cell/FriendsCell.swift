//
//  FriendsCell.swift
//  loginForm
//
//  Created by prot on 10/02/2020.
//  Copyright © 2020 prot. All rights reserved.
//

import UIKit

class FriendsCell: UITableViewCell {
    
    
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var imageFriendView: UIImageView!
    @IBOutlet weak var shadowView: ShadowView!
    @IBOutlet weak var sortAlphabetLabel:UILabel!
    
    override func layoutSublayers(of layer: CALayer) {
        imageFriendView.layer.cornerRadius = 35
        shadowView.configure()
        
        
        
        
    }
    
}

@IBDesignable class ShadowView: UIView{
    
    @IBInspectable var color:UIColor = .black
    @IBInspectable var opacity:Float = 1
    @IBInspectable var radius:CGFloat = 10
    
     func configure() {
           
            layer.cornerRadius = 34
            layer.shadowColor = color.cgColor
            layer.shadowOpacity = opacity
            layer.shadowOffset = .zero
            layer.shadowRadius = radius
            backgroundColor = .white
        
       }
    
}


