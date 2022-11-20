//
//  UIView+Extension.m
//  Weather-app
//
//  Created by Reve on 11/15/22.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

-(void) makeRoundedCornerWithRadius:(double) radius {
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = true;
}

@end
