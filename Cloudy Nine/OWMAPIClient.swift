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

class OWMAPIClient{
    
    static var shared = OWMAPIClient()
    
    let defaultSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    var dataTask: NSURLSessionDataTask? = nil
    
    let currentWeatherURL: NSURL! = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?")
    let fiveDayWeatherURL: NSURL! = NSURL(string: "http://api.openweathermap.org/data/2.5/forecast?")

    func getCurrentWeather(location: CLLocation){

        getWeather(location, current: true)
        
    }
    
    func getFiveDay(location: CLLocation){
        
        getWeather(location, current: false)
        
    }
    
    func getWeather(location: CLLocation, current: Bool){
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        var component: NSURLComponents!
        if current{
            component = NSURLComponents.init(URL: currentWeatherURL, resolvingAgainstBaseURL: false)
        }else{
            component = NSURLComponents.init(URL: fiveDayWeatherURL, resolvingAgainstBaseURL: false)
        }
        
        component!.queryItems = [
            NSURLQueryItem.init(name: "lat", value: String(location.coordinate.latitude)),
            NSURLQueryItem.init(name: "lon", value: String(location.coordinate.longitude)),
            NSURLQueryItem.init(name: "appid", value: APIKey.key)]
        
        let request = NSURLRequest(URL: component!.URL!)
        
        dataTask = defaultSession.dataTaskWithRequest(request, completionHandler: { data, response, error in
            dispatch_async(dispatch_get_main_queue(), {
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            })
            
            if let error = error{
                print("Error trying to get current weather: \(error.localizedDescription)")
            }
            if let response = response as? NSHTTPURLResponse{
                if (response.statusCode == 200){
                    
                }else{
                    print("HTTP response code: \(response.statusCode)")
                }
            }
        })
        dataTask?.resume()
    }
}