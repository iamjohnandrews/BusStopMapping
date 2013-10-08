//
//  ViewController.m
//  BusStopMapping
//
//  Created by John Andrews on 10/8/13.
//  Copyright (c) 2013 John Andrews. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableDictionary* dictionaryFirstJSONLayer;
    NSMutableArray* arraySecondJSONLayer;
    NSMutableDictionary* dictionaryThirdJSONLayer;
    NSMutableDictionary* dictionaryFourthJSONLayer;
    
    NSMutableString* busStopName;
    NSMutableString* busStopLatitude;
    NSMutableString* busStopLongitude;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSURL* url = [NSURL URLWithString:@"http://mobilemakers.co/lib/bus.json"];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         dictionaryFirstJSONLayer = [[NSMutableDictionary alloc] initWithDictionary:[NSJSONSerialization JSONObjectWithData:data options:0 error:&connectionError]];
         
         arraySecondJSONLayer = [[NSMutableArray alloc] initWithArray:[dictionaryFirstJSONLayer objectForKey:@"row"]];
         
         for (dictionaryThirdJSONLayer in arraySecondJSONLayer) {
             busStopName = [dictionaryThirdJSONLayer objectForKey:@"cta_stop_name"];
             
             dictionaryFourthJSONLayer = [[NSMutableDictionary alloc] initWithDictionary:[dictionaryThirdJSONLayer objectForKey:@"location"]];
             busStopLatitude = [dictionaryFourthJSONLayer objectForKey:@"latitude"];
             busStopLongitude = [dictionaryFourthJSONLayer objectForKey:@"longitude"];
             
             //NSLog(@" the different bus top names are %@", busStopName);
             //NSLog(@" the different bus top latitudes are %@", busStopLatitude);
             //NSLog(@" the different bus top longitudes are %@", busStopLongitude);
         }
         
     }];
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    
}



@end
