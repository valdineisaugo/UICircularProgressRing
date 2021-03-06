//
//  ViewController.swift
//  Example
//
//  Created by Luis Padron on 9/16/16.
//  Copyright © 2016 Luis Padron. All rights reserved.
//

import UIKit
import UICircularProgressRing
                                        // If you'd prefer to use a delegate then you can implement it and override func finishedUpdatingProgressFor(_ ring: UICircularProgressRingView)
class ViewController: UIViewController, UICircularProgressRingDelegate  {
    

    @IBOutlet weak var ring1: UICircularProgressRingView!
    @IBOutlet weak var ring2: UICircularProgressRingView!
    @IBOutlet weak var ring3: UICircularProgressRingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Customize some properties
        
        ring1.animationStyle = kCAMediaTimingFunctionLinear
        ring1.fontSize = 100
        ring2.fontColor = UIColor.gray
        ring3.maxValue = 100
        
        // Set the delegate
        ring1.delegate = self
        ring2.delegate = self
        
    }
    
    // Button clicked, animate them views
    @IBAction func animateTheViews(_ sender: AnyObject) {
        // Animate the views
        /* 
         Send in the value you would like to update the view with.
         animationDuration when set to 0 causes view to not be animated.
         Optionally you can also supply a completion handler
         */
        
        ring1.setProgress(value: 99, animationDuration: 5, completion: nil)
        
        ring2.setProgress(value: 56, animationDuration: 2) {
            // Increase it more, and customize some properties
            self.ring2.viewStyle = 4
            self.ring2.setProgress(value: 100, animationDuration: 3) {
                self.ring2.fontSize = 70
                print("Ring 2 finished")
            }
        }
        
        // This has a max value of 10 so we set this accordingly and the view calculates how the progress should look
        ring3.setProgress(value: 8.32, animationDuration: 6) {
            // We can also change the max value
            self.ring3.maxValue = 20
            self.ring3.setProgress(value: 15.32, animationDuration: 2, completion: nil)
            print("Ring 3 finished")
        }
        
    }
    
    func finishedUpdatingProgressFor(_ ring: UICircularProgressRingView) {
        if ring === ring1 {
            print("From delegate: Ring 1 finished")
        } else if ring === ring2 {
            print("From delegate: Ring 2 finished")
        }
    }
    
}

