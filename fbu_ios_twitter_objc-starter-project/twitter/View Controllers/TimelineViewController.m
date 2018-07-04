//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "Tweet.h"
#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"

@interface TimelineViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *tweetsArray;
@property (strong, nonatomic) UIRefreshControl *refreshControl;



@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
   
    [self fetchTweets];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchTweets) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    

    // Get timeline
 
}

- (void)fetchTweets{
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            self.tweets = [NSMutableArray arrayWithArray:tweets];
            
            [self.tableView reloadData];
            [self.refreshControl endRefreshing];
           
            
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
    }];
}

- (void)beginRefresh:(UIRefreshControl *)refreshControl {
    
    // Create NSURL and NSURLRequest
    
    
    
                                                [self.tableView reloadData];
                                                
                                                // Tell the refreshControl to stop spinning
                                                [refreshControl endRefreshing];
                                                
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.tweetsArray;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
//
//    cell.tweet = self.tweetsArray[indexPath.row];
//
//    return cell;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell" forIndexPath:indexPath];
    
    Tweet *tweet = self.tweets[indexPath.row];
    
    cell.tweet = tweet;
    
    //cell.username.text = tweet[@"username"];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweets.count;
    
    
}





@end
