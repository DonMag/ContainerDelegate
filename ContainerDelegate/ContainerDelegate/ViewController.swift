//
//  ViewController.swift
//  ContainerDelegate
//
//  Created by Don Mag on 5/8/18.
//  Copyright © 2018 DonMag. All rights reserved.
//

import UIKit

class MyControlsViewController: UIViewController {
	
	var delegate: MyControlsDelegate?
	
	@IBAction func redTapped(_ sender: Any) {
		delegate?.changeBackground(UIColor.red)
	}
	
	@IBAction func greenTapped(_ sender: Any) {
		delegate?.changeBackground(UIColor.green)
	}
	
}

protocol MyControlsDelegate {
	func changeBackground(_ toColor:UIColor)
}

class ViewController: UIViewController, MyControlsDelegate {
	
	var myControlsVC: MyControlsViewController?
	
	@IBOutlet var theLabel: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func redTapped(_ sender: Any) {
		myControlsVC?.view.backgroundColor = .red
	}

	@IBAction func greenTapped(_ sender: Any) {
		myControlsVC?.view.backgroundColor = .green
	}
	
	func changeBackground(_ toColor: UIColor) {
		theLabel.backgroundColor = toColor
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let vc = segue.destination as? MyControlsViewController {
			myControlsVC = vc
			myControlsVC?.delegate = self
		}
	}
	
}

