//
//  MainView.swift
//  reused
//
//  Created by Alex L. Deweert on 2020-11-13.
//

import UIKit

class MainView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        print("this")
    }
    
    //All subclasses of UIView must implement required init
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
