//
//  MNAirfield.h
//  VFR manual.alt
//
//  Created by Mirek Novak on 28.05.21.
//  Copyright © 2021 Mirek Novak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>

@class MNRunway;

NS_ASSUME_NONNULL_BEGIN

@interface MNAirfield : NSObject

@property (strong) NSString *name;
@property (strong) NSString *icaoCode;
@property (strong) NSString *callSign;

@property (assign) CLLocationCoordinate2D coordinates;

@property (assign) double frequency;
@property (assign) long amsl;
@property (assign) long patternAltitude;

@property (strong) NSArray<MNRunway*> *runways;
@property (strong) NSArray *procedures;

-(instancetype) init;
-(instancetype) initWithData:(NSDictionary *) data;

-(NSDictionary*) dataForTableView;


@end

NS_ASSUME_NONNULL_END
