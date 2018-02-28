//
//  MarvelousAppViewController.swift
//  nano2
//
//  Created by Rafael Zabotini Venjenski on 02/02/18.
//  Copyright © 2018 Rafael Zabotini Venjenski. All rights reserved.
//

import UIKit

class MarvelousAppViewController: UIViewController {
	
	@IBAction func thanksTap(_ sender: Any) {
		thanksView.isHidden = true
		dismissLabel.isHidden = true
		thanksLabel.isHidden = true
		thanksView.fadeInOrOut(alpha: 0.0)
		dismissLabel.fadeInOrOut(alpha: 0.0)
		thanksLabel.fadeInOrOut(alpha: 0.0)
	}
	@IBAction func buttonTeste(_ sender: Any) {
		if AppManager.sharedInstance.allShown == true {
			thanksView.fadeInOrOut(alpha: 1.0)
			dismissLabel.fadeInOrOut(alpha: 1.0)
			thanksLabel.fadeInOrOut(alpha: 1.0)
			thanksView.isHidden = false
			dismissLabel.isHidden = false
			thanksLabel.isHidden = false
		}
		else {
			buttonTeste.setTitle("Go back and finish all read before touch me", for: .normal)
		}
	}
	@IBOutlet weak var dismissLabel: UILabel!
	@IBOutlet weak var thanksLabel: UILabel!
	@IBOutlet weak var thanksView: UIView!
	@IBOutlet weak var imageTeste: UIImageView!
	@IBOutlet weak var textTeste: UITextView!
	@IBOutlet weak var buttonTeste: UIButton!
	@IBOutlet weak var labelTeste: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		labelTeste.isHidden = AppManager.sharedInstance.showLabel
		textTeste.isHidden = AppManager.sharedInstance.showTextField
		imageTeste.isHidden = AppManager.sharedInstance.showImage
		buttonTeste.isHidden = AppManager.sharedInstance.showButton
		if AppManager.sharedInstance.showLabel == false && AppManager.sharedInstance.showButton == false && AppManager.sharedInstance.showImage == false && AppManager.sharedInstance.showLabel == false {
			AppManager.sharedInstance.allShown = true
			buttonTeste.setTitle("Now you may touch me :)", for: .normal)
		}
	}
}

extension UIView {
	func fadeInOrOut(alpha: CGFloat) {
		self.alpha = 0.0;
		UIView.animate(withDuration: 0.5,
			delay: 1.0,
			options: [],
			animations: { [weak self] in self?.alpha = alpha }
		)
	}
}
