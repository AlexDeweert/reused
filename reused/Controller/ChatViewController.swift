//
//  ChatViewController.swift
//  reused
//
//  Created by Alex L. Deweert on 2020-11-12.
//

import UIKit

class ChatViewController : UIViewController {
    
    
    var chatView = ChatView()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("\(String(describing: self)) => required init?(...)")
        fatalError("required init? not implemented in ChatViewController")
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        print("\(String(describing: self)) => init()")
        self.view = chatView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(String(describing: self)) => viewDidLoad()")
    }
    
}
