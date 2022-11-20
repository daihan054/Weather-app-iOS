//
//  DailyWeatherData.swift
//  Weather-app
//
//  Created by Reve on 11/20/22.
//

import Foundation

class DailyWeatherData: NSObject, Codable {
    
    let time: [String]
    let temperature_2m_min: [Double]
    let temperature_2m_max: [Double]
}
