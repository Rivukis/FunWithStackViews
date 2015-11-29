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

@end

@implementation DistributionPropertyViewController

- (instancetype)initWithDistributionOption:(UIStackViewDistribution)distributionOption {
    self = [super init];
    if (self) {
        _distributionOption = distributionOption;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.stackView.distribution = self.distributionOption;
}

@end
