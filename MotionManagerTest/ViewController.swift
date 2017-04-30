//
//  ViewController.swift
//  MotionManagerTest
//
//  Created by Akshay Iyer on 4/29/17.
//  Copyright © 2017 akshaytiyer. All rights reserved.
//

import UIKit
import CoreMotion


class ViewController: UIViewController {

    @IBOutlet weak var gangalLabel: UILabel!
    var motionManager = CMMotionManager()
    var previousValue = 0.0
    var nextValue = 0.0
    let date = Date()
    let calendar = Calendar.current
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        motionManager.accelerometerUpdateInterval = 0.3
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            if let myData = data
            {
                //print(myData)
                //print(self.calendar.component(.second, from: self.date))
                if self.previousValue != 0.0 {
                    if myData.acceleration.z > -0.3 && myData.acceleration.z < 0.3  {
                        print("Gangal")
                        self.previousValue=0.0
                    }
                    else {
                        
                        self.previousValue=0.0
                    }
                }
                
                if self.nextValue != 0.0 {
                    print(myData.acceleration.z)
                    if myData.acceleration.z > -0.2 && myData.acceleration.z < 0.1  {
                        print("Rugved")
                        self.gangalLabel.text = "Gangal Rocks"
                        self.nextValue=0.0
                    }
                    else {
                        self.gangalLabel.text = "Gangal Madarchod"
                        self.nextValue=0.0
                    }
                }
                
                if myData.acceleration.z < -0.8
                {
                    self.previousValue = myData.acceleration.z
                    //print("Gangal")
                    
                }
                else if myData.acceleration.z > 0.2
                {
                    self.nextValue = myData.acceleration.z
                    //print("Rugved")
                    self.gangalLabel.text = "Rugved Madarchod"
                    
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

