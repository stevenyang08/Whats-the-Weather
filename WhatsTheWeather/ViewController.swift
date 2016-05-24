//
//  ViewController.swift
//  WhatsTheWeather
//
//  Created by Steven Yang on 5/22/16.
//  Copyright © 2016 Yato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "http://www.weather-forecast.com")
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func submitButtonTapped(sender: AnyObject) {
        performSegueWithIdentifier("segue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! DetailViewController
        destination.checkCity = textFieldText.text!
//        destination.cityNameLabel.text = textFieldText.text
    }


}

