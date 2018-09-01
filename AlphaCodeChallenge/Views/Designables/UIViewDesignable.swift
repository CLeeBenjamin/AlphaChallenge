//
//  UIViewDesignable.swift
//  AlphaCodeChallenge
//
//  Created by Caston  Boyd on 8/31/18.
//  Copyright © 2018 Caston  Boyd. All rights reserved.
//

import UIKit

@IBDesignable class UIViewDesignable: UIView {
  
        @IBInspectable var topColor: UIColor = UIColor.white
        @IBInspectable var bottomColor: UIColor = UIColor.black
        
        override class var layerClass: AnyClass {
            return CAGradientLayer.self
        }
        
        override func layoutSubviews() {
            (layer as! CAGradientLayer).colors = [topColor.cgColor, bottomColor.cgColor]
        }
    }



