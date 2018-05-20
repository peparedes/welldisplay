// Program to adjust the color temperature and hue of the screen.

// Copyright 2018 Peter Washington, Pervasive Wellbeing Technology Lab.



#import <Foundation/Foundation.h>
#import "CBBlueLightClient.h"
#import "MacGammaController.h"

#define RATE_OF_CHANGE 0.001

@interface SubliminalScheduler : NSObject
- (void)subliminalLoop;
- (void)targetMethod;
@end

@implementation SubliminalScheduler

- (void)subliminalLoop {
    NSLog(@"Hello, World!");
    
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                     selector:@selector(targetMethod)
                                     userInfo:nil
                                     repeats:YES];
}

- (void)targetMethod {
    NSLog(@"Hello, World!");
}

@end



int main(int argc, const char * argv[]) {
    float strength = 0;
    int shouldIncrease = 0;
    
    SubliminalScheduler *subliminalScheduler = [SubliminalScheduler alloc];
    subliminalScheduler.subliminalLoop;

    
    
    CBBlueLightClient *client = [[CBBlueLightClient alloc] init];
    
    int time = 0;

    /*while (TRUE) {
        //NSLog(@"%d",time);
        time++;
        if (time % 2 == 1) {
            //NSLog(@"ON");
            [MacGammaController setGammaWithRed:0 green:10 blue:0];
        }
        else {
            //NSLog(@"OFF");
            CGDisplayRestoreColorSyncSettings();
        }
    }*/
    
    int userInput;
    scanf("%i", &userInput);
    NSLog(@"You typed %i.", userInput);
    
    return 0;
}
