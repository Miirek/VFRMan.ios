//
//  MNAirfield.m
//  VFR manual.alt
//
//  Created by Mirek Novak on 28.05.21.
//  Copyright © 2021 Mirek Novak. All rights reserved.
//

#import "MNAirfield.h"

@implementation MNAirfield

-(instancetype) init {
    if(self = [super init]){
        _name = nil;
        _icaoCode = nil;
        _callSign = nil;
        _coordinates = CLLocationCoordinate2DMake(0, 0);
        _frequency = 0;
        _amsl = 0;
        _patternAltitude = 0;
        _runways = nil;
        _procedures = nil;
    }
    return self;
}

-(instancetype) initWithData:(NSDictionary *) data{
    if(self = [self init]){
        _name = nil;
        _icaoCode = nil;
        _callSign = nil;

        
    }
    
    return self;
}

-(NSDictionary *) dataForTableView{
    NSMutableDictionary * dataOut = [[NSMutableDictionary alloc] initWithCapacity:10];
    
    
    return dataOut;
}


@end
