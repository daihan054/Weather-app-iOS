//
//  WeatherCell.m
//  Weather-app
//
//  Created by Reve on 11/11/22.
//

#import "WeatherCell.h"

@implementation WeatherCell

static NSString* _identifier;

+ (NSString *)identifier {
    return  @"WeatherCell";
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
