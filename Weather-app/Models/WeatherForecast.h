//
//  WeatherForecast.h
//  Weather-app
//
//  Created by Reve on 11/14/22.
//

#import <Foundation/Foundation.h>
#import "HourlyUnit.h"
#import "CurrentWeatherData.h"
#import "HourlyWeatherData.h"
#import "DailyUnit.h"
#import "DailyWeatherData.h"

@interface WeatherForecast : NSObject

@property(strong,nonatomic,nullable) NSNumber *latitude;
@property(strong,nonatomic,nullable) NSNumber *longitude;
@property(strong,nonatomic,nullable) NSNumber *generationtime_ms;
@property(strong,nonatomic,nullable) NSNumber *utc_offset_seconds;
@property(strong,nonatomic,nullable) NSString *timezone;
@property(strong,nonatomic,nullable) NSString *timezone_abbreviation;
@property(strong,nonatomic,nullable) NSNumber *elevation;
@property(strong,nonatomic,nullable) CurrentWeatherData* current_weather;
@property(strong,nonatomic,nullable) HourlyUnit *hourly_units;
@property(strong,nonatomic,nullable) HourlyWeatherData *hourly;
@property(strong,nonatomic,nullable) DailyUnit *daily_units;
@property(strong,nonatomic,nullable) DailyWeatherData *daily;

-(nullable instancetype)initWithDictionary: (nullable NSDictionary *) dictionary;


@end
