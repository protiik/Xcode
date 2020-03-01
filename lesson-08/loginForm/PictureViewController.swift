//
//  PictureViewController.swift
//  loginForm
//
//  Created by prot on 29.02.2020.
//  Copyright © 2020 prot. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {
    
    var collectionImage:[UIImage] = [UIImage(named: "Jessica")!, UIImage(named: "wolf")!, UIImage(named: "Jony")!, UIImage(named: "Cat")!]
    
    
    @IBOutlet weak var nameFriendLabel: NSLayoutConstraint!
    @IBOutlet weak var imagesFriendOne: UIImageView!
    @IBOutlet weak var imagesFriendTwo: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagesFriendOne.isUserInteractionEnabled = true
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe(_:)))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        imagesFriendOne.addGestureRecognizer(leftSwipe)
        imagesFriendOne.addGestureRecognizer(rightSwipe)
        
        //
        imagesFriendTwo.isUserInteractionEnabled = true
        let leftSwipe2 = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe2(_:)))
        let rightSwipe2 = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe2(_:)))
        
        leftSwipe2.direction = .left
        rightSwipe2.direction = .right
        imagesFriendTwo.addGestureRecognizer(leftSwipe2)
        imagesFriendTwo.addGestureRecognizer(rightSwipe2)
        
        
        
        
        imagesFriendOne.image = collectionImage.first
        
    }
    
    
    
    func animateReduceOne () {
        self.imagesFriendTwo.transform = CGAffineTransform(translationX: 500, y: 0)
        self.imagesFriendTwo.transform = .init(scaleX: 0.8, y: 0.8)
        
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                self.imagesFriendOne.transform = CGAffineTransform(translationX: -400, y: 0)
                self.imagesFriendOne.alpha = 0
            })
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.imagesFriendOne.transform = CGAffineTransform(translationX: 450, y: 0)
                self.imagesFriendTwo.transform = .identity
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                self.imagesFriendOne.alpha = 1
                
            })
        })
    }
    func animateReverseOne () {
        self.imagesFriendTwo.transform = CGAffineTransform(translationX: -400, y: 0)
        self.imagesFriendTwo.transform = .init(scaleX: 0.8, y: 0.8)
        
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                self.imagesFriendOne.transform = CGAffineTransform(translationX: 400, y: 0)
                self.imagesFriendOne.alpha = 0
            })
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.imagesFriendOne.transform = CGAffineTransform(translationX: 450, y: 0)
                self.imagesFriendTwo.transform = .identity
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                self.imagesFriendOne.alpha = 1
                
            })
        })
    }
    
    
    func animateReduceTwo() {
        self.imagesFriendOne.transform = .init(scaleX: 0.8, y: 0.8)
        
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                self.imagesFriendTwo.transform = CGAffineTransform(translationX: -400, y: 0)
                self.imagesFriendTwo.alpha = 0
            })
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.imagesFriendTwo.transform = CGAffineTransform(translationX: 450, y: 0)
                self.imagesFriendOne.transform = .identity
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                self.imagesFriendTwo.alpha = 1
            })
        })
    }
    func animateReverseTwo () {
        self.imagesFriendOne.transform = CGAffineTransform(translationX: -400, y: 0)
        self.imagesFriendOne.transform = .init(scaleX: 0.8, y: 0.8)
        
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                self.imagesFriendTwo.transform = CGAffineTransform(translationX: 400, y: 0)
                self.imagesFriendTwo.alpha = 0
            })
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.imagesFriendTwo.transform = CGAffineTransform(translationX: 450, y: 0)
                self.imagesFriendOne.transform = .identity
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                self.imagesFriendTwo.alpha = 1
                
            })
        })
    }
    
    
    var count = 0
    
    @objc func onSwipe (_ sender: UISwipeGestureRecognizer){
        switch sender.direction {
        case .left:
            count += 1
            print(count)
            if count < collectionImage.count {
                animateReduceOne()
                imagesFriendTwo.image = collectionImage[count]
            }else{
                count = collectionImage.count - 1
            }
        case .right:
            count -= 1
            if count >= 0 && count < collectionImage.count {
                animateReverseOne ()
                imagesFriendTwo.image = collectionImage[count]
            }else {
                count = 0
            }
        default: break
        }
        
    }
    @objc func onSwipe2 (_ sender: UISwipeGestureRecognizer){
        switch sender.direction {
        case .left:
            count += 1
            print(count)
            if count < collectionImage.count {
                animateReduceTwo()
                imagesFriendOne.image = collectionImage[count]
            }else{
                count = collectionImage.count - 1
            }
        case .right:
            count -= 1
            if count >= 0 && count < collectionImage.count{
                animateReverseTwo()
                imagesFriendOne.image = collectionImage[count]
            }
            else{
                count = collectionImage.count - 1
            }
            
        default: break
        }
        
    }
    
    
}
