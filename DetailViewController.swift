//
//  DetailViewController.swift
//  WhatsTheWeather
//
//  Created by Steven Yang on 5/22/16.
//  Copyright © 2016 Yato. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!

    @IBOutlet weak var weatherReport: UILabel!
    
    var checkCity = ""
    
    var wasSuccessful = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityNameLabel.text = checkCity.capitalizedString
        
        let attemptedUrl = NSURL(string: "http://www.weather-forecast.com/locations/\(checkCity.stringByReplacingOccurrencesOfString(" ", withString: "-"))/forecasts/latest")
        
        if let url = attemptedUrl {
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
         
            if let urlContent = data {
                
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                
                let websiteArray = webContent?.componentsSeparatedByString("3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")

                if websiteArray!.count > 1 {
                    
                    let weatherArray = websiteArray![1].componentsSeparatedByString("</span>")
                    print(weatherArray[0])
                    if weatherArray.count > 1 {
                        
                        var weatherSummary = weatherArray[0].stringByReplacingOccurrencesOfString("&deg", withString: "º")
                        
                        weatherSummary = weatherSummary.stringByReplacingOccurrencesOfString(".", withString: ".\n")
                        
                        self.wasSuccessful = true
                        
                        dispatch_async(dispatch_get_main_queue(), {
                            
                            self.weatherReport.text = "\(weatherSummary)"
                            
                        })
                        
                    }
                    

                }
                

            }
            
                            if self.wasSuccessful == false {
            
                                self.weatherReport.text = "No city by that name exist, sorry!"
                                
                                print("caocao")
            
                            }
        
        }
        
        task.resume()
    
        } else {
            
            weatherReport.text = "No city by that name exist, sorry!"
            
            print("caocao")
            
        }

    }


}
