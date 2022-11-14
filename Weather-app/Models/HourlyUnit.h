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

-(instancetype _Nullable) initWithDictionary:(NSDictionary* _Nullable) dict;
@end

