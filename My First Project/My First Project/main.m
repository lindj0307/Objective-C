//
//  main.m
//  My First Project
//
//  Created by 林东杰 on 2/19/16.
//  Copyright © 2016 Joey. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
        int a[4],b[4];
        for (int i=0; i < 4; i++) {
            a[i] = arc4random()%10+1;
        }
        
        for(int j=0 ;j<4;j++)
            printf(a[j]);
        */
        int answer = 0;
        int guess = 0;
        int turn = 0;
        
        answer = arc4random()%100 +1;
        
        while (guess !=answer) {
            turn++;
            
            NSLog(@"Guess #%i:Enter a number between 1 and 100",turn);
            scanf("%i",&guess);
            
            if (guess>answer) {
                NSLog(@"Lower!");
            } else if (guess<answer) {
                NSLog(@"Heighter!");
            } else {
                NSLog(@"Correct! The answer was %i!",answer);
            }
        }//end of while loop
        NSLog(@"It took you %i tries!",turn);
        
    }
    return 0;
}



