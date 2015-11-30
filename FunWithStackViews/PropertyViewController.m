//
//  DistributionPropertyViewController.m
//  FunWithStackViews
//
//  Created by Brian Radebaugh on 11/25/15.
//  Copyright © 2015 Brian Radebaugh. All rights reserved.
//

#import "PropertyViewController.h"

@interface PropertyViewController ()

@property (nonatomic, weak) IBOutlet UIStackView *stackView;

@property (nonatomic, assign) UIStackViewDistribution distributionOption;
@property (nonatomic, assign) UIStackViewAlignment alignmentOption;
@property (nonatomic, assign) CGFloat spacing;

@end

@implementation PropertyViewController

- (instancetype)initWithDistributionOption:(UIStackViewDistribution)distributionOption spacing:(CGFloat)spacing {
    self = [super init];
    if (self) {
        _distributionOption = distributionOption;
        _alignmentOption = UIStackViewAlignmentFill;
        _spacing = spacing;
    }
    return self;
}

- (instancetype)initWithAlignmentOption:(UIStackViewAlignment)alignmentOption spacing:(CGFloat)spacing {
    self = [super init];
    if (self) {
        _distributionOption = UIStackViewDistributionFillEqually;
        _alignmentOption = alignmentOption;
        _spacing = spacing;
    }
    return self;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.stackView.distribution = self.distributionOption;
    self.stackView.alignment = self.alignmentOption;
    self.stackView.spacing = self.spacing;
}

@end
