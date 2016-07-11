//
//  OWMAPIClient.swift
//  Cloudy Nine
//
//  Created by William on 7/8/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import SwiftyJSON

class OWMAPIClient{
    
    static var shared = OWMAPIClient()
    
    let formatter = NSDateFormatter()
    let calendar = NSCalendar.currentCalendar()
//    let formatter = NSDateFormatter()
//    formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
//    
//    let date = formatter.dateFromString("2016-07-11 09:00:00")
//    
//    let calendar = NSCalendar.currentCalendar()
//    let comp = calendar.components([.Day], fromDate: date!)
//    comp.day
    
    let defaultSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    var dataTask: NSURLSessionDataTask? = nil
    
    let currentWeatherURL: NSURL! = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?")
    let fiveDayWeatherURL: NSURL! = NSURL(string: "http://api.openweathermap.org/data/2.5/forecast?")
    
    func getWeather(location: Location, success: [WeatherData] -> Void){
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        var currentURL: NSURLComponents!
        currentURL = NSURLComponents.init(URL: currentWeatherURL, resolvingAgainstBaseURL: false)
        var fiveDayURL: NSURLComponents!
        fiveDayURL = NSURLComponents.init(URL: fiveDayWeatherURL, resolvingAgainstBaseURL: false)
        
        fiveDayURL!.queryItems = [
            NSURLQueryItem.init(name: "lat", value: String(location.lat)),
            NSURLQueryItem.init(name: "lon", value: String(location.lon)),
            NSURLQueryItem.init(name: "appid", value: APIKey.key)]
        
        let request = NSURLRequest(URL: fiveDayURL!.URL!)
        
        dataTask = defaultSession.dataTaskWithRequest(request, completionHandler: { data, response, error in
            dispatch_async(dispatch_get_main_queue(), {
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            })
            if let error = error{
                print("Error trying to get current weather: \(error.localizedDescription)")
            }
            if let response = response as? NSHTTPURLResponse{
                if (response.statusCode == 200){
                    let json = JSON(data: data!)
                    for i in 0..<5{
                        
                    }
                }else{
                    print("HTTP response code: \(response.statusCode)")
                }
            }
        })
        dataTask?.resume()
    }
}