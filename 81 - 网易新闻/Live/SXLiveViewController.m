//
//  SXLiveViewController.m
//  81 - 网易新闻
//
//  Created by steven on 27/10/2016.
//  Copyright © 2016 ShangxianDante. All rights reserved.
//

#import "SXLiveViewController.h"
#import "SXLiveCollectionViewCell.h"

@interface SXLiveViewController ()

@property (nonatomic, strong)NSMutableArray<NSDictionary *> *data;

@end

static NSString *kLiveCellIdentifier = @"kLiveCellIdentifier";

@implementation SXLiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Define our layout first
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake((ScreenWidth - 20) / 2, (ScreenWidth - 20) /2 + 50);
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 5;
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
    self.liveCollectionView.collectionViewLayout = layout;
    
    // Register custom cell
    UINib *liveCellNib = [UINib nibWithNibName:@"SXLiveCollectionViewCell" bundle:[NSBundle mainBundle]];
    [self.liveCollectionView registerNib:liveCellNib forCellWithReuseIdentifier:kLiveCellIdentifier];
    
    // Delegate and Datasource
    self.liveCollectionView.delegate = self;
    self.liveCollectionView.dataSource = self;
    
    // Set up fake data
    [self setUpFakeData];
}

#pragma mark - Set up fake data
- (void)setUpFakeData {
    self.data = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 20; i++) {
        int imageIndex = (arc4random() % 6) + 1;
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg", imageIndex];
        NSString *introductoin = @"我市召开第三次新闻工作者会议，本次会议媒体参与程度高，受到广泛关注";
        NSDictionary *dictionary = @{@"imageName": imageName, @"introduction":introductoin};
        [self.data addObject:dictionary];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SXLiveCollectionViewCell *cell = (SXLiveCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kLiveCellIdentifier forIndexPath:indexPath];
    
    NSDictionary *dictionary = (NSDictionary *)[self.data objectAtIndex:[indexPath row]];
    if (dictionary != nil) {
        NSString *imageName = [dictionary objectForKey:@"imageName"];
        NSString *introduction = [dictionary objectForKey:@"introduction"];
        
        [cell.liveImageView setImage:[UIImage imageNamed:imageName]];
        [cell.introduction setText:introduction];
    }
    
    return cell;
}

@end
