//
//  ViewController.swift
//  RoundedCornersView
//
//  Created by Ben G on 15.11.2019.
//  Copyright © 2019 beng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var roundedView: RoundedView!
    
    @IBOutlet var topLeftCorner: UISlider!
    @IBOutlet var topRightCorner: UISlider!
    @IBOutlet var bottomRightCorner: UISlider!
    @IBOutlet var bottomLeftCorner: UISlider!
    
    @IBAction func radiusChanged(_ sender: UISlider) {
        let maxRadius = roundedView.frame.size.width / 2
        let radius = maxRadius * CGFloat(sender.value)
        
        switch sender {
        case topLeftCorner:
            roundedView.topLeftRadius = radius
        case topRightCorner:
            roundedView.topRightRadius = radius
        case bottomRightCorner:
            roundedView.bottomRightRadius = radius
        case bottomLeftCorner:
            roundedView.bottomLeftRadius = radius
        default:
            break
        }
    }
    
}

