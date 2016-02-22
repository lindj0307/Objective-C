//
//  Person.h
//  PeopleDatabase
//
//  Created by 林东杰 on 2/22/16.
//  Copyright © 2016 Joey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    NSString *firstName;
    NSString *lastName;
    int age;
}

-(void)enterInfo;
-(void)printInfo;
@end
