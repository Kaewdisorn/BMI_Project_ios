//
//  addFriend.m
//  BMI
//
//  Created by Wongsaphat Praisri on 12/23/15.
//  Copyright © 2015 Wongsaphat Praisri. All rights reserved.
//

#import "addFriend.h"
#import "SWRevealViewController.h"
#import <Parse/Parse.h>
#import "customCell.h"
#import "detail.h"


@interface addFriend ()

@end

@implementation addFriend{
    
    NSArray *FriendName;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    PFUser *cur = [PFUser currentUser];
    PFQuery *query = [PFQuery queryWithClassName:@"_User"];
    [query whereKey:@"username" notEqualTo:cur.username];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects,NSError *error) {
        
        if(!error)
        {
            
            FriendName = [[NSMutableArray alloc] initWithArray:objects];
            FriendName = objects;
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
    
}

/*- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    return FriendName.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    customCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    PFObject *item = [FriendName objectAtIndex:indexPath.row];
    
    [cell.load startAnimating];
    cell.lbFriend.text = [item objectForKey:@"username"];
    PFFile *userImageFile = item[@"img"];
    
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            UIImage *image = [UIImage imageWithData:imageData];
            cell.imgView.image = image;
            [cell.load stopAnimating];
            cell.load.hidden = YES;
        }
    }];
    
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{    if ([segue.identifier isEqualToString:@"detail"]){
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    PFObject *object = [FriendName objectAtIndex:indexPath.row];
    detail *detailViewController = segue.destinationViewController;
    detailViewController.exam = object;
    
   
    }
    
    
}



@end
