//
//  ShowAllDistributionOptionsViewController.h
//  FunWithStackViews
//
//  Created by Brian Radebaugh on 11/25/15.
//  Copyright © 2015 Brian Radebaugh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ShowPropertyOption) {
    ShowPropertyOptionDistribution,
    ShowPropertyOptionAlignment
};

@interface ShowPropertyOptionsViewController : UIViewController

- (instancetype)initWithPropertyToShowOption:(ShowPropertyOption)showPropertyOption spacing:(CGFloat)spacing;

@end
