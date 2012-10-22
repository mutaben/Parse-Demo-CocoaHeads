//
//  TISendMessageViewController.m
//  Parse-Demo-CocoaHeads
//
//  Created by Mustapha Ben Lechhab on 17/10/12.
//  Copyright (c) 2012 Mustapha Ben Lechhab. All rights reserved.
//

#import "TISendMessageViewController.h"
#import "TIRoomTableViewController.h"

@interface TISendMessageViewController ()

@end

@implementation TISendMessageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)sendButtonPressed:(id)sender {
    
    PFObject *object = [PFObject objectWithClassName:@"Room"];
    [object setObject:self.messageField.text forKey:@"message"];
    [object setObject:self.userName forKey:@"user"];
    [object setObject:self.roomName forKey:@"room"];
    [object saveEventually];
    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:NULL];
    
}


@end
