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

@end

@implementation PropertyViewController

- (instancetype)initWithDistributionOption:(UIStackViewDistribution)distributionOption {
    self = [super init];
    if (self) {
        _distributionOption = distributionOption;
        _alignmentOption = UIStackViewAlignmentFill;
    }
    return self;
}

- (instancetype)initWithAlignmentOption:(UIStackViewAlignment)alignmentOption {
    self = [super init];
    if (self) {
        _distributionOption = UIStackViewDistributionFillEqually;
        _alignmentOption = alignmentOption;
    }
    return self;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.stackView.distribution = self.distributionOption;
    self.stackView.alignment = self.alignmentOption;
}

@end
