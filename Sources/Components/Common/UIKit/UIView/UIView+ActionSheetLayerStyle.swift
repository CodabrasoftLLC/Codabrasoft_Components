//
//  UIView+ActionSheetLayerStyle.swift
//  sberservice
//
//  Created by User on 9/6/19.
//  Copyright © 2019 sberbank. All rights reserved.
//

import UIKit
import Foundation


extension UIView {
    
    private struct Constants {
        static let actionSheetCornerRadiusStandardValue: CGFloat = 12.0
    }
    
    @available(*, deprecated, message: "Please use configuration as concrete class for style")
    func setupActionSheetLayerStyle(cornerRadius: CGFloat = Constants.actionSheetCornerRadiusStandardValue) {
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
    }
}
