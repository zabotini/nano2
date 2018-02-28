//
//  OnboardController.swift
//  nano2
//
//  Created by Rafael Zabotini Venjenski on 01/02/18.
//  Copyright © 2018 Rafael Zabotini Venjenski. All rights reserved.
//

import UIKit
import Lottie

class OnboardController: UIViewController {
    
    @IBOutlet weak var touchLabel: UILabel!
    @IBOutlet weak var lottieView: UIView!
	var alreadyTap = 0
    @IBAction func tapAction(_ sender: Any) {
        alreadyTap += 1
        tapActionControl(tapped: alreadyTap) //FIXME: Not sure if this really work
    }
    @IBOutlet weak var threeTimesLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animationView = LOTAnimationView(name: "gears")
        lottieView.addSubview(animationView)
        animationView.center.y = view.center.y-220
        animationView.play{ (finished) in
        }
        animationView.loopAnimation = true
        animationView.center.x = view.center.x/2
    }
    
    func tapActionControl(tapped: Int) {
        if tapped == 1{
            threeTimesLabel.isHidden = false
            touchLabel.blink(delayTime: 0)
            touchLabel.text = "NOW, SWIPE UP"
        }
    }
}

extension UIView {
    func blink(delayTime: Double) {
        self.alpha = 0.0;
        UIView.animate(withDuration: 1.0, //Time duration you want,
            delay: delayTime,
            options: [.autoreverse, .repeat],
            animations: { [weak self] in self?.alpha = 1.0 },
            completion: { [weak self] _ in self?.alpha = 0.0 })
    }
}
