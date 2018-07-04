//
//  TweetCell.m
//  
//
//  Created by Katie Kwan on 7/3/18.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setTweet:(Tweet *)tweet{
    _tweet = tweet;
    self.authorLabel.text = self.tweet.user.name;
    self.username.text = self.tweet.user.screenName;
    self.tweetLabel.text = self.tweet.text;
    self.dateLabel.text = self.tweet.createdAtString;
    NSString* retweetCount = [NSString stringWithFormat:@"%i", self.tweet.retweetCount];
    self.numberOfRetweets.text = retweetCount;
    NSString* likeCount = [NSString stringWithFormat:@"%i", self.tweet.favoriteCount];
    self.numberOfLikes.text = likeCount;
    self.profilePicture.image = nil;
    [self.profilePicture setImageWithURL:self.tweet.user.picture];
    
    
    
    
    //self.username.text = self.tweet.user.screenName;
    
    //self.numberOfRetweets = self.tweet.retweetCount;
    
    //self.likeButton = self.tweet.favorited.int;
   // self.numberOfRetweets.text = self.tweet.retweetCount;
    
    
}

@end
