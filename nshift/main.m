// Program to adjust the color temperature and hue of the screen.

// Copyright 2018 Peter Washington, Pervasive Wellbeing Technology Lab.



#import <Foundation/Foundation.h>
#import "CBBlueLightClient.h"
#import "MacGammaController.h"

#include <mach/mach.h>
#include <mach/mach_time.h>

#define RATE_OF_CHANGE 0.001


static const uint64_t NANOS_PER_USEC = 1000ULL;
static const uint64_t NANOS_PER_MILLISEC = 1000ULL * NANOS_PER_USEC;
static const uint64_t NANOS_PER_SEC = 1000ULL * NANOS_PER_MILLISEC;

static mach_timebase_info_data_t timebase_info;

static uint64_t abs_to_nanos(uint64_t abs) {
    return abs * timebase_info.numer  / timebase_info.denom;
}

static uint64_t nanos_to_abs(uint64_t nanos) {
    return nanos * timebase_info.denom / timebase_info.numer;
}


int main(int argc, const char * argv[]) {
    
    CBBlueLightClient *client = [[CBBlueLightClient alloc] init];
    int time = 0;
    
    // Define time to wait.
    uint64_t time_to_wait_subliminal = 1;
    uint64_t time_to_wait_10 = 10 * NANOS_PER_SEC;

    // Set background screen to green.
    [MacGammaController setGammaWithRed:0 green:10 blue:0];
    
    // Wait until resetting settings.
    mach_timebase_info(&timebase_info);
    uint64_t now = mach_absolute_time();
    mach_wait_until(now + time_to_wait_subliminal);
    
    // Restore color settings.
    CGDisplayRestoreColorSyncSettings();
    
    // Wait for 10 seconds.
    mach_timebase_info(&timebase_info);
    uint64_t now2 = mach_absolute_time();
    mach_wait_until(now2 + time_to_wait_10);
    
    // Set background screen to green.
    [MacGammaController setGammaWithRed:0 green:10 blue:0];
    
    // Wait for 10 seconds.
    mach_timebase_info(&timebase_info);
    uint64_t now3 = mach_absolute_time();
    mach_wait_until(now3 + time_to_wait_10);
    
    // Restore color settings.
    CGDisplayRestoreColorSyncSettings();
    
    
    // SUBLIMINAL INTERVENTION EXAMPLE:::
    
    // Wait for 10 seconds.
    mach_timebase_info(&timebase_info);
    uint64_t now4 = mach_absolute_time();
    mach_wait_until(now4 + time_to_wait_10);
    
    // Set background screen to green.
    [MacGammaController setGammaWithRed:0 green:10 blue:0];
    
    // Super quick waiting.
    mach_timebase_info(&timebase_info);
    uint64_t now5 = mach_absolute_time();
    mach_wait_until(now + time_to_wait_subliminal);

    // Restore color settings.
    CGDisplayRestoreColorSyncSettings();
    
    return 0;
}
