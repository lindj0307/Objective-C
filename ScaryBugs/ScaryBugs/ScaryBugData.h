//
//  ScaryBugData.h
//  ScaryBugs
//
//  Created by 林东杰 on 2/24/16.
//  Copyright © 2016 Joey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScaryBugData : NSObject
@property (strong) NSString *title;
@property (assign) float rating;

- (id)initWithTitle:(NSString *)title rating:(float)rating;

@end
