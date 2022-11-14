//
//  WeatherForecast.h
//  Weather-app
//
//  Created by Reve on 11/14/22.
//

#import <Foundation/Foundation.h>
#import "HourlyUnit.h"
#import "CurrentWeatherForeCast.h"
#import "HourlyWeatherData.h"
#import "DailyUnit.h"
#import "DailyWeatherData.h"

@interface WeatherForecast : NSObject

@property(strong,nonatomic) NSNumber *latitude;
@property(strong,nonatomic) NSNumber *longitude;
@property(strong,nonatomic) NSNumber *generationtime_ms;
@property(strong,nonatomic) NSNumber *utc_offset_seconds;
@property(strong,nonatomic) NSString *timezone;
@property(strong,nonatomic) NSString *timezone_abbreviation;
@property(strong,nonatomic) NSNumber *elevation;
@property(strong,nonatomic) CurrentWeatherForeCast* current_weather;
@property(strong,nonatomic) HourlyUnit *hourly_units;
@property(strong,nonatomic) HourlyWeatherData *hourly;
@property(strong,nonatomic) DailyUnit *daily_units;
@property(strong,nonatomic) DailyWeatherData *daily;

@end
