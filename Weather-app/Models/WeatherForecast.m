//
//  WeatherForecast.m
//  Weather-app
//
//  Created by Reve on 11/14/22.
//

#import "WeatherForecast.h"

@implementation WeatherForecast

-(instancetype _Nullable )initWithDictionary: (NSDictionary * _Nullable) dictionary {
    if (self = [super init]) {
        self.latitude = dictionary[@"latitude"];
        self.longitude = dictionary[@"longitude"];
        self.generationtime_ms = dictionary[@"generationtime_ms"];
        self.utc_offset_seconds = dictionary[@"utc_offset_seconds"];
        self.timezone = dictionary[@"timezone"];
        self.timezone_abbreviation = dictionary[@"timezone_abbreviation"];
        self.elevation = dictionary[@"elevation"];
        self.current_weather = dictionary[@"current_weather"];
        self.hourly_units = dictionary[@"hourly_units"];
        self.hourly = dictionary[@"hourly"];
        self.daily_units = dictionary[@"daily_units"];
        self.daily = dictionary[@"daily"];
    }
    return self;
}

- (void)setCurrent_weather:(NSDictionary *)current_weather {
    _current_weather = [[CurrentWeatherData alloc]initWithDictionary:current_weather];
}

- (void)setHourly_units:(NSDictionary *)hourly_units {
    _hourly_units = [[HourlyUnit alloc] initWithDictionary:hourly_units];
}

- (void)setDaily_units:(NSDictionary *)daily_units {
    _daily_units = [[DailyUnit alloc]initWithDictionary:daily_units];
}

- (void)setDaily:(NSDictionary *)daily {
    _daily = [[DailyWeatherData alloc]initWithDictionary:daily];
}

- (void)setHourly:(NSDictionary *)hourly {
    _hourly = [[HourlyWeatherData alloc] initWithDictionary:hourly];
}

@end
