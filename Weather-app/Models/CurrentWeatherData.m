//
//  CurrentWeatherData.m
//  Weather-app
//
//  Created by Reve on 11/14/22.
//

#import "CurrentWeatherData.h"

@implementation CurrentWeatherData

-(nullable instancetype) initWithDictionary: (nullable NSDictionary*) dict {
    if(self = [super init]) {
        self.time = dict[@"time"];
        self.temperature = dict[@"temperature"];
        self.windspeed = dict[@"windspeed"];
        self.winddirection = dict[@"winddirection"];
        self.weathercode = dict[@"weathercode"];
    }
    return self;
}
@end
