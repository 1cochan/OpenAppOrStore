//
//  ViewController.m
//  ExamOpenURL
//
//  Created by default on 6/1/16.
//  Copyright © 2016 default. All rights reserved.
//

#import "ViewController.h"
#import <StoreKit/StoreKit.h>

@interface ViewController () <SKStoreProductViewControllerDelegate>

@end

@implementation ViewController{
    BOOL isSuccessOpen;
    SKStoreProductViewController *productViewController;
}

// キャンセルボタンが押されたときの処理
- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// アプリ内AppStore画面を表示するメソッド
- (void)showSKStoreProductViewController {
    productViewController = [[SKStoreProductViewController alloc] init];
    productViewController.delegate = self;
    
    [self presentViewController:productViewController animated:YES completion:^() {
        
        NSString *productID = @"763377066"; // 調べたアプリのID
        NSDictionary *parameters = @{SKStoreProductParameterITunesItemIdentifier:productID};
        [productViewController loadProductWithParameters:parameters
                                         completionBlock:^(BOOL result, NSError *error){
                                         }];
    }];
}

- (IBAction)btnTap:(id)sender {
    NSLog(@"btnTapTabelogV2!!!");
    id urlString = @"tabelog-v2://";
    self->isSuccessOpen = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    
    if(self->isSuccessOpen){
        return;
    }
    
    [self showSKStoreProductViewController];
    
    
}

- (IBAction)btnTapTabelogV1:(id)sender {
    NSLog(@"btnTapTabelogV1!!!");
    id urlString = @"tabelog-v1://";
    self->isSuccessOpen = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    if(self->isSuccessOpen){
        return;
    }
    
    [self showSKStoreProductViewController];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
