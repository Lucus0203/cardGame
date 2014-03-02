//
//  ViewController.m
//  cardGame
//
//  Created by 李挺 on 14-2-15.
//  Copyright (c) 2014年 李挺. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()

@property (nonatomic) int flipCount;
@property (strong,nonatomic) Deck *deck;
@property (strong,nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation ViewController

- (CardMatchingGame *)game{
    if (!_game) {
        _game=[[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    }
    return _game;
}

- (Deck *) deck{
    if(!_deck) _deck=[self createDeck];
    return _deck;
}

- (Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    int cardChosenIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardChosenIndex];
    [self updateUI];
}

- (void)updateUI{
    for (UIButton * cardButton in self.cardButtons) {
        int cardAtIndex=[self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardAtIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self imageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled=!card.isMatched;
        NSLog(self.game.score);
        self.scoreLabel.text=[NSString stringWithFormat:@"Score:%d",self.game.score];
    }
}

- (NSString *)titleForCard:(Card *)card{
    return card.isChosen?card.contents:@"";
}
- (UIImage *)imageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen?@"cardfront":@"cardback"];
}

@end
