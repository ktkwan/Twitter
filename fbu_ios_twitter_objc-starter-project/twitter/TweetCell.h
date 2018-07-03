//
//  TweetCell.h
//  
//
//  Created by Katie Kwan on 7/3/18.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"
#import "User.h"

@interface TweetCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UIButton *replyButton;
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UILabel *numberOfReplies;
@property (weak, nonatomic) IBOutlet UILabel *numberOfRetweets;
@property (weak, nonatomic) IBOutlet UILabel *numberOfLikes;
@property (weak, nonatomic) Tweet *tweet;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
