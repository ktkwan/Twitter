//
//  TweetCell.m
//  
//
//  Created by Katie Kwan on 7/3/18.
//

#import "TweetCell.h"

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
    self.tweetLabel.text = self.tweet.text;
    self.dateLabel.text = self.tweet.createdAtString;
    
    //self.numberOfRetweets.int = self.tweet.retweetCount;
    
    //self.likeButton = self.tweet.favorited.int;
   // self.numberOfRetweets.text = self.tweet.retweetCount;
    
    
}

@end
