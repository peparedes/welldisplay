// Program to adjust the color temperature and hue of the screen.

// Copyright 2018 Peter Washington, Pervasive Wellbeing Technology Lab.



#import <Foundation/Foundation.h>
#import "CBBlueLightClient.h"
#import "MacGammaController.h"

#define RATE_OF_CHANGE 0.001

int main(int argc, const char * argv[]) {
    float strength = 0;
    int shouldIncrease = 0;

    
    CBBlueLightClient *client = [[CBBlueLightClient alloc] init];
    
    int time = 0;

    while (TRUE) {
        //NSLog(@"%d",time);
        time++;
        if (time % 10000 >= 0 && time % 10000 < 500) {
            //NSLog(@"ON");
            [MacGammaController setGammaWithRed:0 green:10 blue:0];
        }
        else {
            //NSLog(@"OFF");
            CGDisplayRestoreColorSyncSettings();
        }
    }
    
    /*
    while (TRUE) {
        
        if (strength != 0.0) { [client setStrength:strength commit:true]; }
        [client setEnabled:(strength != 0.0)];
        
        
        if (shouldIncrease) {
            strength += RATE_OF_CHANGE;
        } else {
            strength -= RATE_OF_CHANGE;
        }
        
        if (strength > 0.99) {
            shouldIncrease = 0;
        }
        
        if (strength < 0.01) {
            shouldIncrease = 1;
        }
    } */
    return 0;
}
