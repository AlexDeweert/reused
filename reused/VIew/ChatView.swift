//
//  ChatView.swift
//  reused
//
//  Created by Alex L. Deweert on 2020-11-12.
//

import UIKit

class ChatView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blue
    }
    
    //All subclasses of UIView must implement required init
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
