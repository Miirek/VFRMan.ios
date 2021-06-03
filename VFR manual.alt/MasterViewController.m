//
//  MasterViewController.m
//  VFR manual.alt
//
//  Created by Mirek Novak on 24.05.21.
//  Copyright © 2021 Mirek Novak. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "View/InfoTableCellTableViewCell.h"

#import "AppDelegate.h"
#import "Model/AppModel.h"

#import "Model/MNAirfield.h"
#import "Model/MNRunway.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.app = [(AppDelegate*)[[UIApplication sharedApplication] delegate] app];
    self.objects = [[_app unsortedAirfields] copy];
    
    NSLog(@"tabulka %@",self.objects);
    
    [[self tableView]reloadData];

    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
}


- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}


- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InfoTableCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSLog(@"IndexPath: %ld", (long)[indexPath row]);
    
    MNAirfield *af = [[self objects] objectAtIndex:indexPath.row];
    
    cell.airportName.text = [NSString stringWithFormat:@"%@ (%@)", af.callSign, af.name];
    cell.airportICAO.text = af.icaoCode;
    cell.airportFreq.text = [[NSNumber numberWithDouble:af.frequency] stringValue];
    cell.airportAMSL.text = [[NSNumber numberWithDouble:af.amsl] stringValue];
    cell.airportPatternAlt.text = [[NSNumber numberWithDouble:af.patternAltitude] stringValue];
    
    cell.airportRwyADir.text = [[[[af runways] objectAtIndex:0] formattedRunway] objectForKey: @"heading"];
    cell.airportRwyADim.text = [[[[af runways] objectAtIndex:0] formattedRunway] objectForKey: @"dimension"];
    if([[af runways] count] > 1){
        cell.airportRwyBDir.text = [[[[af runways] objectAtIndex:1] formattedRunway] objectForKey: @"heading"];;
        cell.airportRwyBDim.text = [[[[af runways] objectAtIndex:1] formattedRunway] objectForKey: @"heading"];;
    }
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


@end
