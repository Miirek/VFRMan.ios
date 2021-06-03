//
//  MNRunway.h
//  VFR manual.alt
//
//  Created by Mirek Novak on 03.06.21.
//  Copyright © 2021 Mirek Novak. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

enum MNRunwaySurface {
    UNDEFINED = 0,
    GRASS = 1,
    CONCRETE,
    ASPHALT
};
typedef enum MNRunwaySurface MNRunwaySurface;

@interface MNRunway : NSObject
@property (assign) long width;
@property (assign)long length;
@property (assign)int headingA;
@property (assign)int headingB;
@property (assign) MNRunwaySurface surface;

-(instancetype) init;
-(instancetype) initWithLength: (long)length
                         width: (long)width
                      headingA: (int)hdgA
                      headingB: (int)hdgB
                 runwaySurface: (MNRunwaySurface) surface;
-(NSDictionary*) formattedRunway;
@end

NS_ASSUME_NONNULL_END
