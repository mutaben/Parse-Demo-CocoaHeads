//
//  TIRoomTableViewController.h
//  Parse-Demo-CocaHeads
//
//  Created by Mustapha Ben Lechhab on 17/10/12.
//  Copyright (c) 2012 Mustapha Ben Lechhab. All rights reserved.
//

#import <Parse/Parse.h>

@interface TIRoomTableViewController : PFQueryTableViewController
@property (nonatomic, strong) NSString* roomName;
@property (nonatomic, strong) NSString* userName;
@end
