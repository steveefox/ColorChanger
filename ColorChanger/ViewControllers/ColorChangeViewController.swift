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
    
    @IBOutlet weak var redColorValueTextField: UITextField!
    @IBOutlet weak var greenColorValueTextField: UITextField!
    @IBOutlet weak var blueColorValueTextField: UITextField!
    
    
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
                                 minimumTrackTintColor: .blue)
        
        
        colorView.backgroundColor = colorOfColorView
        
        redColorValueTextField.delegate = self
        redColorValueTextField.addDoneButtonToKeyboard(myAction:
            #selector(self.redColorValueTextField.resignFirstResponder))
        greenColorValueTextField.delegate = self
        greenColorValueTextField.addDoneButtonToKeyboard(myAction:
            #selector(self.greenColorValueTextField.resignFirstResponder))
        blueColorValueTextField.delegate = self
        blueColorValueTextField.addDoneButtonToKeyboard(myAction:
            #selector(self.blueColorValueTextField.resignFirstResponder))

        
        
        valueOfUpperSlider.text = String(format: "%.2f", upperSlider.value)
        valueOfMiddleSlider.text = String(format: "%.2f", middleSlider.value)
        valueOfLowerSlider.text = String(format: "%.2f", lowerSlider.value)
        
        redColorValueTextField.text = String(format: "%.2f", upperSlider.value)
        greenColorValueTextField.text = String(format: "%.2f", middleSlider.value)
        blueColorValueTextField.text = String(format: "%.2f", lowerSlider.value)

    }
    
    
    //MARK: IB Actions
    @IBAction func changeViewColor(_ sender: UISlider) {
        
        switch sender.tag {
        case 0:
            setViewColor()
            valueOfUpperSlider.text = String(format: "%.2f", upperSlider.value)
            redColorValueTextField.text = String(format: "%.2f", upperSlider.value)
        case 1:
            setViewColor()
            valueOfMiddleSlider.text = String(format: "%.2f", middleSlider.value)
            greenColorValueTextField.text = String(format: "%.2f", middleSlider.value)
        case 2:
            setViewColor()
            valueOfLowerSlider.text = String(format: "%.2f", lowerSlider.value)
            blueColorValueTextField.text = String(format: "%.2f", lowerSlider.value)
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


extension ColorChangeViewController {
    func exactRound(_ value: Float, toDecimalPlaces places: Int) -> Float {
      let divisor = pow(10.0, Float(places))
    return round(value * divisor) / divisor
    }
}

//MARK: Text fields delegate
extension ColorChangeViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let val = textField.text else  { return }
        guard var value = Float(val) else { return }
        guard value >= upperSlider.minimumValue
            && value <= upperSlider.maximumValue else { return }
        value = exactRound(value, toDecimalPlaces: 2)
        textField.text = "\(value)"
        switch textField {
        case redColorValueTextField:
            upperSlider.value = value
            valueOfUpperSlider.text = "\(value)"
            setViewColor()
        case greenColorValueTextField:
            middleSlider.value = Float(textField.text!)!
            valueOfMiddleSlider.text = textField.text
            setViewColor()
        case blueColorValueTextField:
            lowerSlider.value = Float(textField.text!)!
            valueOfLowerSlider.text = textField.text
            setViewColor()
        default:
            break
        }
    }
    
}

//MARK: Customisation keyboard
extension UITextField {

 func addDoneButtonToKeyboard(myAction:Selector?) {
    let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
    doneToolbar.barStyle = UIBarStyle.default

    let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: myAction)

    var items = [UIBarButtonItem]()
    items.append(flexSpace)
    items.append(done)

    doneToolbar.items = items
    doneToolbar.sizeToFit()

    self.inputAccessoryView = doneToolbar
 }
    
}





