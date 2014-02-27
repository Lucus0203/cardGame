//
//  PlayingCardDeck.m
//  cardGame
//
//  Created by 李挺 on 14-2-16.
//  Copyright (c) 2014年 李挺. All rights reserved.
//
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype) init{
    self = [super init];
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank=1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card=[[PlayingCard alloc]init];
                card.suit=suit;
                card.rank=rank;
                [self addCard:card];
            }
        }
    }
    return self;
}

@end
