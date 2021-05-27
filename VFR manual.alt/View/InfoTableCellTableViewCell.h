//
//  InfoTableCellTableViewCell.h
//  VFR manual.alt
//
//  Created by Mirek Novak on 24.05.21.
//  Copyright © 2021 Mirek Novak. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InfoTableCellTableViewCell : UITableViewCell
@property (nonatomic,weak) IBOutlet UILabel *airportName;
@property (nonatomic,weak) IBOutlet UILabel *airportICAO;
@property (nonatomic,weak) IBOutlet UILabel *airportFreq;
@property (nonatomic,weak) IBOutlet UILabel *airportAMSL;
@property (nonatomic,weak) IBOutlet UILabel *airportPatternAlt;
@property (nonatomic,weak) IBOutlet UILabel *airportRwyADir;
@property (nonatomic,weak) IBOutlet UILabel *airportRwyADim;
@property (nonatomic,weak) IBOutlet UILabel *airportRwyBDir;
@property (nonatomic,weak) IBOutlet UILabel *airportRwyBDim;

@end


NS_ASSUME_NONNULL_END
