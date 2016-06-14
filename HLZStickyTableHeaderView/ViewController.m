//
//  ViewController.m
//  HLZStickyTableHeaderView
//
//  Created by Hu Lizhen on 6/13/16.
//  Copyright © 2016 hulizhen. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+HLZStickyHeader.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    imageView.image = [UIImage imageNamed:@"TableHeader"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.tableView.stickyHeaderView = imageView;
    self.tableView.stickyHeaderViewHeightMin = 220;
    self.tableView.stickyHeaderViewHeightMax = 320;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

@end
