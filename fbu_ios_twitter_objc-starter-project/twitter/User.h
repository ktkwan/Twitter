//
//  User.h
//  twitter
//
//  Created by Katie Kwan on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *screenName;

// Create initializer
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end


