//
//  Webservice.m
//  Weather-app
//
//  Created by Reve on 11/12/22.
//

#import "Webservice.h"

static NSString *baseURL;
static NSString *todaysWeather;
static NSString *hourlyWeather;
static NSString *dailtyWeather;

@implementation Webservice

+(instancetype) sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t once_token;
    
    dispatch_once(&once_token,^{
        sharedInstance = [[self alloc]init];
    });
    
    return sharedInstance;
}

-(instancetype) init {
    self = [super init];
    [self setAllApiURL];
    return self;
}

-(void) setAllApiURL {
    
}

@end
