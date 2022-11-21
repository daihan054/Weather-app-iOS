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
    
    enum CodingKeys: String, CodingKey {
        case time = "time"
        case temperature_2m_min = "temperature_2m_min"
        case temperature_2m_max = "temperature_2m_max"
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        time = try container.decode([String].self, forKey: .time)
        temperature_2m_min = try container.decode([Double].self, forKey: .temperature_2m_min)
        temperature_2m_max = try container.decode([Double].self, forKey: .temperature_2m_max)
        super.init()
    }
}
