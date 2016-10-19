//
//  TopCollectionView.m
//  TopCollectionView
//
//  Created by mac on 16/9/17.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TopCollectionView.h"
#import <Masonry.h>
#import "TopCollectionViewCell.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

static NSString *const reuseID = @"reuseID";
@interface TopCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>
/** 查看全部按钮 */
@property (weak, nonatomic) UIButton *checkAllButton;
/**
 *  内容collectionView
 */
@property (weak, nonatomic) UICollectionView *collectionView;
/** 记录上一个图片 */
@property (weak, nonatomic) UIImageView *previousImageView;
@end

@implementation TopCollectionView

+ (instancetype)topCollectionView {

    return [[self alloc] init];
}

- (instancetype)init {

    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *titleLabel = [[UILabel alloc] init];
        [self addSubview:titleLabel];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self).offset(10);
            make.height.equalTo(@25);
        }];
        titleLabel.text = @"专题";
        [titleLabel setTintColor:[UIColor blackColor]];
        titleLabel.font = [UIFont systemFontOfSize:15.0];
        
        UIButton *checkAllButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [checkAllButton setTitle:@"查看全部" forState:UIControlStateNormal];
        [checkAllButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [checkAllButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [checkAllButton addTarget:self action:@selector(checkAllButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        checkAllButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [self addSubview:checkAllButton];
        [checkAllButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-10);
            make.centerY.equalTo(titleLabel);
            make.bottom.equalTo(titleLabel.mas_bottom);
        }];
        
        self.checkAllButton = checkAllButton;
        
        [self setupCollectionView];
    }
    
    return self;
}
- (void)setupCollectionView {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = CGSizeMake(100, 100);
    flowLayout.minimumInteritemSpacing = 10;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 35, ScreenW, 110) collectionViewLayout:flowLayout];
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.bounces = NO;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    [self addSubview:collectionView];
    self.collectionView = collectionView;

    [collectionView registerClass:[TopCollectionViewCell class] forCellWithReuseIdentifier:reuseID];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor redColor];
    cell.imageName = @"znb";
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"%@",indexPath);
}
- (void)checkAllButtonClicked {

}

@end
