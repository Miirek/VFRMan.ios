//
//  AppDelegate.h
//  VFR manual.alt
//
//  Created by Mirek Novak on 24.05.21.
//  Copyright © 2021 Mirek Novak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model/AppModel.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AppModel *app;

@end

