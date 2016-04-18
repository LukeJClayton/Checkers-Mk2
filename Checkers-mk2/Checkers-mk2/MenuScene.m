//
//  MenuScene.m
//  Checkers-mk2
//
//  Created by LukeClayton on 30/03/2016.
//  Copyright © 2016 LukeClayton. All rights reserved.
//

#import "MenuScene.h"
#import "GameScene.h"
#import "RulesScreen.h"

@interface MenuScene()

@property BOOL contentCreated;

@end

@implementation MenuScene

-(void)didMoveToView:(SKView *)view
{
    if (!self.contentCreated)
    {
        [self createSceneContents]; //Separate method so it can be called again later
        self.contentCreated = YES;
    }
}

-(void)createSceneContents
{
    //Background
    SKSpriteNode *backgroundImage = [SKSpriteNode spriteNodeWithImageNamed:@"Menu Background"];
    backgroundImage.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)); //Centers the sprite
    backgroundImage.size = self.frame.size;
    [self addChild:backgroundImage];
    self.scaleMode = SKSceneScaleModeAspectFit;
    
    //Title
    SKSpriteNode *titleImage = [SKSpriteNode spriteNodeWithImageNamed:@"TitleImage"];
    titleImage.position = CGPointMake(CGRectGetMidX(self.frame),1500);
    titleImage.zPosition = 2;
    titleImage.xScale = 1.2;
    titleImage.yScale = 1.2;
    [self addChild:titleImage];
    self.scaleMode = SKSceneScaleModeAspectFit;
    
    [self addChild:[self StartButtonNode]];
    [self addChild:[self RulesButtonNode]];
    [self addChild:[self QuitButtonNode]];
}

-(SKSpriteNode *)StartButtonNode
{
    //Start Button
    SKSpriteNode *startButton = [SKSpriteNode spriteNodeWithImageNamed:@"StartGameButton"];
    startButton.position = CGPointMake(CGRectGetMidX(self.frame)+1,950);
    startButton.zPosition = 2;
    startButton.xScale = 1.2;
    startButton.yScale = 1.2;
    startButton.name = @"StartButtonNode";
    self.scaleMode = SKSceneScaleModeAspectFit;
    return startButton;
}

-(SKSpriteNode *)RulesButtonNode
{
    //How to play button
    SKSpriteNode *rulesButton = [SKSpriteNode spriteNodeWithImageNamed:@"RulesButton"];
    rulesButton.position = CGPointMake(CGRectGetMidX(self.frame)-2, 700);
    rulesButton.zPosition = 2;
    rulesButton.xScale = 1.2;
    rulesButton.yScale = 1.2;
    rulesButton.name = @"RulesButtonNode";
    self.scaleMode = SKSceneScaleModeAspectFit;
    return rulesButton;
}

-(SKSpriteNode *)QuitButtonNode
{
    //Quit Button
    SKSpriteNode *quitButton = [SKSpriteNode spriteNodeWithImageNamed:@"QuitButton"];
    quitButton.position = CGPointMake(CGRectGetMidX(self.frame), 420);
    quitButton.zPosition = 2;
    quitButton.xScale = 1.2;
    quitButton.yScale = 1.2;
    quitButton.name = @"QuitButtonNode";
    self.scaleMode = SKSceneScaleModeAspectFit;
    return quitButton;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"StartButtonNode"])
    {
        SKScene *gameScene  = [[GameScene alloc] initWithSize:self.size];
        SKTransition *fade = [SKTransition fadeWithDuration:0.5];
        [self.view presentScene:gameScene transition:fade];
    }
    if ([node.name isEqualToString:@"RulesButtonNode"])
    {
        SKScene *rulesScreen  = [[RulesScreen alloc] initWithSize:self.size];
        SKTransition *fade = [SKTransition fadeWithDuration:0.5];
        [self.view presentScene:rulesScreen transition:fade];
    }
    if ([node.name isEqualToString:@"QuitButtonNode"])
    {
        exit(0);
    }
}

@end