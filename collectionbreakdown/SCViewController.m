#import <QuartzCore/QuartzCore.h>
#import "SCViewController.h"

@interface SCViewController () {
    UICollectionView *collection;
}

@end

@implementation SCViewController

- (void) loadView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(256,249);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    
    collection = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    [collection registerClass:[SCCellView class] forCellWithReuseIdentifier:@"cell"];
    collection.dataSource = self;
    collection.pagingEnabled = YES;
    [self setView:collection];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 200000;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SCCellView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.layer.borderWidth = 1;
    cell.layer.borderColor = [UIColor blackColor].CGColor;
    cell.backgroundColor = [UIColor lightGrayColor];
    return cell;
}

- (BOOL) canBecomeFirstResponder {
    return YES;
}
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake) {
        [collection scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:196608 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    }
}
@end

@implementation SCCellView

- (void) applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    self.text = [NSString stringWithFormat:@"%d", layoutAttributes.indexPath.item];
}

- (void) drawRect:(CGRect)rect {
    [_text drawInRect:rect withFont:[UIFont systemFontOfSize:15]];
}

- (void) setText:(NSString *)text {
    _text = text;
    [self setNeedsDisplay];
}

@end