//
//  main.m
//  PeopleDatabase
//
//  Created by 林东杰 on 2/22/16.
//  Copyright © 2016 Joey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
        int x = 10;
        NSString *myString = [NSString stringWithFormat:@"The variable x stores the number %i",x];
        //NSString *helloString = @"Hello Variable!";
        NSLog(@"%@",myString);
        
        NSLog(@"please enter a word.");
        //1
        char cstring [40];
        //2
        scanf("%s",cstring);
        //3
        NSString *inputString = [NSString stringWithCString:cstring encoding:1];
        
        NSLog(@"You entered the word '%@'",inputString);
        NSLog(@"You entred the word'%@' and it is %li characters long!",inputString,[inputString length]);
        */
        
        char response;
        NSMutableArray *people = [[NSMutableArray alloc] init];
        
        do {
            Person *newPerson = [[Person alloc] init];
            [newPerson enterInfo];
            [people addObject:newPerson];
            [newPerson printInfo];
            
            NSLog(@"Do you want to enter another name?(y/n)");
            scanf("\n%c",&response);
        } while ( response =='y');
        
        for (Person *onePerson in people) {
            [onePerson printInfo];
        }
    }
    return 0;
}
