//
//  CurrentWeatherForeCast.h
//  Weather-app
//
//  Created by Reve on 11/14/22.
//

#import <Foundation/Foundation.h>

@interface CurrentWeatherForeCast : NSObject
@property(strong,nonatomic) NSNumber *temperature;
@property(strong,nonatomic) NSNumber *windspeed;
@property(strong,nonatomic) NSNumber *winddirection;
@property(strong,nonatomic) NSNumber *weathercode;
@property(strong,nonatomic) NSString *time;
@end
