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

    id data;
    NSMutableDictionary *airfields;
}

-(instancetype) init {
    if(self = [super init]){
        data = nil;
        airfields = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

-(instancetype) initWithData:(NSData *)inputData{
    NSError *error;
    
    if(self = [self init]){
        data = [NSJSONSerialization JSONObjectWithData:inputData options:0 error:&error];
        NSLog(@"Parsovaná data: %@", data);
    }
    
    if (error) {
        NSLog(@"Error parsing JSON: %@", error);
  
    }
    
    
    NSLog(@"Parsovaná data #0 : %@", data[0]);
    NSDictionary *airfield = data[0];
    
    NSLog(@"Airfield ICAO - %@ ", [airfield objectForKey:@"icao"]);
    
    return self;
}

-(void)loadData{
    
}

-(MNAirfield * )airfieldForICAOCode: (NSString*) icaoCode{
    MNAirfield* airfield;
    if((airfield = [airfields objectForKey:icaoCode])){
        return airfield;
    }
    return nil;
}
@end
