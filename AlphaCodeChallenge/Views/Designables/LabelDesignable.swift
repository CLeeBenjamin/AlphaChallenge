//
//  LabelDesignable.swift
//  AlphaCodeChallenge
//
//  Created by Caston  Boyd on 9/1/18.
//  Copyright © 2018 Caston  Boyd. All rights reserved.
//

import UIKit

@IBDesignable class LabelDesignable: UILabel {
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        layer.cornerRadius = cornerRadius
        if cornerRadius > 0 {
            layer.masksToBounds = true
        }
        
    }
    
    
  
    
}
