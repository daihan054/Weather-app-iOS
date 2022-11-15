//
//  WeatherCell.m
//  Weather-app
//
//  Created by Reve on 11/11/22.
//

#import "WeatherCell.h"

@interface WeatherCell()
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *minTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxTempLabel;

@end

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

+ (UINib * _Nullable) nib {
    return [UINib nibWithNibName:self.identifier bundle:nil];
}

-(void) updateUIWith:(NSString*) dayName minTemp:(NSNumber*)minTemp maxTemp:(NSNumber*)maxTemp {
    self.dayLabel.text = dayName;
    self.minTempLabel.text = [minTemp stringValue];
    self.maxTempLabel.text = [maxTemp stringValue];
}

@end
