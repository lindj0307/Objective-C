//
//  ScaryBugDoc.h
//  ScaryBugs
//
//  Created by 林东杰 on 2/24/16.
//  Copyright © 2016 Joey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIImage.h"

@class ScaryBugData;

@interface ScaryBugDoc : NSObject
@property (strong)ScaryBugData *data;
@property (nonatomic)UIImage *thumbImage;
@property (nonatomic)UIImage *fullIage;

- (id)initWithTitle:(NSString *)title rating:(float)rating thumbImage:(UIImage *)thumbImage fullImage:(UIImage *)fullImage;

@end
