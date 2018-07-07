//
//  ProfileViewController.m
//  twitter
//
//  Created by Katie Kwan on 7/6/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "ProfileViewController.h"
#import "User.h"
#import "Tweet.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[APIManager shared] getProfile:^(User *user, NSError *error) {
        if (user){
            [self.profilePicture setImageWithURL: user.picture];
            [self.headerPicture setImageWithURL:user.header];
            self.followersLabel.text = user.followersCount;
            self.followingLabel.text = user.followingCount;
            self.nameLabel.text = user.name;
            self.userName.text = user.screenName;
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
