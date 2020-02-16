//
//  FriendsCollectionCell.swift
//  loginForm
//
//  Created by prot on 10/02/2020.
//  Copyright © 2020 prot. All rights reserved.
//

import UIKit

class FriendsCollectionCell: UICollectionViewCell {
    
    @IBOutlet var friendImageView: UIImageView!
    @IBOutlet var likeImage: UIImageView!
    @IBOutlet var countLikeLabel: UILabel!
    
    var count = 0
    
    override func layoutSublayers(of layer: CALayer) {
        
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
      
        likeImage.isUserInteractionEnabled = true
        likeImage.addGestureRecognizer(tapGesture)
            
        
        
           }

        @objc func onTap(_ sender: UITapGestureRecognizer){
            print(#function)
            let like = likeImage
            if count == 0 {
                like?.image = UIImage(systemName: "heart.fill")
                count+=1
                like?.tintColor = .red
                countLikeLabel.text = "\(count)"
                countLikeLabel.textColor = .red
                print("Like")
            }else {
                like?.image = UIImage(systemName: "heart")
                count = 0
                like?.tintColor = .blue
                    countLikeLabel.text = "\(count)"
                countLikeLabel.textColor = .black
                print("- Like")
        }
    
    }
    
}
