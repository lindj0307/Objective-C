//
//  CustomTableViewCell.m
//  SuperStoryboard
//
//  Created by 林东杰 on 11/30/15.
//  Copyright © 2015 Anta. All rights reserved.
//

#import "CustomTableViewCell.h"

@interface CustomTableViewCell() {
    UIView *snapView;
}
@end

@implementation CustomTableViewCell

- (void)awakeFromNib {
    _containerView.layer.cornerRadius = 4;
    
    _shadowView.layer.shadowColor = [UIColor blackColor].CGColor;
    _shadowView.layer.shadowOffset = CGSizeMake(2, 2);
    _shadowView.layer.shadowOpacity = 0.5;
    _shadowView.layer.shadowRadius = 5;
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongpressGesture:)];
    
    [self.containerView addGestureRecognizer:longPress];
}

- (void)handleLongpressGesture:(UILongPressGestureRecognizer *)gesture {
    CGPoint startPoint = CGPointZero;
    switch (gesture.state) {
        case UIGestureRecognizerStatePossible: {
            //
            break;
        }
        case UIGestureRecognizerStateBegan: {
            snapView = [_containerView snapshotViewAfterScreenUpdates:NO];
            startPoint = [gesture locationInView:self.contentView];
            
            snapView.frame = _containerView.frame;
            snapView.transform = CGAffineTransformMakeRotation(M_PI/30);
            [self.contentView addSubview:snapView];
            self.containerView.hidden = YES;
            self.shadowView.hidden = YES;
            break;
        }
        case UIGestureRecognizerStateChanged: {
            CGPoint changePoint = [gesture locationInView:self.contentView];
            snapView.center = changePoint;
            break;
        }
        case UIGestureRecognizerStateEnded: {
            NSLog(@"ended");
            
            CGPoint endPoint = [gesture locationInView:self.contentView];
            if (endPoint.x > self.contentView.bounds.size.width -50 ) {
                if (self.cellBlock) {
                    self.cellBlock(YES,_cellIndex);
                }
            } else {
                if (self.cellBlock) {
                    self.cellBlock(NO,_cellIndex);
                }
            }
            [snapView removeFromSuperview];
            self.containerView.hidden = NO;
            self.shadowView.hidden = NO;
            break;
        }
        case UIGestureRecognizerStateCancelled: {
            //
            break;
        }
        case UIGestureRecognizerStateFailed: {
            //
            break;
        }
        default: {
            break;
        }
    }
}

@end
