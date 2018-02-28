//
//  ViewController.swift
//  nano2
//
//  Created by Rafael Zabotini Venjenski on 30/01/18.
//  Copyright © 2018 Rafael Zabotini Venjenski. All rights reserved.
//

import UIKit

class HelloViewController: UIViewController {
    
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var helloLabel: UILabel!
    var helloLabelArray = ["Olá", "Hallo", "¡Hola!", "Bonjour", "Let me tell", "A lil' history...", "Hello"]
    var index = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLabel.startShimmering()
        helloLabelAnimation()
    }
}

extension UIView {
    func startShimmering() {
        let light = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        let dark = UIColor.black.cgColor
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [dark, light, dark]
        gradient.frame = CGRect(x: -self.bounds.size.width, y: 0, width: 3*self.bounds.size.width, height: self.bounds.size.height)
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.525)
        gradient.locations = [0.4, 0.5, 0.6]
        self.layer.mask = gradient
        
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0.0, 0.1, 0.2]
        animation.toValue = [0.8, 0.9, 1.0]
        
        animation.duration = 3.0
        animation.repeatCount = .infinity
        gradient.add(animation, forKey: "shimmer")
        
        
    }
    
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionFade
        animation.duration = duration
        layer.add(animation, forKey: kCATransitionFade)
    }
}

// Label animation
extension HelloViewController {
    func helloLabelAnimation() {
        fadeOutLabel()
    }
    
    func fadeOutLabel() {
        UIView.animate(withDuration: 1.5, animations: {
            self.helloLabel.alpha = 0
        }) { ( completed ) in
            if completed {
                
                self.indexCalc()
                self.changeLabel()
            }
        }
    }
    
    func changeLabel() {
        helloLabel.text = helloLabelArray[index]
        self.fadeInlabel()
    }
    
    func fadeInlabel() {
        UIView.animate(withDuration: 1.5, animations: {
            self.helloLabel.alpha = 1
        }) { ( completed ) in
            if completed {
                self.fadeOutLabel()
            }
        }
    }
    
    func indexCalc() {
        self.index = (self.index + 1) % self.helloLabelArray.count
    }
}
