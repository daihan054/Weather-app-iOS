//
//  HourlyTableViewCell.h
//  Weather-app
//
//  Created by Reve on 11/11/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HourlyCollectionViewCell : UICollectionViewCell

-(void) updateUIWithTimeString:(NSString*)timeString tempString:(NSString*)tempString;

@property(strong,atomic,class,nullable) NSString* identifier;

+(nullable NSString*) nib;
@end

NS_ASSUME_NONNULL_END
