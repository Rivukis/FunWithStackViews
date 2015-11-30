//
//  DistributionPropertyViewController.h
//  FunWithStackViews
//
//  Created by Brian Radebaugh on 11/25/15.
//  Copyright © 2015 Brian Radebaugh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PropertyViewController : UIViewController

- (instancetype)initWithDistributionOption:(UIStackViewDistribution)distributionOption spacing:(CGFloat)spacing;
- (instancetype)initWithAlignmentOption:(UIStackViewAlignment)alignmentOption spacing:(CGFloat)spacing;

@end
