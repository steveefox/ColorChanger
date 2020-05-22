//
//  ViewController.swift
//  ColorChanger
//
//  Created by Nikita on 5/21/20.
//  Copyright © 2020 Nikita Begletskiy. All rights reserved.
//

import UIKit


func round(_ value: Float, toDecimalPlaces places: Int) -> Float {
  let divisor = pow(10.0, Float(places))
    return round(value * divisor) / divisor
}

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
        
    @IBOutlet weak var valueOfUpperSlider: UILabel!
    @IBOutlet weak var valueOfMiddleSlider: UILabel!
    @IBOutlet weak var valueOfLowerSlider: UILabel!
    
    @IBOutlet weak var upperSlider: UISlider!
    @IBOutlet weak var middleSlider: UISlider!
    @IBOutlet weak var lowerSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.backgroundColor = .blue
        
        upperSlider.value = 0.0
        upperSlider.minimumValue = 0.0
        upperSlider.maximumValue = 1.0
        upperSlider.minimumTrackTintColor = .red
        
        middleSlider.value = 0.0
        middleSlider.minimumValue = 0.0
        middleSlider.maximumValue = 1.0
        middleSlider.minimumTrackTintColor = .green
        
        lowerSlider.value = 0.0
        lowerSlider.minimumValue = 0.0
        lowerSlider.maximumValue = 1.0
        lowerSlider.minimumTrackTintColor = .blue
        
        valueOfUpperSlider.text = String(upperSlider.value)
        
        valueOfMiddleSlider.text = String(middleSlider.value)
        
        valueOfLowerSlider.text = String(lowerSlider.value)
        
    }

   
    @IBAction func changeRedColor() {
        valueOfUpperSlider.text = String(round(upperSlider.value,
                                               toDecimalPlaces: 2))
        
        colorView.backgroundColor = .init(red: CGFloat(upperSlider.value),                                                                           green: CGFloat(middleSlider.value),                                                                        blue: CGFloat(lowerSlider.value),
                                          alpha: 1)
    }
    
    @IBAction func changeGreenColor() {
        valueOfMiddleSlider.text = String(round(middleSlider.value,
                                               toDecimalPlaces: 2))
        
        colorView.backgroundColor = .init(red: CGFloat(upperSlider.value),                                                                           green: CGFloat(middleSlider.value),
                                          blue: CGFloat(lowerSlider.value),
                                          alpha: 1)
        
    }
    
    @IBAction func changeBlueColor() {
        valueOfLowerSlider.text = String(round(lowerSlider.value,
                                               toDecimalPlaces: 2))

        colorView.backgroundColor = .init(red: CGFloat(upperSlider.value),                                                                           green: CGFloat(middleSlider.value),
                                          blue: CGFloat(lowerSlider.value),
                                          alpha: 1)
    }
    
    

}



