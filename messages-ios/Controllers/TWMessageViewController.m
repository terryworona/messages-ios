//
//  TWMessageViewController.m
//  messages-ios
//
//  Created by Terry Worona on 8/15/13.
//  Copyright (c) 2013 Terry Worona. All rights reserved.
//

#import "TWMessageViewController.h"

@interface TWMessageViewController ()

@end

@implementation TWMessageViewController

#pragma mark - Alloc/Init

- (id)init
{
	self = [super init];
	if (self)
	{
		
	}
	return self;
}

#pragma mark - View Lifecycle

- (void)loadView
{
	[super loadView];
	self.view.backgroundColor = [UIColor redColor];
}

@end
