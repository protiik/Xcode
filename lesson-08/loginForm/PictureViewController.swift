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
    @IBOutlet weak var imagesFriendTwo: UIImageView!
    @IBOutlet weak var imagesFriendOne:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe(_:)))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        imagesFriendOne.isUserInteractionEnabled = true
        imagesFriendOne.addGestureRecognizer(leftSwipe)
        imagesFriendOne.addGestureRecognizer(rightSwipe)
        imagesFriendOne.image = collectionImage.first
        
        let leftSwipe2 = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe2(_:)))
        let rightSwipe2 = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe2(_:)))
        leftSwipe2.direction = .left
        rightSwipe2.direction = .right
        
        
        imagesFriendTwo.addGestureRecognizer(leftSwipe2)
        imagesFriendTwo.addGestureRecognizer(rightSwipe2)
        
        
        
        
        
    }
    
    
    func animateReduceOne () {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       animations: {
                        
                        self.imagesFriendOne.transform = .init(scaleX: 0.7, y: 0.7)
                        self.imagesFriendOne.alpha = 0
        })
    }
    
    func reverceReduceOne () {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       animations: {
                        
                        self.imagesFriendOne.transform = .init(scaleX: 1, y: 1)
                        self.imagesFriendOne.alpha = 1
        })
    }
    
    func animateSwipeOne () {
        self.imagesFriendOne.transform = CGAffineTransform(translationX: +self.view.bounds.width, y: 0)
        UIView.animate(withDuration: 1,
                       delay: 0.2,
                       animations: {
                        self.imagesFriendOne.transform = .identity
                        self.imagesFriendOne.alpha = 1
        })
    }
    func reverceSwipeOne() {
        UIView.animate(withDuration: 1){
            self.imagesFriendOne.transform = CGAffineTransform(translationX: +self.view.bounds.width - 100, y: 0)
            
        }
    }
    
    
    func animateReduceTwo () {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       animations: {
                        
                        self.imagesFriendTwo.transform = .init(scaleX: 0.7, y: 0.7)
                        self.imagesFriendTwo.alpha = 0
        })
    }
    
    func reverceReduceTwo () {
        
        UIView.animate(withDuration: 1,
                              delay: 0,
                              animations: {
                               
                               self.imagesFriendTwo.transform = .init(scaleX: 1, y: 1)
                               self.imagesFriendTwo.alpha = 1
               })
    }
    
    func animateSwipeTwo () {
        self.imagesFriendTwo.transform = CGAffineTransform(translationX: +self.view.bounds.width, y: 0)
        UIView.animate(withDuration: 1,
                       delay: 0.2,
                       animations: {
                        self.imagesFriendTwo.transform = .identity
                        self.imagesFriendTwo.isHidden = false
                        self.imagesFriendTwo.alpha = 1
        }  )
    }
    func reverceSwipeTwo() {
        UIView.animate(withDuration: 1){
            self.imagesFriendTwo.transform = CGAffineTransform(translationX: +self.view.bounds.width - 100, y: 0)
            
        }
    }
    
    
    var count = 0
    var addOne = true
    var addTwo = false
    
    @objc func onSwipe(_ sender: UISwipeGestureRecognizer){
        if sender.direction == .left {
            print("1left")
            count += 1
            print(count)
            if count < collectionImage.count {
                animateReduceOne()
                animateSwipeTwo()
                imagesFriendTwo.image = collectionImage[count]
            }
            
        }else if sender.direction == .right {
            count -= 1
            print("1right")
            if count >= 0 && count < collectionImage.count {
                reverceReduceOne()
                reverceSwipeTwo()
                imagesFriendOne.image = collectionImage[count]
            }else {
                count = 0
            }
        }
    }
        
        @objc func onSwipe2(_ sender: UISwipeGestureRecognizer){
            
            if sender.direction == .left {
                print("2left")
                count += 1
                print(count)
                if count < collectionImage.count{
                    animateReduceTwo()
                    animateSwipeOne()
                    imagesFriendOne.image = collectionImage[count]
                }else{
                    count = 3
                }
                
            }else if sender.direction == .right {
                count -= 1
                print("2right")
                if count >= 0 && count < collectionImage.count {
                    reverceReduceOne()
                    reverceSwipeTwo()
                    imagesFriendOne.image = collectionImage[count]
                }
            }else {
                count = 0
            }
        }
    }
    

