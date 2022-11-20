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
-(void)basicHTTPGetApiURL:(NSString*_Nullable)url header:(NSDictionary*)headerDict body:(NSData*)bodyData completionHandler:(void (^_Nullable)(NSData* data, bool resultFound))completionBlock;
-(void) fetchTodaysWeatherDataWithLatitude:(double)latitude longitude:(double)longitude completionBlock:(nullable void (^)(NSData* _Nullable)) completionBlock;
@end


NS_ASSUME_NONNULL_END
