//
//  HourlyWeatherData.h
//  Weather-app
//
//  Created by Reve on 11/14/22.
//

#import <Foundation/Foundation.h>

@interface HourlyWeatherData : NSObject
@property(strong,nonatomic) NSMutableArray<NSString*> *time;
@property(strong,nonatomic) NSMutableArray<NSNumber*> *temperature_2m;
@end
