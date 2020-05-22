//
//  ViewController.swift
//  ColorChanger
//
//  Created by Nikita on 5/21/20.
//  Copyright © 2020 Nikita Begletskiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redColorLabel: UILabel!
    @IBOutlet weak var greenColorLabel: UILabel!
    @IBOutlet weak var blueColorLabel: UILabel!
    
    @IBOutlet weak var valueOfUpperSlider: UILabel!
    @IBOutlet weak var valueOfMiddleSlider: UILabel!
    @IBOutlet weak var valueOfLowerSlider: UILabel!
    
    @IBOutlet weak var upperSlider: UISlider!
    @IBOutlet weak var middleSlider: UISlider!
    @IBOutlet weak var lowerSlider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upperSlider.value = 0.0
        upperSlider.minimumValue = 0.0
        upperSlider.maximumValue = 1.1
        
        middleSlider.value = 0.0
        middleSlider.minimumValue = 0.0
        middleSlider.maximumValue = 1.1
        
        lowerSlider.value = 0.0
        lowerSlider.minimumValue = 0.0
        lowerSlider.maximumValue = 1.1
        
        
    }

   
    @IBAction func changeRedColor() {
        colorView.backgroundColor = .init(red: CGFloat(upperSlider.value),                                                                           green: CGFloat(middleSlider.value),                                                                        blue: CGFloat(lowerSlider.value),
                                          alpha: 1)
    }
    
    @IBAction func changeGreenColor() {
        colorView.backgroundColor = .init(red: CGFloat(upperSlider.value),                                                                           green: CGFloat(middleSlider.value),
                                          blue: CGFloat(lowerSlider.value),
                                          alpha: 1)
        
    }
    
    @IBAction func changeBlueColor() {
        colorView.backgroundColor = .init(red: CGFloat(upperSlider.value),                                                                           green: CGFloat(middleSlider.value),
                                          blue: CGFloat(lowerSlider.value),
                                          alpha: 1)
    }
    
    

}

