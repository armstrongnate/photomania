//
//  PhotoVC.m
//  Photomania
//
//  Created by Nate Armstrong on 10/8/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "PhotoVC.h"

@interface PhotoVC ()
@property (strong, nonatomic) IBOutlet UIImageView *mainImageView;
@end

@implementation PhotoVC

-(void)viewDidLoad {
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_imageURL]]];
    self.mainImageView.image = image;
}

-(void)setImageURL:(NSString *)imageURL {
    _imageURL = imageURL;
}


@end
