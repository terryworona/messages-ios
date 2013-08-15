//
//  TWSpringyFlowLayout.m
//  CollectionView
//
//  Created by Terry Worona on 8/15/13.
//  Copyright (c) 2013 Terry Worona. All rights reserved.
//

#import "TWSpringyFlowLayout.h"

@implementation TWSpringyFlowLayout{
	UIDynamicAnimator *_dynamicAnimator;
}

- (void)prepareLayout
{
	[super prepareLayout];
	
	if (!_dynamicAnimator)
	{
		_dynamicAnimator = [[UIDynamicAnimator alloc] initWithCollectionViewLayout:self];

		CGSize contentSize = [self collectionViewContentSize];
		NSArray *items = [super layoutAttributesForElementsInRect:CGRectMake(0, 0, contentSize.width, contentSize.height)];
		
		for (UICollectionViewLayoutAttributes *item in items)
		{
			UIAttachmentBehavior *spring = [[UIAttachmentBehavior alloc] initWithItem:item attachedToAnchor:[item center]];
			spring.length = 0;
			spring.damping = 0.5;
			spring.frequency = 0.8;
			[_dynamicAnimator addBehavior:spring];
		}
	}
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
	return [_dynamicAnimator itemsInRect:rect];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
	return [_dynamicAnimator layoutAttributesForCellAtIndexPath:indexPath];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
	UIScrollView *scrollView = self.collectionView;
	CGFloat scrollDelta = newBounds.origin.y - scrollView.bounds.origin.y;
	
	for (UIAttachmentBehavior *spring in _dynamicAnimator.behaviors)
	{
		UICollectionViewLayoutAttributes *item = [spring.items firstObject];
		CGPoint center = item.center;
		center.y += scrollDelta;
		item.center = center;
		
		[_dynamicAnimator updateItemUsingCurrentState:item];
	}
	
	return YES;
}

@end
