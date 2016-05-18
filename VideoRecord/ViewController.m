//
//  ViewController.m
//  VideoRecord
//
//  Created by baolicheng on 15/11/2.
//  Copyright © 2015年 pangqingyao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)clickPressBtn:(id)sender
{
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    
    ipc.sourceType =  UIImagePickerControllerSourceTypeCamera;
    
//    ipc.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
    
    ipc.delegate = self;
    
    ipc.allowsEditing = YES;
    
    ipc.videoQuality = UIImagePickerControllerQualityTypeMedium;
    
    ipc.videoMaximumDuration = 30.0f; // 30 seconds
    
    ipc.mediaTypes = [NSArray arrayWithObject:@"mov"];
    
    [self presentViewController:ipc animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{
    
    NSURL *url = [info objectForKey:UIImagePickerControllerMediaURL];
    
    
    BOOL compatible = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum([url path]);
    
    if (compatible)
        
    {
        
        UISaveVideoAtPathToSavedPhotosAlbum([url path], self, nil, NULL);
        
        
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
