//
//  Background.swift
//  SexStories
//
//  Created by  Kostantin Zarubin on 13/11/2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit

class Background: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        let gradientLayer:CAGradientLayer = CAGradientLayer()
        gradientLayer.frame.size = UIScreen.main.bounds.size
        gradientLayer.colors = [UIColor(red: 187.0/255.0, green: 74.0/255.0, blue: 146.0/255.0, alpha: 1.0).cgColor ,UIColor(red: 224.0/255.0, green: 52.0/255.0, blue: 46.0/255.0, alpha: 1.0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        self.layer.addSublayer(gradientLayer)
    }
}
