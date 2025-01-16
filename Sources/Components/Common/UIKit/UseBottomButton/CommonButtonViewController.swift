//
//  BottomButtonViewController.swift
//  Internal
//
//  Created by wx on 7/8/18.
//  Copyright © 2018 wx. All rights reserved.
//

import UIKit

protocol CommonButtonViewControllerDelegate: AnyObject {
    
    func commonButtonDidPressed()
}

class CommonButtonViewController: UIViewController {
    weak var delegate: CommonButtonViewControllerDelegate?
    
    weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.button != nil {
            self.button.addTarget(self, action: #selector(self.buttonPressed(_:)), for: .touchUpInside)
        }
    }
    
    @objc func buttonPressed(_ sender: Any) {
        self.delegate?.commonButtonDidPressed()
    }
    
}
