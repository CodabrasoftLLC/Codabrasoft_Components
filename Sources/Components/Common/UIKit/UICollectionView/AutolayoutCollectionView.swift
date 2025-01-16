//
//  AutolayoutCollectionView.swift
//  sberservice
//
//  Created by Kulik on 3/20/20.
//  Copyright © 2020 sberbank. All rights reserved.
//

import UIKit


final class AutolayoutCollectionView: UICollectionView {

    // MARK: - Properties
    
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
