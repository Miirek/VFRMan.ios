//
//  DetailViewController.h
//  VFR manual.alt
//
//  Created by Mirek Novak on 24.05.21.
//  Copyright © 2021 Mirek Novak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "Model/MNAirfield.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) MNAirfield *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet MKMapView *map;
@end

