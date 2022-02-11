//
//  DetailViewController.m
//  VFR manual.alt
//
//  Created by Mirek Novak on 24.05.21.
//  Copyright © 2021 Mirek Novak. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        MKMapCamera *camera = [[MKMapCamera alloc] init];
        [camera setAltitude:1500];
        [_map setCamera:camera];
        self.detailDescriptionLabel.text = [self.detailItem callSign];
        [self.map setCenterCoordinate:[self.detailItem coordinates]];
        NSLog(@"Coordinates: %f:%f",[self.detailItem coordinates].latitude,[self.detailItem coordinates].longitude);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

#pragma mark - Managing the detail item
- (void)setDetailItem:(MNAirfield *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}


@end
