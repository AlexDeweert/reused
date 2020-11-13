//
//  ChatViewController.swift
//  reused
//
//  Created by Alex L. Deweert on 2020-11-12.
//

import UIKit

class ChatViewController : UIViewController {
    
    
    var chatView = ChatView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = chatView
    }
    
}
