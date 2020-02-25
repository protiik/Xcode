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
        let like = likeImage
        if count == 0 {
            count+=1
            countLikeLabel.text = "\(count)"
            print("Like")
            UIView.transition(with: likeImage, duration: 1.0, options: .transitionCrossDissolve, animations: {
                self.likeImage.image = UIImage(systemName: "heart.fill")
                like?.tintColor = .red
            })
            UIView.transition(with: countLikeLabel, duration: 1.0, options: .transitionCrossDissolve, animations: {
                self.countLikeLabel.textColor = .red
            })
            
            
        }else {
            count = 0
            countLikeLabel.text = "\(count)"
            print("- Like")
            UIView.transition(with: likeImage, duration: 1.0, options: .transitionCrossDissolve, animations: {
                self.likeImage.image = UIImage(systemName: "heart")
                like?.tintColor = .blue
            })
            UIView.transition(with: countLikeLabel, duration: 1.0, options: .transitionCrossDissolve, animations: {
                self.countLikeLabel.textColor = .black
            })
            
        }
    }
    // Стартовые значения аутлетов при переиспользовании ячейки
    override func prepareForReuse() {
        super.prepareForReuse()
        
        friendImageView.image = nil
        likeImage.image = nil
        countLikeLabel.text = nil
        
    }
    
}
