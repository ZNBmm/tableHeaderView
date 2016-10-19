//
//  TopCollectionViewCell.m
//  TopCollectionView
//
//  Created by mac on 16/9/17.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TopCollectionViewCell.h"

@interface TopCollectionViewCell()

@property (weak, nonatomic) UIImageView *imageView;
@end
@implementation TopCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.imageView = imageView;
        self.layer.cornerRadius = self.frame.size.width * 0.5;
        self.layer.masksToBounds = YES;
        [self addSubview:imageView];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
}

- (void)setImageName:(NSString *)imageName
{
    _imageName = [imageName copy];
    
    self.imageView.image = [UIImage imageNamed:imageName];
}

@end
