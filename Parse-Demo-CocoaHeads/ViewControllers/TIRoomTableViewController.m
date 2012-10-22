//
//  TIRoomTableViewController.m
//  Parse-Demo-CocaHeads
//
//  Created by Mustapha Ben Lechhab on 17/10/12.
//  Copyright (c) 2012 Mustapha Ben Lechhab. All rights reserved.
//

#import "TIRoomTableViewController.h"

@interface TIRoomTableViewController ()
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) NSMutableDictionary *avatars;
@end

@implementation TIRoomTableViewController

- (id)initWithStyle:(UITableViewStyle)style className:(NSString *)aClassName
{
    self = [super initWithStyle:style className:aClassName];
    if (self) {

    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Avatars"];
    //query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    NSArray *array = [query findObjects];
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        
        _avatars = [NSMutableDictionary dictionary];
    
        for (PFObject *eachObject in array) {
            PFFile *theImage = [eachObject objectForKey:@"imageFile"];
            NSData *imageData = [theImage getData];
            UIImage *image = [UIImage imageWithData:imageData];
            [self.avatars setObject:image forKey:[eachObject objectForKey:@"user"]];
            
        }
//        
//    }];
    
    _dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    [self.dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    NSLocale *frLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"fr_FR"];
    [_dateFormatter setLocale:frLocale];

	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"modalMessage"])
    {
        [[segue destinationViewController] setRoomName:self.roomName];
        [[segue destinationViewController] setUserName:self.userName];
    }
}

- (PFQuery *)queryForTable{
    PFQuery *query = [PFQuery queryWithClassName:@"Room"];
    query.cachePolicy = kPFCachePolicyNetworkElseCache;
    
    [query whereKey:@"room" equalTo:self.roomName];
    [query orderByDescending:@"createdAt"];
    return query;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    static NSString *CellIdentifier = @"messageCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell
    UILabel *user = (UILabel*)[cell viewWithTag:101];
    UITextView *message =(UITextView*) [cell viewWithTag:102];
    UILabel *date  = (UILabel*)[cell viewWithTag:103];
    UIImageView *imageView  = (UIImageView*)[cell viewWithTag:104];
    
    user.text = [object objectForKey:@"user"];
    message.text = [object objectForKey:@"message"];
    date.text = [self.dateFormatter stringFromDate:object.createdAt];
    if ([self.avatars objectForKey:[object objectForKey:@"user"]]){
        imageView.image = (UIImage*)[self.avatars objectForKey:[object objectForKey:@"user"]];
    }
    else{
        imageView.image = [UIImage imageNamed:@"cocoaheads"];
    }
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
