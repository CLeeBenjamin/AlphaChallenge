//
//  MainScreenViewController.swift
//  AlphaCodeChallenge
//
//  Created by Caston  Boyd on 8/31/18.
//  Copyright © 2018 Caston  Boyd. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController{
    
    //MARK: - Hex colors for buttons
     lazy var grayBorder = hexStringToUIColor(hex: "#DEE1E6")
     lazy var blueBorder = hexStringToUIColor(hex: "#0379DD")
     lazy var secondBlueBorder = hexStringToUIColor(hex: "#30BBFE")
    
    var threeMonthLabels = [UILabel]()
    var tweleveMonthLabels = [UILabel]()
    var threeDayLabels = [UILabel]()
    
    static let sharedInstance = MainScreenViewController()
    //MARK: - 3 Months for $29.99
    @IBOutlet weak var threeForMonthsLabel: UILabel!
    @IBOutlet weak var monthsForThreeLabel: UILabel!
    @IBOutlet weak var twentyNineLabel: UILabel!
    
    
    
    //MARK: - 3 day free trial
    @IBOutlet weak var threeForDayLabel: UILabel!
    @IBOutlet weak var freeLabel: UILabel!
    @IBOutlet weak var trialLabel: UILabel!
    //MARK: - 12 months $59.99
    @IBOutlet weak var tweleveLabel: UILabel!
    @IBOutlet weak var monthsLabel: UILabel!
    @IBOutlet weak var fiftyNineLabel: UILabel!
    
    @IBOutlet weak var mainPageControl: UIPageControl!
    @IBOutlet weak var chevronBounceImg: UIImageView!
    //MARK: - Buttons for pricing
    @IBOutlet weak var threeMonthsButton: UIButton!
    @IBOutlet weak var tweleveMonthsButton: UIButton!
    @IBOutlet weak var threeDayTrialButton: UIButton!
    
    @IBOutlet weak var mostPopular: LabelDesignable!
    
    @IBOutlet weak var bestValueLabel: LabelDesignable!
    
    @IBOutlet weak var secondNumScrollView: UIScrollView!
    
    @IBOutlet weak var containerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       bounceAnimation()
       setButtonBorder()
       threeMonthsButton.addTarget(self, action: #selector(highlightTappedButton), for: .touchUpInside)
       tweleveMonthsButton.addTarget(self, action: #selector(highlightTappedButton), for: .touchUpInside)
       threeDayTrialButton.addTarget(self, action: #selector(highlightTappedButton), for: .touchUpInside)
        threeMonthLabels = [threeForMonthsLabel, monthsForThreeLabel,twentyNineLabel]
        tweleveMonthLabels = [tweleveLabel, monthsLabel, fiftyNineLabel]
        threeDayLabels = [threeForDayLabel, freeLabel, trialLabel]
        bestValueLabel.isHidden = true
        mostPopular.isHidden = false
        buttonChangeBlue(button: threeDayTrialButton)
        labelTextChanger(label: threeDayLabels)
        
        view.addSubview(secondNumScrollView)
        
        }
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        secondNumScrollView.contentSize = CGSize(width: 375, height: 1100)
       
        
    }
    
    
    //MARK: - Methods to Change Label
    func labelTextChanger(label: [UILabel]) {
        
        for item in label {
            item.textColor = blueBorder
        }
    }
    
    func labelTextChangerGray(label: [UILabel]) {
        for item in label {
            item.textColor = UIColor.black
        }
    }
    
    //MARK: - Methods to change buttons
    func buttonChangeBlue(button: UIButton){
    
        button.layer.borderColor = blueBorder.cgColor
        button.layer.borderWidth = 5
        button.layer.shadowColor = blueBorder.cgColor
        button.layer.shadowRadius = 25
        button.layer.shadowOffset = CGSize(width: 10, height: 15)
        button.layer.shadowOpacity = 0.5

    }
    
    func buttonGray(button: UIButton){
        button.layer.borderColor = grayBorder.cgColor
        button.layer.borderWidth = 5
        button.layer.shadowColor = grayBorder.cgColor
        button.layer.shadowRadius = 0
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowOpacity = 0
        
    }
    
 //MARK: - Method for tapped Buttons
    @objc func highlightTappedButton(sender: UIButton){
        
        
        if sender == threeMonthsButton {
            //MARK: - Change button colors
            buttonChangeBlue(button: threeMonthsButton)
            buttonGray(button: tweleveMonthsButton)
            buttonGray(button: threeDayTrialButton)
            //MARK: - Change Label Colors
            labelTextChanger(label: threeMonthLabels)
            labelTextChangerGray(label: tweleveMonthLabels)
            labelTextChangerGray(label: threeDayLabels)
            
            //MARK: - hidden labels
            bestValueLabel.isHidden = true
            mostPopular.isHidden = true
            
        }
        
        if sender == tweleveMonthsButton {
            //MARK: - Change button colors
            buttonChangeBlue(button: tweleveMonthsButton)
            buttonGray(button: threeDayTrialButton)
            buttonGray(button: threeMonthsButton)
            
            //MARK: - Change Label Colors
            labelTextChanger(label: tweleveMonthLabels)
            labelTextChangerGray(label: threeMonthLabels)
            labelTextChangerGray(label: threeDayLabels)
            
            //MARK: - hidden labels
            bestValueLabel.isHidden = false
            mostPopular.isHidden = true
        }
        
        if sender == threeDayTrialButton{
            //MARK: - Change button colors
            buttonChangeBlue(button: threeDayTrialButton)
            buttonGray(button: tweleveMonthsButton)
            buttonGray(button: threeMonthsButton)
            
            //MARK: - Change Label Colors
            labelTextChanger(label: threeDayLabels)
            labelTextChangerGray(label: threeMonthLabels)
            labelTextChangerGray(label: tweleveMonthLabels)
            
            //MARK: - hidden labels
            bestValueLabel.isHidden = true
            mostPopular.isHidden = false
            
        }
    }
    
    
    func setButtonBorder() {
        threeMonthsButton.layer.borderColor = grayBorder.cgColor
        threeMonthsButton.layer.borderWidth = 5
        
        tweleveMonthsButton.layer.borderColor = grayBorder.cgColor
        tweleveMonthsButton.layer.borderWidth = 5
        
        threeDayTrialButton.layer.borderColor = grayBorder.cgColor
        threeDayTrialButton.layer.borderWidth = 5
    }
    
    
    
    
    func bounceAnimation() {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.chevronBounceImg.frame.origin.x -= 5
            
        }) {_ in UIView.animateKeyframes(withDuration: 0.3, delay: 0.10, options: [.autoreverse, .repeat], animations: {
            self.chevronBounceImg.frame.origin.x += 5
        })
            
        }
    }
    
    
    
}


extension MainScreenViewController {
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}


extension UIView {
    
    
        func applyGradient(colours: [UIColor]) -> Void {
            self.applyGradient(colours: colours, locations: nil)
        }
        
        func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
            let gradient: CAGradientLayer = CAGradientLayer()
            gradient.frame = self.bounds
            gradient.colors = colours.map { $0.cgColor }
            gradient.locations = locations
            self.layer.insertSublayer(gradient, at: 0)
        }
    }





