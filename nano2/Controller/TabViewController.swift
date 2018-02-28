//
//  TabViewController.swift
//  nano2
//
//  Created by Rafael Zabotini Venjenski on 05/02/18.
//  Copyright © 2018 Rafael Zabotini Venjenski. All rights reserved.
//

import UIKit

class TabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "buildLabel"{
            AppManager.sharedInstance.showLabel = false
        } else if segue.identifier == "buildButton"{
            AppManager.sharedInstance.showButton = false
        } else if segue.identifier == "buildTextField"{
            AppManager.sharedInstance.showTextField = false
        } else if segue.identifier == "buildImage"{
            AppManager.sharedInstance.showImage = false
        }
    }

}
