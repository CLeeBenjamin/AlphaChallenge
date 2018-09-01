//
//  ButtonDesignable.swift
//  AlphaCodeChallenge
//
//  Created by Caston  Boyd on 8/31/18.
//  Copyright © 2018 Caston  Boyd. All rights reserved.
//

import UIKit

@IBDesignable class ButtonDesignable: UIButton {


    
    
        @IBInspectable public var verticalGradient: Bool = true {
            didSet {
                updateUI()
            }
        }
    
        @IBInspectable public var startColor: UIColor = .clear {
            didSet {
                updateUI()
            }
        }
    
        @IBInspectable public var endColor: UIColor = .clear {
            didSet {
                updateUI()
            }
        }
    
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            updateUI()
        }
    }
  
   
        public var onClick = { () }
        
        private var gradientlayer = CAGradientLayer()
        
   
        override public init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
        }
        
        required public init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupUI()
        }
        
        // MARK: - Layout
        override public func layoutSubviews() {
            super.layoutSubviews()
            updateFrame()
        }
        
        // MARK: - UI Setup
        private func setupUI() {
            gradientlayer = CAGradientLayer()
            updateUI()
            layer.addSublayer(gradientlayer)
        }
        
        // MARK: - Update frame
        private func updateFrame() {
            gradientlayer.frame = bounds
        }
        
        // MARK: - Update UI
        private func updateUI() {
            addTarget(self, action: #selector(clickAction(button:)), for: UIControlEvents.touchUpInside)
            gradientlayer.colors = [startColor.cgColor, endColor.cgColor]
            if verticalGradient {
                gradientlayer.startPoint = CGPoint(x: 0, y: 0)
                gradientlayer.endPoint = CGPoint(x: 0, y: 1)
            } else {
                gradientlayer.startPoint = CGPoint(x: 0, y: 0)
                gradientlayer.endPoint = CGPoint(x: 1, y: 0)
            }
            
            layer.cornerRadius = cornerRadius
            if cornerRadius > 0 {
                layer.masksToBounds = true
            }
            
           
            updateFrame()
        }
        
        // MARK: - On Click
        @objc private func clickAction(button: UIButton) {
            onClick()
        }
    }
    

