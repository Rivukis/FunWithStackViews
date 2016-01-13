//
//  ShowAllDistributionOptionsViewController.m
//  FunWithStackViews
//
//  Created by Brian Radebaugh on 11/25/15.
//  Copyright © 2015 Brian Radebaugh. All rights reserved.
//

#import "ShowPropertyOptionsViewController.h"
#import "PropertyViewController.h"

@interface ShowPropertyOptionsViewController ()

@property (nonatomic, weak) IBOutlet UIStackView *propertiesStackView;
@property (nonatomic, weak) IBOutlet UILabel *greenConstraint;
@property (nonatomic, weak) IBOutlet UILabel *blueConstraint;
@property (nonatomic, weak) IBOutlet UILabel *yellowConstraint;
@property (nonatomic, weak) IBOutlet UILabel *redConstraint;
@property (nonatomic, weak) IBOutlet UILabel *purpleConstraint;
@property (nonatomic, weak) IBOutlet UILabel *greenAmount;
@property (nonatomic, weak) IBOutlet UILabel *blueAmount;
@property (nonatomic, weak) IBOutlet UILabel *yellowAmount;
@property (nonatomic, weak) IBOutlet UILabel *redAmount;
@property (nonatomic, weak) IBOutlet UILabel *purpleAmount;

@property (nonatomic, assign) ShowPropertyOption propertyToShowOption;
@property (nonatomic, assign) CGFloat spacing;

@end

@implementation ShowPropertyOptionsViewController

- (instancetype)initWithPropertyToShowOption:(ShowPropertyOption)propertyToShowOption spacing:(CGFloat)spacing {
    self = [super init];
    if (self) {
        _propertyToShowOption = propertyToShowOption;
        _spacing = spacing;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildViewControllers];
    [self setupTextForLabels];
    
    self.propertiesStackView.layoutMargins = UIEdgeInsetsMake(10.0, 0.0, 10.0, 0.0);
    self.propertiesStackView.layoutMarginsRelativeArrangement = YES;
}

- (void)setupChildViewControllers {
    switch (self.propertyToShowOption) {
        case ShowPropertyOptionDistribution:
            [self setupDistributionOptionChildViewControllers];
            break;
        case ShowPropertyOptionAlignment:
            [self setupAlignmentOptionChildViewControllers];
            break;
    }
}

- (void)setupDistributionOptionChildViewControllers {
    [self addToStachViewChildViewController:[self childViewControllerWithDistributionOption:UIStackViewDistributionFill]];
    [self addToStachViewChildViewController:[self childViewControllerWithDistributionOption:UIStackViewDistributionFillEqually]];
    [self addToStachViewChildViewController:[self childViewControllerWithDistributionOption:UIStackViewDistributionFillProportionally]];
    [self addToStachViewChildViewController:[self childViewControllerWithDistributionOption:UIStackViewDistributionEqualSpacing]];
    [self addToStachViewChildViewController:[self childViewControllerWithDistributionOption:UIStackViewDistributionEqualCentering]];
}

- (void)setupAlignmentOptionChildViewControllers {
    [self addToStachViewChildViewController:[self childViewControllerWithAlignmentOption:UIStackViewAlignmentFill]];
    [self addToStachViewChildViewController:[self childViewControllerWithAlignmentOption:UIStackViewAlignmentTop]];
    [self addToStachViewChildViewController:[self childViewControllerWithAlignmentOption:UIStackViewAlignmentCenter]];
    [self addToStachViewChildViewController:[self childViewControllerWithAlignmentOption:UIStackViewAlignmentBottom]];
    [self addToStachViewChildViewController:[self childViewControllerWithAlignmentOption:UIStackViewAlignmentFirstBaseline]];
    [self addToStachViewChildViewController:[self childViewControllerWithAlignmentOption:UIStackViewAlignmentLastBaseline]];
}

- (PropertyViewController *)childViewControllerWithDistributionOption:(UIStackViewDistribution)option {
    return [[PropertyViewController alloc] initWithDistributionOption:option spacing:self.spacing];
}

- (PropertyViewController *)childViewControllerWithAlignmentOption:(UIStackViewAlignment)option {
    return [[PropertyViewController alloc] initWithAlignmentOption:option spacing:self.spacing];
}

- (void)addToStachViewChildViewController:(UIViewController *)childViewController {
    [self addChildViewController:childViewController];
    [childViewController didMoveToParentViewController:self];
    [self.propertiesStackView addArrangedSubview:childViewController.view];
}

- (void)setupTextForLabels {
    switch (self.propertyToShowOption) {
        case ShowPropertyOptionDistribution:
            self.greenConstraint.text = @"Green Width";
            self.blueConstraint.text = @"Blue Width";
            self.yellowConstraint.text = @"Yello Width";
            self.redConstraint.text = @"Red Width";
            self.purpleConstraint.text = @"Purple Width";
            
            self.greenAmount.text = @"= 50";
            self.blueAmount.text = @"= 100";
            self.yellowAmount.text = @"= 50";
            self.redAmount.text = @"= 25";
            self.purpleAmount.text = @"= 25";
            break;
            
        case ShowPropertyOptionAlignment:
            self.greenConstraint.text = @"Green Height";
            self.blueConstraint.text = @"Blue Height";
            self.yellowConstraint.text = @"Yello Height";
            self.redConstraint.text = @"Red Height";
            self.purpleConstraint.text = @"Purple Height";
            
            self.greenAmount.text = @"= 45";
            self.blueAmount.text = @"= 60";
            self.yellowAmount.text = @"= 45";
            self.redAmount.text = @"= 30";
            self.purpleAmount.text = @"= 15";
            break;
    }
}

@end
