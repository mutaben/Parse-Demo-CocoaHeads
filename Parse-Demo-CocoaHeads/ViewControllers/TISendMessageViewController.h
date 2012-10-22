//
//  TISendMessageViewController.h
//  Parse-Demo-CocoaHeads
//
//  Created by Mustapha Ben Lechhab on 17/10/12.
//  Copyright (c) 2012 Mustapha Ben Lechhab. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TISendMessageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *messageField;
@property (nonatomic, strong) NSString* roomName;
@property (nonatomic, strong) NSString* userName;
- (IBAction)sendButtonPressed:(id)sender;

@end
