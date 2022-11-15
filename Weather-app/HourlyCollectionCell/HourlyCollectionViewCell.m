//
//  HourlyTableViewCell.m
//  Weather-app
//
//  Created by Reve on 11/11/22.
//

#import "HourlyCollectionViewCell.h"

@interface HourlyCollectionViewCell()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;

@end


@implementation HourlyCollectionViewCell
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

+ (nullable UINib *) nib {
    return [UINib nibWithNibName:self.identifier bundle:nil];
}

-(void) updateUIWithTimeString:(NSString*)timeString tempString:(NSString*)tempString {
    self.timeLabel.text = timeString;
    self.tempLabel.text = tempString;
}

@end
