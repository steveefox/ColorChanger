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
    
    @IBOutlet weak var valueOfUpperSlider: UILabel!
    @IBOutlet weak var valueOfMiddleSlider: UILabel!
    @IBOutlet weak var valueOfLowerSlider: UILabel!
    
    @IBOutlet weak var upperSlider: UISlider!
    @IBOutlet weak var middleSlider: UISlider!
    @IBOutlet weak var lowerSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
                
        setAllSlidersCharacteristics()
        
        colorView.backgroundColor = .init(red: CGFloat(upperSlider.value),
                                          green: CGFloat(middleSlider.value),
                                          blue: CGFloat(lowerSlider.value),
                                          alpha: 1)
        
        valueOfUpperSlider.text = String(upperSlider.value)
        
        valueOfMiddleSlider.text = String(middleSlider.value)
        
        valueOfLowerSlider.text = String(lowerSlider.value)
        
    }
    
    
    
    @IBAction func changeViewColor(_ sender: UISlider) {
        
        switch sender.tag {
        case 0:
            setViewColor()
            valueOfUpperSlider.text = String(format: "%.2f", upperSlider.value)
        case 1:
            setViewColor()
            valueOfMiddleSlider.text = String(format: "%.2f", middleSlider.value)
        case 2:
            setViewColor()
            valueOfLowerSlider.text = String(format: "%.2f", lowerSlider.value)
        default:
            break
        }
        
    }
    
    
}

extension ViewController {
    private func setAllSlidersCharacteristics() {
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
        
    }
    
    private func setViewColor(){
        colorView.backgroundColor = .init(red: CGFloat(upperSlider.value),
                                          green: CGFloat(middleSlider.value),
                                          blue: CGFloat(lowerSlider.value),
                                          alpha: 1)
    }
    
}







