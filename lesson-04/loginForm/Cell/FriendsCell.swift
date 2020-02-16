//
//  FriendsCell.swift
//  loginForm
//
//  Created by prot on 10/02/2020.
//  Copyright © 2020 prot. All rights reserved.
//

import UIKit

class FriendsCell: UITableViewCell {
    
    @IBOutlet weak var shadowView:ShadowView!
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var imageFriendView: UIImageView!
    
    
    override func layoutSublayers(of layer: CALayer) {
        imageFriendView.layer.cornerRadius = 35
        shadowView.backgroundColor = .red
        shadowView.animation()
        
        
        
        
        
//        shadowView.backgroundColor = .red
//        let maskLayer = CAShapeLayer()
//        let starPath = UIBezierPath()
//        starPath.move(to: CGPoint(x: 40, y: 20))
//        starPath.addLine(to: CGPoint(x: 45, y: 40))
//        starPath.addLine(to: CGPoint(x: 65, y: 40))
//        starPath.addLine(to: CGPoint(x: 50, y: 50))
//        starPath.addLine(to: CGPoint(x: 60, y: 70))
//        starPath.addLine(to: CGPoint(x: 40, y: 55))
//        starPath.addLine(to: CGPoint(x: 20, y: 70))
//        starPath.addLine(to: CGPoint(x: 30, y: 50))
//        starPath.addLine(to: CGPoint(x: 15, y: 40))
//        starPath.addLine(to: CGPoint(x: 35, y: 40))
//        starPath.close()
//        starPath.stroke()
//        maskLayer.path = starPath.cgPath // Тот path, с помощью которого рисовали звезду
//        shadowView.layer.mask = maskLayer
//        shadowView.layer.mask = CAShapeLayer()
//        let shadowLayer = CAShapeLayer()
//        //shadowLayer.path = imageFriendView
//        shadowLayer.path = starPath.cgPath
//        shadowLayer.frame = shadowView.frame
//        shadowLayer.shadowColor = UIColor.black.cgColor
//        shadowLayer.shadowOpacity = 0.5
//        shadowLayer.shadowRadius = 2
//        shadowLayer.shadowOffset = CGSize(width: 4, height: 4)
//
//        shadowView.superview?.layer.insertSublayer(shadowLayer, below: shadowView.layer)
   }
    
}

@IBDesignable class ShadowView: UIView{
    
    @IBInspectable var color:UIColor = .black
    @IBInspectable var opacity:Float = 1
    @IBInspectable var radius:CGFloat = 10

     func animation() {
            layer.cornerRadius = 34
            layer.shadowColor = color.cgColor
            layer.shadowOpacity = opacity
            layer.shadowOffset = CGSize(width: 4, height: 4)
            layer.shadowRadius = radius
            backgroundColor = .white

       }

}


