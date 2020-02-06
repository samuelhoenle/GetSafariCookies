//
//  main.m
//  GetSafariCookies
//
//  Created by Jeremy Agostino on 7/16/15.
//  Copyright (c) 2015 GroundControl. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		
		printf("# HTTP Cookie File\n");

		NSArray * cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
		
		for (NSHTTPCookie * cookie in cookies) {
			
			NSString * domainSpecified = [cookie.domain hasPrefix:@"."] ? @"TRUE" : @"FALSE";
			NSString * secure = [cookie isSecure] ? @"TRUE" : @"FALSE";

			NSString * line = [NSString stringWithFormat:@""
							   "%@\t"	// domain
							   "%@\t"	// domain specified (TRUE/FALSE)
							   "%@\t"	// path
							   "%@\t"	// secure (TRUE/FALSE)
							   "%ld\t"	// expire time
							   "%@\t"	// name
							   "%@\n",	// value
							   cookie.domain,
					   		   domainSpecified,
							   cookie.path,
					   		   secure,
							   (long)cookie.expiresDate.timeIntervalSince1970,
							   cookie.name,
							   cookie.value];
			printf("%s", [line cStringUsingEncoding:NSUTF8StringEncoding]);
		}
	}
    return 0;
}
