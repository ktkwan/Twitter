//
//  ProfileViewController.h
//  twitter
//
//  Created by Katie Kwan on 7/6/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "APIManager.h"
#import "UIImageView+AFNetworking.h"

@interface ProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UIImageView *headerPicture;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *followingLabel;
@property (weak, nonatomic) IBOutlet UILabel *followersLabel;

@end
