//
//  WeatherForecast.swift
//  Weather-app
//
//  Created by Reve on 11/20/22.
//

import Foundation

class WeatherForecast: NSObject, Codable {
    
    let latitude: Double
    let longitude: Double
    let generationtime_ms: Double
    let utc_offset_seconds: Double
    let timezone: String
    let timezone_abbreviation: String
    let elevation: Double
    let current_weather: CurrentWeatherData
    let hourly_units: HourlyUnit
    let hourly: HourlyWeatherData
    let daily_units: DailyUnit
    let daily: DailyWeatherData
    
    enum CodingKeys: String, CodingKey {
        case latitude = "latitude"
        case longitude = "longitude"
        case generationtime_ms = "generationtime_ms"
        case utc_offset_seconds = "utc_offset_seconds"
        case timezone = "timezone"
        case timezone_abbreviation = "timezone_abbreviation"
        case elevation = "elevation"
        case current_weather = "current_weather"
        case hourly_units = "hourly_units"
        case hourly = "hourly"
        case daily_units = "daily_units"
        case daily = "daily"
    }
    
    @objc public class func create(from data: Data) -> MyCodableItem {
        let decoder = JSONDecoder()
        let item = try! decoder.decode(MyCodableItem.self, from: data)
        return item
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try? container.decode(Double.self, forKey: .longitude)
        generationtime_ms = try? container.decode(Double.self, forKey: .generationtime_ms)
        utc_offset_seconds = try? container.decode(Double.self, forKey: .utc_offset_seconds)
        timezone = try? container.decode(Double.self, forKey: .timezone)
        timezone_abbreviation = try? container.decode(Double.self, forKey: .timezone_abbreviation)
        elevation = try? container.decode(Double.self, forKey: .elevation)
        current_weather = try? container.decode(Double.self, forKey: .current_weather)
        hourly_units = try? container.decode(Double.self, forKey: .hourly_units)
        hourly = try? container.decode(Double.self, forKey: .hourly)
        daily_units = try? container.decode(Double.self, forKey: .daily_units)
        daily = try? container.decode(Double.self, forKey: .daily)
        super.init()
    }
    
    required init(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
