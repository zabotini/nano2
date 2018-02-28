//
//  AppManager.swift
//  nano2
//
//  Created by Rafael Zabotini Venjenski on 02/02/18.
//  Copyright © 2018 Rafael Zabotini Venjenski. All rights reserved.
//

class AppManager {
	static let sharedInstance = AppManager()
	
	private init(){}
	
	var showButton = true
	var showLabel = true
	var showTextField = true
	var showImage = true
	var allShown = false
	//acessar AppManager.shared.<componente>
}
