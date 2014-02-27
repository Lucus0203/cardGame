//
//  PlayingCard.h
//  cardGame
//
//  Created by 李挺 on 14-2-16.
//  Copyright (c) 2014年 李挺. All rights reserved.
//

#import "Card.h"
@interface PlayingCard : Card
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;
+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
