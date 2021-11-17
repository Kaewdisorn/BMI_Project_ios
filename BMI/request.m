//
//  request.m
//  BMI
//
//  Created by Wongsaphat Praisri on 1/15/16.
//  Copyright © 2016 Wongsaphat Praisri. All rights reserved.
//

#import "request.h"
#import "SWRevealViewController.h"
#import "cellrequest.h"
#import "requestDetail.h"

@interface request ()

@end

@implementation request{
    
    NSArray *requestName;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    PFUser *cur = [PFUser currentUser];
    PFQuery *query = [PFQuery queryWithClassName:@"Friends"];
    [query whereKey:@"userfriend" equalTo:cur.username];
    [query whereKey:@"status" equalTo:@"pending"];

    [query findObjectsInBackgroundWithBlock:^(NSArray *objects,NSError *error) {
        
        if(!error)
        {
            
            requestName = [[NSMutableArray alloc] initWithArray:objects];
            requestName = objects;
            [self.tableView reloadData];
           // NSLog(@"%@",requestName);
            
            
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
    
    return requestName.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cellrequest *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    PFObject *item = [requestName objectAtIndex:indexPath.row];
    
    [cell.ac startAnimating];
    cell.label.text = [item objectForKey:@"username"];
    PFFile *userImageFile = item[@"img"];
    
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            UIImage *image = [UIImage imageWithData:imageData];
            cell.imgView.image = image;
            [cell.ac stopAnimating];
            cell.ac.hidden = YES;
        }
    }];
    
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{    if ([segue.identifier isEqualToString:@"detail"]){
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    PFObject *object = [requestName objectAtIndex:indexPath.row];
    requestDetail *detailViewController = segue.destinationViewController;
    detailViewController.exam = object;
    
    
    }
    
    
}




@end
