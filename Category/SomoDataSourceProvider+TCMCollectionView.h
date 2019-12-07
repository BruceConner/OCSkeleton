//
//  SomoDataSourceProvider+TCMCollectionView.h
//  TCM_Product
//
//  Created by Zhang Bruce on 2019/12/7.
//  Copyright © 2019 ShellUni. All rights reserved.
//
#import <UIKit/UIKit.h>

#import <Somo.h>

NS_ASSUME_NONNULL_BEGIN

typedef UICollectionViewCell<SomoSkeletonLayoutProtocol> * _Nonnull (^SomoCollectionViewCellBlock)(UICollectionView *collectionView, NSIndexPath *indexPath);

typedef CGSize (^SomoCollectionViewItemSizeBlock)(UICollectionView *collectionView, NSIndexPath *indexPath);

@interface SomoDataSourceProvider (TCMCollectionView)<UICollectionViewDelegateFlowLayout>

@property (nonatomic, copy) SomoCollectionViewCellBlock collectionViewCellBlock;
@property (nonatomic, copy) SomoCollectionViewItemSizeBlock collectionViewItemSizeBlock;

@end

NS_ASSUME_NONNULL_END
