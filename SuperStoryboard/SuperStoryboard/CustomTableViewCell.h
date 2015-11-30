//
//  CustomTableViewCell.h
//  SuperStoryboard
//
//  Created by 林东杰 on 11/30/15.
//  Copyright © 2015 Anta. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^handleGestureEndedBlock)(BOOL isDelete, NSIndexPath *index);

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *shadowView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic, strong) NSIndexPath *cellIndex;
@property (nonatomic, copy) handleGestureEndedBlock cellBlock;

@end
