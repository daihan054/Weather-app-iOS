//
//  CurrentWeatherForeCast.h
//  Weather-app
//
//  Created by Reve on 11/14/22.
//

#import <Foundation/Foundation.h>

@interface CurrentWeatherData : NSObject
@property(strong,nonatomic,nullable) NSNumber *temperature;
@property(strong,nonatomic,nullable) NSNumber *windspeed;
@property(strong,nonatomic,nullable) NSNumber *winddirection;
@property(strong,nonatomic,nullable) NSNumber *weathercode;
@property(strong,nonatomic,nullable) NSString *time;

-(nullable instancetype) initWithDictionary: (nullable NSDictionary*) dict;
@end
