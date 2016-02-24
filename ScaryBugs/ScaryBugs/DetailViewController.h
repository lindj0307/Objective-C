//
//  DetailViewController.h
//  ScaryBugs
//
//  Created by 林东杰 on 2/24/16.
//  Copyright © 2016 Joey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

