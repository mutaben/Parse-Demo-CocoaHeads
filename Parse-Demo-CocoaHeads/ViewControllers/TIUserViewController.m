//
//  TIUserViewController.m
//  Parse-Demo-CocaHeads
//
//  Created by Mustapha Ben Lechhab on 17/10/12.
//  Copyright (c) 2012 Mustapha Ben Lechhab. All rights reserved.
//

#import "TIUserViewController.h"
#import "TIRoomTableViewController.h"

@interface TIUserViewController ()

@end

@implementation TIUserViewController

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"userToRoom"])
    {
        [[segue destinationViewController] setRoomName:self.roomName];
        [[segue destinationViewController] setUserName:self.usernameField.text];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)avatarButtonPressed:(id)sender {

        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == YES){
            imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
        }
    
        imagePicker.delegate = self;
        [self presentViewController:imagePicker animated:YES completion:NULL];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:NULL];

    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    UIGraphicsBeginImageContext(CGSizeMake(120, 160));
    [image drawInRect: CGRectMake(0, 0, 120, 160)];
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImageJPEGRepresentation(smallImage, 0.05f);
    [self uploadImage:imageData];
}

-(void)uploadImage:(NSData*)imageData{
    PFFile *imageFile = [PFFile fileWithName:@"image.jpg" data:imageData];
    [imageFile save];
    PFObject *object = [PFObject objectWithClassName:@"Avatars"];
    [object setObject:imageFile forKey:@"imageFile"];
    [object setObject:self.usernameField.text forKey:@"user"];
    [object save];

}
@end
