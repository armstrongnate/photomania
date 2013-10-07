//
//  PhotosTVC.h
//  Photomania
//
//  Created by Nate Armstrong on 10/7/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "Photographer.h"
#import "CoreDataTableViewController.h"
#import <UIKit/UIKit.h>

@interface PhotosTVC : CoreDataTableViewController

@property (nonatomic, strong)Photographer *photographer;

@end
