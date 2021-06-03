//
//  MasterViewController.h
//  VFR manual.alt
//
//  Created by Mirek Novak on 24.05.21.
//  Copyright © 2021 Mirek Novak. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;
@class AppModel;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (weak) AppModel *app;


@end

