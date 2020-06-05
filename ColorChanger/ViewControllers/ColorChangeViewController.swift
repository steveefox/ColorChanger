//
//  ColorChangeViewController.swift
//  ColorChanger
//
//  Created by Nikita on 5/21/20.
//  Copyright © 2020 Nikita Begletskiy. All rights reserved.
//

import UIKit

protocol ColorChangeViewControllerDelegate {
    func setBackgroundRGBColor(redColor: CGFloat,
                            greenColor: CGFloat,
                            blueColor: CGFloat,
                            alpha: CGFloat)
}

class ColorChangeViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var valueOfUpperSlider: UILabel!
    @IBOutlet weak var valueOfMiddleSlider: UILabel!
    @IBOutlet weak var valueOfLowerSlider: UILabel!
    
    @IBOutlet weak var upperSlider: UISlider!
    @IBOutlet weak var middleSlider: UISlider!
    @IBOutlet weak var lowerSlider: UISlider!
    
    var delegate: ColorChangeViewControllerDelegate!
    var colorOfColorView: UIColor!
    var redColor: CGFloat!
    var greenColor: CGFloat!
    var blueColor: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
                
        setSliderCharacteristics(for: upperSlider,
                                 value: Float(redColor),
                                 minValue: 0.0,
                                 maxValue: 1.0,
                                 minimumTrackTintColor: .red)
        setSliderCharacteristics(for: middleSlider,
                                 value: Float(greenColor),
                                 minValue: 0.0,
                                 maxValue: 1.0,
                                 minimumTrackTintColor: .green)
        setSliderCharacteristics(for: lowerSlider,
                                 value: Float(blueColor),
                                 minValue: 0.0,
                                 maxValue: 1.0,
                                 minimumTrackTintColor: .black)
        
        
        colorView.backgroundColor = colorOfColorView
        
        valueOfUpperSlider.text = String(format: "%.2f", upperSlider.value)
        
        valueOfMiddleSlider.text = String(format: "%.2f", middleSlider.value)
        
        valueOfLowerSlider.text = String(format: "%.2f", lowerSlider.value)
        
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
    
    @IBAction func saveColor(_ sender: UIButton) {
        delegate.setBackgroundRGBColor(redColor: CGFloat(upperSlider.value),
                                       greenColor: CGFloat(middleSlider.value),
                                       blueColor: CGFloat(lowerSlider.value),
                                       alpha: 1)
        dismiss(animated: true)
    }
    
    
    
}

//MARK: Change Slider Values

extension ColorChangeViewController {
    
    private func setSliderCharacteristics(for slider: UISlider,
                                          value: Float,
                                          minValue: Float = 0.0,
                                          maxValue: Float = 1.0,
                                          minimumTrackTintColor: UIColor) {
        slider.value = value
        slider.minimumValue = minValue
        slider.maximumValue = maxValue
        slider.minimumTrackTintColor = minimumTrackTintColor
        
    }
    

    
}


extension ColorChangeViewController {
    
    private func setViewColor(){
        colorView.backgroundColor = .init(red: CGFloat(upperSlider.value),
                                          green: CGFloat(middleSlider.value),
                                          blue: CGFloat(lowerSlider.value),
                                          alpha: 1)
    }
}



=



