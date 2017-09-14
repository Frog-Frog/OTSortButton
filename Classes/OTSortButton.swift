//
//  OTSortButton.swift
//  OTSortButton
//
//  Created by Tomosuke Okada on 2017/09/14.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

/**
 [OTSortButton]
 
 Copyright (c) [2017] [Tomosuke Okada]
 
 This software is released under the MIT License.
 http://opensource.org/licenses/mit-license.ph
 
 */

import UIKit

public enum SortButtonType {
    case normal
    case ascend
    case descend
}


public class OTSortButton: UIButton {
    
    
    //MARK: Color
    @IBInspectable public var normalTextColor: UIColor = UIColor.lightGray
    @IBInspectable public var normalBackgroundColor: UIColor = UIColor.darkGray
    
    @IBInspectable public var ascendTextColor: UIColor = UIColor.black
    @IBInspectable public var ascendBackgroundColor: UIColor = UIColor.white
    @IBInspectable public var ascendImageColor: UIColor = UIColor.black
    
    @IBInspectable public var descendTextColor: UIColor = UIColor.black
    @IBInspectable public var descendBackgroundColor: UIColor = UIColor.white
    @IBInspectable public var descendImageColor: UIColor = UIColor.black
    
    //MARK: Type
    public var sortType: SortButtonType = .normal {
        didSet {
            if sortType == .normal {
                
                backgroundColor = normalBackgroundColor
                setImage(normalImage, for: .normal)
                setTitleColor(normalTextColor, for: .normal)
                tintColor = UIColor.clear
                
            } else if sortType == .ascend {
                
                backgroundColor = ascendBackgroundColor
                setImage(ascendImage, for: .normal)
                setTitleColor(ascendTextColor, for: .normal)
                tintColor = ascendImageColor
                
            } else if sortType == .descend {
                
                backgroundColor = descendBackgroundColor
                setImage(descendImage, for: .normal)
                setTitleColor(descendTextColor, for: .normal)
                tintColor = descendImageColor
        
            }
        }
    }
    
    
    //MARK: Key
    public var sortKey = ""
    
    //MARK: Image
    private let ascendImage = UIImage(named: "ots_sort_ascend", in: Bundle(for: OTSortButton.self), compatibleWith: nil)!.withRenderingMode(.alwaysTemplate)
    private let descendImage = UIImage(named: "ots_sort_descend", in: Bundle(for: OTSortButton.self), compatibleWith: nil)!.withRenderingMode(.alwaysTemplate)
    private let normalImage = UIImage(named: "ots_sort_normal", in: Bundle(for: OTSortButton.self), compatibleWith: nil)!.withRenderingMode(.alwaysTemplate)
    
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        
        sortType = .normal
        
        transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
    }
    
}
