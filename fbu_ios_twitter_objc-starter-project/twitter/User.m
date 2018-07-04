//
//  User.m
//  twitter
//
//  Created by Katie Kwan on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        // Initialize any other properties
        NSString *pic = dictionary[@"profile_image_url_https"];
        NSURL *profile = [NSURL URLWithString:pic];
        self.picture = profile;
    }
    return self;
}
@end


