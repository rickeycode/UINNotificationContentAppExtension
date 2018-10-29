// 
//  UINUserNotificationEmulatorViewController.swift
//  UINConvenientFrameWork
//
//  Created by yu tanaka on 2018/08/24.
//  Copyright (c) 2018年 CyberAgent, Inc. All rights reserved.
//


import UIKit
import UserNotifications

class UINUserNotificationEmulatorViewController: UIViewController {
    
    @IBOutlet weak var title_textField: UITextView! {
        didSet {
            title_textField.layer.borderWidth = 1
            title_textField.layer.borderColor = UIColor.lightGray.cgColor
            title_textField.layer.cornerRadius = 4
            title_textField.text = "SampleVideo"
        }
    }
    
    @IBOutlet weak var body_textField: UITextView! {
        didSet {
            body_textField.layer.borderWidth = 1
            body_textField.layer.borderColor = UIColor.lightGray.cgColor
            body_textField.layer.cornerRadius = 4
            body_textField.text = "Tap Play mark."
        }
    }
    
    @IBOutlet weak var badgeCount_textField: UITextField! {
        didSet {
            badgeCount_textField.layer.borderWidth = 1
            badgeCount_textField.layer.borderColor = UIColor.lightGray.cgColor
            badgeCount_textField.layer.cornerRadius = 4
            badgeCount_textField.text = "0"
        }
    }
    
    @IBOutlet weak var delaySec_textField: UITextField! {
        didSet {
            delaySec_textField.layer.borderWidth = 1
            delaySec_textField.layer.borderColor = UIColor.lightGray.cgColor
            delaySec_textField.layer.cornerRadius = 4
            delaySec_textField.text = "5"
        }
    }
    
    @IBOutlet weak var sendButton: UIButton! {
        didSet {
            sendButton.setTitle("Fire!!!", for: .normal)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func touchupSendButton(_ sender: Any) {
        
        let category = UNNotificationCategory(identifier: "GENERAL",
                                              actions: [],
                                              intentIdentifiers: [],
                                              options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        let content = UNMutableNotificationContent()
        content.title = title_textField.text
        content.body = body_textField.text
        content.categoryIdentifier = "GENERAL"
        let time = TimeInterval(Int(delaySec_textField.text ?? "0") ?? 0)
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: time,
                                                             repeats: false)
        let request = UNNotificationRequest.init(identifier: "myNotification",
                                                 content: content,
                                                 trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}
