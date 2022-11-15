//
//  HourlyWeatherData.h
//  Weather-app
//
//  Created by Reve on 11/14/22.
//

#import <Foundation/Foundation.h>

@interface HourlyWeatherData : NSObject
@property(strong,nonatomic,nullable) NSMutableArray<NSString*> *time;
@property(strong,nonatomic,nullable) NSMutableArray<NSNumber*> *temperature_2m;

-(nullable instancetype) initWithDictionary:(nullable NSDictionary*) dict;
@end
