//
//  SomoDataSourceProvider+TCMCollectionView.m
//  TCM_Product
//
//  Created by Zhang Bruce on 2019/12/7.
//  Copyright © 2019 ShellUni. All rights reserved.
//

#import "SomoDataSourceProvider+TCMCollectionView.h"
#import <objc/runtime.h>

static NSString *TCM_SomoCollectionViewCellBlockKey = @"collectionViewCellBlockKey";
static NSString *TCM_SomoCollectionViewItemSizeBlockKey = @"collectionViewItemSizeBlockKey";

@implementation SomoDataSourceProvider (TCMCollectionView)

- (void)setCollectionViewCellBlock:(SomoCollectionViewCellBlock)collectionViewCellBlock{
    
    objc_setAssociatedObject(self, &TCM_SomoCollectionViewCellBlockKey, collectionViewCellBlock, OBJC_ASSOCIATION_COPY);
}

- (SomoCollectionViewCellBlock)collectionViewCellBlock{
    
    return objc_getAssociatedObject(self, &TCM_SomoCollectionViewCellBlockKey);
}

- (void)setCollectionViewItemSizeBlock:(SomoCollectionViewItemSizeBlock)collectionViewItemSizeBlock{
    
    objc_setAssociatedObject(self, &TCM_SomoCollectionViewItemSizeBlockKey, collectionViewItemSizeBlock, OBJC_ASSOCIATION_COPY);
}

- (SomoCollectionViewItemSizeBlock)collectionViewItemSizeBlock{
    
    return objc_getAssociatedObject(self, &TCM_SomoCollectionViewItemSizeBlockKey);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.collectionViewItemSizeBlock(collectionView, indexPath);
}

//- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    return self.collectionViewCellBlock(collectionView, indexPath);
//}

@end
