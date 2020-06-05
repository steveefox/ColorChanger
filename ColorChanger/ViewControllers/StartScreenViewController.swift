//
//  StartScreenViewController.swift
//  ColorChanger
//
//  Created by Nikita on 6/5/20.
//  Copyright © 2020 Nikita Begletskiy. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {
    
    @IBOutlet var backGround: UIView!
    var backGroundRed: CGFloat = 1
    var backGroundGreen: CGFloat = 1
    var backGroundBlue: CGFloat = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    
    
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorChangeVC = segue.destination as! ColorChangeViewController
        colorChangeVC.delegate = self
        colorChangeVC.colorOfColorView = backGround.backgroundColor
        colorChangeVC.redColor = backGroundRed
        colorChangeVC.greenColor = backGroundGreen
        colorChangeVC.blueColor = backGroundBlue
        
    }
    

}

extension StartScreenViewController: ColorChangeViewControllerDelegate {
    func setBackgroundRGBColor(redColor: CGFloat,
                            greenColor: CGFloat,
                            blueColor: CGFloat,
                            alpha: CGFloat = 1) {
        backGround.backgroundColor = .init(red: redColor,
                                           green: greenColor,
                                           blue: blueColor,
                                           alpha: alpha)
        backGroundRed = redColor
        backGroundGreen = greenColor
        backGroundBlue = blueColor
    }
    
    
}



