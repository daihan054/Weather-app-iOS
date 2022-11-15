//
//  Webservice.h
//  Weather-app
//
//  Created by Reve on 11/12/22.
//

#import <Foundation/Foundation.h>

@interface Webservice : NSObject

+(instancetype _Nullable ) sharedInstance;
-(void)basicHTTPGetApiURL:(NSString*)url header:(NSDictionary*)headerDict body:(NSData*)bodyData completionHandler:(void (^)(NSDictionary* responseDictionary, bool resultFound))completionBlock;
-(void) fetchTodaysWeatherDataWithLatitude:(double)latitude longitude:(double)longitude completionBlock:(void (^_Nullable)(NSDictionary* _Nullable)) completionBlock;
@end
