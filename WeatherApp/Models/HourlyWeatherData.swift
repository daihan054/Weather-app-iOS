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
    
    enum CodingKeys: String, CodingKey {
        case time = "time"
        case temperature_2m = "temperature_2m"
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        time = try container.decode([String].self, forKey: .time)
        temperature_2m = try container.decode([String].self, forKey: .temperature_2m)
        super.init()
    }
}
