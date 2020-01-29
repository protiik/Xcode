//
//  ViewController.swift
//  lesson1
//
//  Created by prot on 29/01/2020.
//  Copyright © 2020 prot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textFieldLogin: UITextField!
    @IBOutlet weak var textFieldPass: UITextField!
    @IBOutlet weak var labelLogin: UILabel!
    @IBOutlet weak var buttonIn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)) //переменная для закрытия клавитуры при тапе
        scrollView.addGestureRecognizer(tapGesture) // закрытие клавитуры
    }
    
    @IBAction func buttonInTap(_ sender: UIButton) {
        let login = textFieldLogin.text
        let pass = textFieldPass.text
        
        if login == "admin" && pass == "admin" {
            labelLogin.text = "Успешная авторизация"
        }else {
            labelLogin.text = "Неверный логин или пароль"
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры

           NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
           NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    // Когда клавиатура появляется
    @objc func keyboardWillShown ( notification : Notification) {
        // Получаем размер клавиатуры
           let info = notification.userInfo! as NSDictionary
           let size = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
           let contentInsents = UIEdgeInsets(top: 0, left: 0, bottom: size.height, right: 0)
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
           self.scrollView?.contentInset = contentInsents
           self.scrollView.scrollIndicatorInsets = contentInsents
           
    }
       //Когда клавиатура исчезает
    @objc func keyboardWillHide ( notification : Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
           scrollView.contentInset = .zero
           
    }
    //клик по пустому месту на экране сворачивает клаву
    @objc func hideKeyboard() {
        self.scrollView.endEditing(true)
    }

        

    
    
    
    
    
    
    
    
}

