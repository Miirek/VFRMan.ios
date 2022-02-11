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
@class AppModel;

NS_ASSUME_NONNULL_BEGIN

@interface MNAirfield : NSObject
@property (weak) AppModel *appDelegate;

@property (strong) NSString *name;
@property (strong) NSString *icaoCode;
@property (strong) NSString *callSign;

@property (assign) CLLocationCoordinate2D coordinates;

@property (assign) double frequency;
@property (assign) long altitude;
@property (strong) NSString *altitudeOrigin;

@property (nonatomic,assign) long patternAltitude;
@property (strong) NSString *patternAltOrigin;

@property (strong) NSArray<MNRunway*> *runways;
@property (strong) NSArray *procedures;

@property (assign) bool hidden;

-(instancetype) init;
-(instancetype) initWithData:(NSDictionary *) data andDelegate:(AppModel *) delegate;

-(NSDictionary*) dataForTableView;
-(void) setCoordinatesLat:(NSString*)latitude andLong:(NSString*)longitude;

// comparison
-(NSComparisonResult)compareCallSign:(MNAirfield *)airfield;

@end

NS_ASSUME_NONNULL_END
