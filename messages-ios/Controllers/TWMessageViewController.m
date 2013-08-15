//
//  TWMessageViewController.m
//  messages-ios
//
//  Created by Terry Worona on 8/15/13.
//  Copyright (c) 2013 Terry Worona. All rights reserved.
//

#import "TWMessageViewController.h"

// Layouts
#import "TWSpringyFlowLayout.h"

// Views
#import "TWMessageViewCell.h"

// Strings
NSString * const kTWMessageViewControllerCellIdentifier = @"kTWMessageViewControllerCellIdentifier";

// Numerics
CGFloat const kTWMessageViewControllerCellPadding = 10;
CGFloat const kTWMessageViewControllerCellHeight = 50;

@interface TWMessageViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation TWMessageViewController

#pragma mark - Alloc/Init

- (id)init
{
	self = [super initWithCollectionViewLayout: [[TWSpringyFlowLayout alloc] init]];
	if (self)
	{
		
	}
	return self;
}

#pragma mark - View Lifecycle

- (void)loadView
{
	[super loadView];
	
	self.navigationItem.title = @"Messages";
	
	// Background
	UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"messages_bg_2.png"]];
	backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.view insertSubview:backgroundImageView belowSubview:self.collectionView];
	
	// Parallax effect
	UIInterpolatingMotionEffect *interpolationHorizontal = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    interpolationHorizontal.minimumRelativeValue = @-20.0;
    interpolationHorizontal.maximumRelativeValue = @20.0;
	
    UIInterpolatingMotionEffect *interpolationVertical = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    interpolationVertical.minimumRelativeValue = @-20.0;
    interpolationVertical.maximumRelativeValue = @20.0;
	
    [backgroundImageView addMotionEffect:interpolationHorizontal];
    [backgroundImageView addMotionEffect:interpolationVertical];

	// Configurte collection view
	self.collectionView.backgroundColor = [UIColor clearColor];
	[self.collectionView registerClass:[TWMessageViewCell class] forCellWithReuseIdentifier:kTWMessageViewControllerCellIdentifier];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

#pragma mark - UICollectionView DataSource & Delegate methods

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TWMessageViewCell *cell = (TWMessageViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kTWMessageViewControllerCellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
	return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.bounds.size.width - (kTWMessageViewControllerCellPadding*2), kTWMessageViewControllerCellHeight);
}

@end
