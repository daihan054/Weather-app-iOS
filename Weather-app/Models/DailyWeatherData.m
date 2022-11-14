//
//  DailyWeatherData.m
//  Weather-app
//
//  Created by Reve on 11/14/22.
//

#import "DailyWeatherData.h"

@implementation DailyWeatherData

-(instancetype _Nullable) initWithDictionary:(NSDictionary* _Nullable) dict {
    if(self = [super init]) {
        self.time = dict[@"time"];
        self.temperature_2m_min = dict[@"temperature_2m_min"];
        self.temperature_2m_max = dict[@"temperature_2m_max"];
    }
    return self;
}

@end
