//
//  AppModel.m
//  VFR manual.alt
//
//  Created by Mirek Novak on 28.05.21.
//  Copyright © 2021 Mirek Novak. All rights reserved.
//

#import "AppModel.h"
#import "MNAirfield.h"

@implementation AppModel{

    NSArray* data;
    NSMutableDictionary *airfields;
}

-(instancetype) init {
    if(self = [super init]){
        data = nil;
        airfields = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

-(instancetype) initWithData:(NSArray *)inputData{
    
    if(self = [self init]){
        data = inputData;
    }
    return self;
}

-(void)loadData{
    for (NSDictionary* airfieldData in data) {
        NSLog(@"loading %@",[airfieldData objectForKey:@"icao"]);
        [airfields setObject:
         [[MNAirfield alloc] initWithData:airfieldData andDelegate: self]
                      forKey:[airfieldData objectForKey:@"icao"]];
    }
    // data = nil;
}

-(MNAirfield * )airfieldForICAOCode: (NSString*) icaoCode{
    MNAirfield* airfield;
    if((airfield = [airfields objectForKey:icaoCode])){
        return airfield;
    }
    return nil;
}

-(NSArray *) unsortedAirfields{
    return [airfields allValues];
}

-(NSArray *) airfieldsWithICAO:(NSString *) icaoCode{
    NSMutableArray *output = [[NSMutableArray alloc] initWithCapacity:50];
    for (MNAirfield* airfield in [airfields allValues]) {
        if([[airfield icaoCode] rangeOfString:icaoCode options:NSRegularExpressionSearch|NSCaseInsensitiveSearch ].location == 0){
            
            [output addObject:airfield];
        }
    }
    return [output copy];
}

@end
