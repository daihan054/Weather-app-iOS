//
//  HourlyWeatherData.swift
//  Weather-app
//
//  Created by Reve on 11/20/22.
//

import Foundation

class HourlyWeatherData: NSObject, Codable {
    
    let time: [String]
    let temperature_2m: [String]
}
