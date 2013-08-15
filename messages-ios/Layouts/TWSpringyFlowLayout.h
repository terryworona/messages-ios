//
//  TWSpringyFlowLayout.h
//  CollectionView
//
//  Created by Terry Worona on 8/15/13.
//  Copyright (c) 2013 Terry Worona. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWSpringyFlowLayout : UICollectionViewFlowLayout

// Higher the number, bigger the bounce.
// 0 = no bounce, 1000 = lots of bounce
- (id)initWithBounceFactor:(CGFloat)bounceFactor;

@end
