//
//  MNAirfield.h
//  VFR manual.alt
//
//  Created by Mirek Novak on 28.05.21.
//  Copyright © 2021 Mirek Novak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MNAirfield : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *icaoCode;
@property (nonatomic) NSString *callSign;

@property (nonatomic) CLLocationCoordinate2D coordinates;

@property double frequency;
@property long amsl;
@property long patternAltitude;
@property (nonatomic) NSArray *runways;
@property (nonatomic) NSArray *procedures;

-(instancetype) init;
-(instancetype) initWithData:(NSData *) data;
@end

NS_ASSUME_NONNULL_END
