//
//  AppModel.h
//  VFR manual.alt
//
//  Created by Mirek Novak on 28.05.21.
//  Copyright © 2021 Mirek Novak. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppModel : NSObject
@property (assign) BOOL usingFeets;
-(instancetype) init;
-(instancetype) initWithData: (NSData*) inputData;

-(void) loadData;
-(NSArray *) unsortedAirfields;
-(NSArray *) airfieldsWithICAO:(NSString *) icaoCode;
@end

NS_ASSUME_NONNULL_END
