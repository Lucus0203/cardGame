//
//  Deck.h
//  cardGame
//
//  Created by 李挺 on 14-2-16.
//  Copyright (c) 2014年 李挺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

@property (nonatomic) NSUInteger cardCount;
- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
