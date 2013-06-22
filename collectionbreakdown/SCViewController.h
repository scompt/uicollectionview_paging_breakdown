//
//  SCViewController.h
//  collectionbreakdown
//
//  Created by Edward Dale on 6/21/13.
//  Copyright (c) 2013 scompt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCViewController : UIViewController <UICollectionViewDataSource>

@end

@interface SCCellView : UICollectionViewCell
@property (nonatomic) NSString *text;
@end