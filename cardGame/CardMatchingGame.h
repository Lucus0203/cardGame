//
//  CardMatchingGame.h
//  cardGame
//
//  Created by 李挺 on 14-3-2.
//  Copyright (c) 2014年 李挺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
@interface CardMatchingGame : NSObject

- (instancetype) initWithCardCount:(NSUInteger)count
                         usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic,readonly) NSInteger score;

@end
