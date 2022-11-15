//
//  Webservice.h
//  Weather-app
//
//  Created by Reve on 11/12/22.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface Webservice : NSObject

+(nullable instancetype) sharedInstance;
-(void)basicHTTPGetApiURL:(nullable NSString*)url header:(nullable NSDictionary*)headerDict body:(nullable NSData*)bodyData completionHandler:(nullable void (^)(NSDictionary* responseDictionary, bool resultFound))completionBlock;
-(void) fetchTodaysWeatherDataWithLatitude:(double)latitude longitude:(double)longitude completionBlock:(nullable void (^)(NSDictionary* _Nullable)) completionBlock;
@end


NS_ASSUME_NONNULL_END
