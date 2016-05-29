//
//  ViewController.swift
//  BMI-Calculator
//
//  Created by Björn Fröhling on 25/05/16.
//  Copyright © 2016 Fröhling. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var weightField: UITextField!
	@IBOutlet weak var heightField: UITextField!
	@IBOutlet weak var weightSlider: UISlider!
	@IBOutlet weak var heightSlider: UISlider!
	@IBOutlet weak var outputLabel: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()

		title = "BMI-Calculator"

		self.weightField.enabled = false
		self.heightField.enabled = false
	}

	override func viewWillAppear(animated: Bool) {
		calculateBmi()
	}

	@IBAction func didChangeWeightSlider(sender: UISlider) {
		self.weightField.text = "\(Int(self.weightSlider.value))"
	}

	@IBAction func didChangeHeightSlider(sender: UISlider) {
		self.heightField.text = "\(Int(self.heightSlider.value))"
	}

	@IBAction func didSelectCalculateButton(sender: UIButton) {
		calculateBmi()
	}

	func calculateBmi() {
		// BMI: kg/m*2
		let kgValue = Int(weightField.text!)
		let cmValue = Int(heightField.text!)

		let sizeInMeter = Double(cmValue!) / 100.0
		let bmi = Int(Double(kgValue!) / (sizeInMeter * sizeInMeter))

		let output = "BMI: \(bmi)"
		outputLabel.text = output
	}
}

