//
//  CurrentWeatherData.swift
//  Weather-app
//
//  Created by Reve on 11/20/22.
//

import Foundation

class CurrentWeatherData: NSObject, Codable {
    let temperature: Double
    let windspeed: Double
    let winddirection: Double
    let weathercode: Int
    let time: String
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temperature"
        case windspeed = "windspeed"
        case winddirection = "winddirection"
        case weathercode = "weathercode"
        case time = "time"
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        temperature = try container.decode(Double.self, forKey: .temperature)
        windspeed = try container.decode(Double.self, forKey: .windspeed)
        winddirection = try container.decode(Double.self, forKey: .winddirection)
        weathercode = try container.decode(Int.self, forKey: .weathercode)
        time = try container.decode(String.self, forKey: .time)
        super.init()
    }
}
