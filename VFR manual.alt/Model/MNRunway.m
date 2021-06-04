//
//  MNRunway.m
//  VFR manual.alt
//
//  Created by Mirek Novak on 03.06.21.
//  Copyright © 2021 Mirek Novak. All rights reserved.
//

#import "MNRunway.h"

@implementation MNRunway

-(instancetype) init{
    if(self = [super init]){
        _width = 0;
        _length = 0;
        _headingA = 0;
        _headingB = 0;
        _surface = UNDEFINED;
    }
    return self;
}

-(instancetype)initWithLength:(long)length width:(long)width headingA:(int)hdgA headingB:(int)hdgB runwaySurface:(MNRunwaySurface)surface{
    if(self = [self init]){
        _width = width;
        _length = length;
        _headingA = hdgA;
        _headingB = hdgB;
        _surface = surface;
    }
    return self;
}

-(NSDictionary*)formattedRunway{
    return @{@"dimension":[NSString stringWithFormat:@"%ld x %ld",_width, _length],
             @"heading":[NSString stringWithFormat:@"%.2d - %.2d",_headingA, _headingB]};
}
@end
