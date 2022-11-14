//
//  DailyWeatherData.h
//  Weather-app
//
//  Created by Reve on 11/14/22.
//

#import <Foundation/Foundation.h>

@interface DailyWeatherData : NSObject

@property(strong,nonatomic,nullable) NSMutableArray<NSString*> *time;
@property(strong,nonatomic,nullable) NSMutableArray<NSNumber*> *temperature_2m_min;
@property(strong,nonatomic,nullable) NSMutableArray<NSNumber*> *temperature_2m_max;

-(instancetype _Nullable) initWithDictionary:(NSDictionary* _Nullable) dict;
@end
