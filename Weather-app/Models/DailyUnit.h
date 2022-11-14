//
//  DailyUnit.h
//  Weather-app
//
//  Created by Reve on 11/14/22.
//

#import <Foundation/Foundation.h>

@interface DailyUnit : NSObject
@property(strong,nonatomic) NSString *time;
@property(strong,nonatomic) NSString *temperature_2m_min;
@property(strong,nonatomic) NSString *temperature_2m_max;
@end

