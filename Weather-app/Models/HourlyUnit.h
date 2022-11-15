//
//  HourlyUnit.h
//  Weather-app
//
//  Created by Reve on 11/14/22.
//

#import <Foundation/Foundation.h>

@interface HourlyUnit : NSObject
@property(strong,nonatomic,nullable) NSString *time;
@property(strong,nonatomic,nullable) NSString *temperature_2m;

-(nullable instancetype) initWithDictionary:(nullable NSDictionary*) dict;
@end

