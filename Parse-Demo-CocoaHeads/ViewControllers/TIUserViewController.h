//
//  TIUserViewController.h
//  Parse-Demo-CocaHeads
//
//  Created by Mustapha Ben Lechhab on 17/10/12.
//  Copyright (c) 2012 Mustapha Ben Lechhab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TIUserViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic, strong) NSString* roomName;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
- (IBAction)avatarButtonPressed:(id)sender;
@end
