//
//  Card.h
//  cardGame
//
//  Created by 李挺 on 14-2-15.
//  Copyright (c) 2014年 李挺. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong,nonatomic) NSString *contents;

@property (nonatomic,getter = isChosen) BOOL chosen;
@property (nonatomic,getter = isMatched) BOOL matched;
-(int) match:(NSArray *)otherCards;

@end
