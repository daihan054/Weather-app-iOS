//
//  Webservice.h
//  Weather-app
//
//  Created by Reve on 11/12/22.
//

#import <Foundation/Foundation.h>

@interface Webservice : NSObject

+(instancetype) sharedInstance;
-(void)basicHTTPGetApiURL:(NSString*)url header:(NSDictionary*)headerDict body:(NSData*)bodyData completionHandler:(void (^)(NSDictionary* responseDictionary, bool resultFound))completionBlock;
-(void) fetchTodaysWeatherDataWithCompletionHandler:(void (^)(NSDictionary* _Nullable)) completionBlock;
@end
