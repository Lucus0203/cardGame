//
//  Card.m
//  cardGame
//
//  Created by 李挺 on 14-2-15.
//  Copyright (c) 2014年 李挺. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

- (int)match:(NSArray *)otherCards{
    int score = 0;
    for (Card *card in otherCards) {
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    return score;
}

@end
