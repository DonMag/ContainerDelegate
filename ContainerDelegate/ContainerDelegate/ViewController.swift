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
		delegate?.colorButtonTapped(UIColor.red)
	}
	
	@IBAction func greenTapped(_ sender: Any) {
		delegate?.colorButtonTapped(UIColor.green)
	}
	
}

protocol MyControlsDelegate {
	func colorButtonTapped(_ toColor:UIColor)
}

class ViewController: UIViewController, MyControlsDelegate {
	
	var myControlsVC: MyControlsViewController?
	
	@IBOutlet var theLabel: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func cyanTapped(_ sender: Any) {
		myControlsVC?.view.backgroundColor = .cyan
	}

	@IBAction func orangeTapped(_ sender: Any) {
		myControlsVC?.view.backgroundColor = .orange
	}
	
	func colorButtonTapped(_ toColor: UIColor) {
		theLabel.backgroundColor = toColor
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let vc = segue.destination as? MyControlsViewController {
			myControlsVC = vc
			myControlsVC?.delegate = self
		}
	}
	
}

