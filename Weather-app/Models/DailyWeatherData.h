//
//  DailyWeatherData.h
//  Weather-app
//
//  Created by Reve on 11/14/22.
//

#import <Foundation/Foundation.h>

@interface DailyWeatherData : NSObject

@property(strong,nonatomic) NSMutableArray<NSString*> *time;
@property(strong,nonatomic) NSMutableArray<NSNumber*> *temperature_2m_min;
@property(strong,nonatomic) NSMutableArray<NSNumber*> *temperature_2m_max;

@end
