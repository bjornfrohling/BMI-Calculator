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
		updateBmiValue()
	}

	@IBAction func didChangeWeightSlider(sender: UISlider) {
		self.weightField.text = "\(Int(self.weightSlider.value))"
	}

	@IBAction func didChangeHeightSlider(sender: UISlider) {
		self.heightField.text = "\(Int(self.heightSlider.value))"
	}

	@IBAction func didSelectCalculateButton(sender: UIButton) {
		updateBmiValue()
	}

	private func updateBmiValue() {
		let kgValue = Int(weightField.text!)
		let cmValue = Int(heightField.text!)

		let bmi = calculateBmi(cmValue!, kgValue: kgValue!)

		let output = "BMI: \(bmi)"
		outputLabel.text = output
	}

	func calculateBmi(cmValue: Int, kgValue: Int) -> Int {
		var bmi = 0

		if cmValue > 0 && kgValue > 0 {
			// BMI: kg/m*2
			let sizeInMeter = Double(cmValue) / 100.0
			bmi = Int(Double(kgValue) / (sizeInMeter * sizeInMeter))
		}

		return bmi
	}
}

