//
//  CardMatchingGame.m
//  cardGame
//
//  Created by 李挺 on 14-3-2.
//  Copyright (c) 2014年 李挺. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray *cards;//of Card

@end

@implementation CardMatchingGame

- (NSMutableArray *)cards{
    if (!_cards) _cards=[[NSMutableArray alloc]init];
    return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger)count
                         usingDeck:(Deck *)deck
{
    self=[super init];//super's designated initializer
    if (self) {
        for (int i=0; i<count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }else{
                self=nil;
                break;
            }
        }
    }
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index{
    return (index<[self.cards count])?self.cards[index]:nil;
}
#define MATCH_BONUS 4
static const int MISMATCH_PENALTY = 2;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSInteger)index {
    Card * card=[self cardAtIndex:index];
    if(!card.isMatched){
        if (card.isChosen) {
            card.chosen=NO;
        }else{
            for (Card * otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore=[card match:@[otherCard]];
                    if (matchScore) {
                        card.matched=YES;
                        otherCard.matched=YES;
                        self.score+=matchScore * MATCH_BONUS;
                    }else{
                        otherCard.chosen=NO;
                        self.score-=MISMATCH_PENALTY;
                    }
                    break;
                }
            }
            self.score-=COST_TO_CHOOSE;
            card.chosen=YES;
        }
    }
}

@end
