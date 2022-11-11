//
//  HourlyTableViewCell.m
//  Weather-app
//
//  Created by Reve on 11/11/22.
//

#import "HourlyTableViewCell.h"

@interface HourlyTableViewCell()

@end


@implementation HourlyTableViewCell
static NSString* _identifier;

+ (NSString *)identifier {
    return  @"HourlyTableViewCell";
}

+ (void)setIdentifier:(NSString *)identifier {
    _identifier = identifier;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

+ (NSString *) nib {
    return _identifier;
}

@end
