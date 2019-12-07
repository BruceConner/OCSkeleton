### Modified based on [OCSkeleton](https://github.com/mayqiyue/OCSkeleton)

Add a category of SomoDataSourceProvider for UICollectionView, it is just a simple implementation. You can continue to improve according to your specific needs.

## 👩‍💻UICollectionView Usage

### import the Category header file:  \#import \"SomoDataSourceProvider+TCMCollectionView.h\"

#### Use like this below:

```ObjC
@interface ViewController : UIViewController()

@property (nonatomic, strong) SomoDataSourceProvider *provider;

@end
@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _provider = [SomoDataSourceProvider dataSourceProviderWithCellReuseIdentifier:@"cellIdentifier"];
    _provider.collectionViewItemSizeBlock = ^CGSize(UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
      
        CGFloat itemWidth = 100;
        CGFloat itemHeight = 30;

        return CGSizeMake(itemWidth, itemHeight);
    };
    
    _courseCollectionView.delegate = _provider;
    _courseCollectionView.dataSource = _provider;
}

- (void)queryData{

    [Request getDataSuccess:^(id responseObject){
       
            self.courseCollectionView.delegate = self;
            self.courseCollectionView.dataSource = self;
    }];
}
//...UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout implementations

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [cell endSomo];
}

@end

```
