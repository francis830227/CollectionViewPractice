//
//  SpotCollectionViewCell.h
//  DigitalDriftPractice
//
//  Created by Francis Tseng on 2017/10/3.
//  Copyright © 2017年 Francis Tseng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpotCollectionViewCell : UICollectionViewCell
    
    @property (weak, nonatomic) IBOutlet UILabel *spotNameLabel;
    @property (weak, nonatomic) IBOutlet UILabel *spotParkNameLabel;
    @property (weak, nonatomic) IBOutlet UILabel *spotIntroductionLabel;
    @property (weak, nonatomic) IBOutlet UIImageView *spotImageView;
    
@end
