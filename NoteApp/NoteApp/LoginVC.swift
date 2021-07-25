//
//  LoginVC.swift
//  NoteApp
//
//  Created by DCS on 13/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation
import UIKit

class LoginVC: UIViewController {
    
    private let bgimage: UIImageView = {
        let bgimage = UIImageView()
        bgimage.image = UIImage(named: "Notes")
        return bgimage
    }()
    
   
    private let username : UITextField = {
        
        let textView = UITextField()
        textView.placeholder = "Enter Username"
        textView.textAlignment = .center
        //textView.textColor = .white
        textView.backgroundColor = .gray
        textView.layer.cornerRadius = 5
        return textView
    }()
    
    private let password : UITextField = {
        
        let textView = UITextField()
        textView.placeholder = "Enter Password"
        textView.textAlignment = .center
        //textView.textColor = .white
        textView.backgroundColor = .gray
        textView.layer.cornerRadius = 5
        textView.isSecureTextEntry = true
        return textView
    }()
    
    private let vcbutton : UIButton = {
        let vc_button = UIButton()
        vc_button.setTitle("Login", for: .normal)
        vc_button.backgroundColor = .gray
        vc_button.addTarget(self, action: #selector(redirect), for: .touchUpInside)
        vc_button.layer.cornerRadius = 5
        return vc_button
    } ()
    
    @objc func redirect()
    {
        
        
        if(username.text == "Abc123" && password.text == "Abc123")
        {
            let vc = NoteVC()
            navigationController?.pushViewController(vc, animated: true)
            UserDefaults.standard.setValue(username.text, forKey: "username")
            UserDefaults.standard.setValue("asdfgdewseds", forKey: "session token")
            self.dismiss(animated: true)
        }
        else
        {
            let alert = UIAlertController(title: "Please Enter Correct Credentials", message: "Incorrect Username Or Password", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Close", style: .cancel))
            DispatchQueue.main.async {
                self.present(alert, animated: true) {
                    self.username.text = ""
                    self.password.text = ""
                    
                }
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Notes"
        view.addSubview(bgimage)
        view.addSubview(username)
        view.addSubview(password)
        view.addSubview(vcbutton)
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bgimage.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: 300)
        username.frame = CGRect(x: 20, y: 450, width: view.width - 40, height: 40)
        password.frame = CGRect(x: 20, y: 500, width: view.width - 40, height: 40)
        vcbutton.frame = CGRect(x: 20, y: 550, width: view.width - 40, height: 40)
        
        
}


}
