//
//  ScaryBugData.m
//  ScaryBugs
//
//  Created by 林东杰 on 2/24/16.
//  Copyright © 2016 Joey. All rights reserved.
//

#import "ScaryBugData.h"

@implementation ScaryBugData

@synthesize title = _title;
@synthesize rating = _rating;

- (id)initWithTitle:(NSString *)title rating:(float)rating {
    if ((self = [super init])) {
        self.title = title;
        self.rating = rating;
    }
    return self;
}
@end
