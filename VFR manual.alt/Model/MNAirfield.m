//
//  MNAirfield.m
//  VFR manual.alt
//
//  Created by Mirek Novak on 28.05.21.
//  Copyright © 2021 Mirek Novak. All rights reserved.
//

#import "MNAirfield.h"
#import "MNRunway.h"

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
        _hidden = NO;
    }
    return self;
}

-(instancetype) initWithData:(NSDictionary *) data{
    
    if(self = [self init]){
        NSLog(@"Data %@", data);
        _name = [data objectForKey:@"name"];
        _icaoCode = [data objectForKey:@"icao"];
        _callSign = [[[[data objectForKey:@"radioService"] objectAtIndex:0] objectForKey:@"callSigns"] objectAtIndex:0];
       
        _frequency = [(NSNumber*)[[[[data objectForKey:@"radioService"] objectAtIndex:0] objectForKey:@"frequencies"] objectAtIndex:0] doubleValue] ;
        _patternAltitude = [(NSNumber *) [[[data objectForKey:@"circuit"] objectForKey:@"elevation"] objectForKey: @"value"] longValue];
        NSArray *rwys = [data objectForKey:@"runways"];
        NSMutableArray<MNRunway*> *runways = [[NSMutableArray alloc] initWithCapacity:[rwys count]];
        
        if([rwys count] > 0){
            for (id rwyDef in rwys) {
                NSString *rwySurface = [rwyDef objectForKey:@"surface"];
                MNRunwaySurface surfaceType = UNDEFINED;
                if([rwySurface isEqualToString:@"CONCRETE"]) { surfaceType = CONCRETE; }
                    else if([rwySurface isEqualToString:@"ASPHALT"]) { surfaceType = ASPHALT; }
                        else if([rwySurface isEqualToString:@"GRASS"]) { surfaceType = GRASS; }
                rwySurface = nil;
                
                long width = [(NSNumber *)[rwyDef objectForKey:@"width"] longValue];
                long length = [(NSNumber *)[rwyDef objectForKey:@"length"] longValue];
                long rwyHdgA = [(NSNumber *)[[[rwyDef objectForKey:@"sections"] objectAtIndex:0] objectForKey:@"heading"] integerValue];
                long rwyHdgB = [(NSNumber *)[[[rwyDef objectForKey:@"sections"] objectAtIndex:1] objectForKey:@"heading"] integerValue];
                
                [runways addObject:[[MNRunway alloc] initWithLength:length width:width headingA:(int)rwyHdgA headingB:(int)rwyHdgB runwaySurface:surfaceType]];
                
            }
            _runways = [runways copy];
        }
    }
    
    return self;
}

-(NSDictionary *) dataForTableView{
    NSMutableDictionary * dataOut = [[NSMutableDictionary alloc] initWithCapacity:10];
    
    
    return dataOut;
}


@end
