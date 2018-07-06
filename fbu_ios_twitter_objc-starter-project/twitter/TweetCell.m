//
//  TweetCell.m
//  
//
//  Created by Katie Kwan on 7/3/18.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"

@implementation TweetCell

- (IBAction)didTapFavorite:(id)sender {
    // TODO: Update the local tweet model
    // TODO: Update cell UI
    // TODO: Send a POST request to the POST favorites/create endpoint
    

    if (self.tweet.favorited == YES){
        self.tweet.favoriteCount -= 1;
        self.tweet.favorited = NO;
        self.likeButton.selected = NO;
        [[APIManager shared] unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
            [self refreshData];
        }];
    } else {
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        self.likeButton.selected = YES;
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
            [self refreshData];
        }];
    }
  
}

- (IBAction)didTapRetweet:(id)sender {
    // TODO: Update the local tweet model
    // TODO: Update cell UI
    // TODO: Send a POST request to the POST favorites/create endpoint
    
    
    if (self.tweet.retweeted == YES){
        self.tweet.retweetCount -= 1;
        self.tweet.retweeted = NO;
        self.retweetButton.selected = NO;
        [[APIManager shared] unretweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
            [self refreshData];
        }];
        
        
    } else {
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        self.retweetButton.selected = YES;
        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
            
            [self refreshData];
        }];
    }

}



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


- (void)refreshData{
    //    self.retweetButton.
    self.numberOfLikes.text = [NSString stringWithFormat:@"%i", self.tweet.favoriteCount];
    self.numberOfRetweets.text = [NSString stringWithFormat:@"%i", self.tweet.retweetCount];
    
    
    
}

@end
