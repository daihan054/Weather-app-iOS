//
//  WeatherCell.h
//  Weather-app
//
//  Created by Reve on 11/11/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeatherCell : UITableViewCell

@property(strong,atomic,class) NSString*  identifier;

+(NSString* _Nullable) nib;

@end

NS_ASSUME_NONNULL_END
