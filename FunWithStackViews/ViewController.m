//
//  ViewController.m
//  FunWithStackViews
//
//  Created by Brian Radebaugh on 11/18/15.
//  Copyright © 2015 Brian Radebaugh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *subLabelThree;

@property (assign, nonatomic) BOOL hasLotsOfText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonPressed:(UIButton *)sender {
    if (self.hasLotsOfText) {
        self.subLabelThree.text = @"only four words now";
    } else {
        self.subLabelThree.text = @"many lines many lines many lines many lines many lines many lines many lines many lines many lines many lines many lines many lines";
        
    }
    self.hasLotsOfText = !self.hasLotsOfText;
}

@end
