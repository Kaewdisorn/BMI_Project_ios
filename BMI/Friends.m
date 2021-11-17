//
//  Friends.m
//  BMI
//
//  Created by Wongsaphat Praisri on 1/18/16.
//  Copyright © 2016 Wongsaphat Praisri. All rights reserved.
//

#import "Friends.h"
#import "SWRevealViewController.h"
#import "CellFriends.h"
#import <Parse/Parse.h>
#import "DetailFriends.h"

@interface Friends ()

@end

@implementation Friends{
    
    NSArray *arrFriend;
    NSArray *arrFriPic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    PFUser *cur = [PFUser currentUser];
    PFQuery *query = [PFQuery queryWithClassName:@"Friends"];
    [query whereKey:@"username" equalTo:cur.username];
    [query whereKey:@"status" equalTo:@"yes"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects,NSError *error) {
        
        if(!error)
        {
            
            arrFriend = [[NSMutableArray alloc] initWithArray:objects];
            arrFriend = objects;
            [self.tableView reloadData];
            //NSLog(@"%@",FriendName);
            
            
        }
        else
        {
            NSLog(@"Errorrrr = %@",error);
            
        }
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    return arrFriend.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CellFriends *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    PFObject *item = [arrFriend objectAtIndex:indexPath.row];
    
    [cell.ac startAnimating];
    cell.lb.text = [item objectForKey:@"userfriend"];
    PFFile *userImageFile = item[@"img2"];
    
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            UIImage *image = [UIImage imageWithData:imageData];
            cell.imgV.image = image;
            [cell.ac stopAnimating];
            cell.ac.hidden = YES;
        }
    }];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"detail"]){
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    PFObject *object = [arrFriend objectAtIndex:indexPath.row];
    DetailFriends *detailViewController = segue.destinationViewController;
    detailViewController.exam = object;
    
    
    }
    
    
}



@end
