//
//  GameOverScene.m
//  Checkers-mk2
//
//  Created by LukeClayton on 30/03/2016.
//  Copyright © 2016 LukeClayton. All rights reserved.
//

#import "GameOverScene.h"
#import "MenuScene.h"

@interface GameOverScene()

@property BOOL contentCreated;

@end

@implementation GameOverScene

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
    SKSpriteNode *backgroundImage = [SKSpriteNode spriteNodeWithImageNamed:@"CheckersBackground"];
    backgroundImage.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)); //Centers the sprite
    backgroundImage.size = self.frame.size;
    [self addChild:backgroundImage];
    self.scaleMode = SKSceneScaleModeAspectFit;
    
    //Game Over
    SKLabelNode *titleNode = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    titleNode.text = @"Game Over";
    titleNode.fontSize = 100;
    titleNode.position = CGPointMake(CGRectGetMidX(self.frame), 1500);
    titleNode.zPosition = 2;
    [self addChild:titleNode];
    
    [self addChild:[self MenuButtonNode]];
}

-(SKSpriteNode *)MenuButtonNode
{
    //Return to menu
    SKSpriteNode *menuButton = [SKSpriteNode spriteNodeWithImageNamed:@"ReturnButton"];
    menuButton.position = CGPointMake(CGRectGetMidX(self.frame)-2, 500);
    menuButton.zPosition = 2;
    menuButton.xScale = 1.2;
    menuButton.yScale = 1.2;
    menuButton.name = @"MenuButtonNode";
    self.scaleMode = SKSceneScaleModeAspectFit;
    return menuButton;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"MenuButtonNode"])
    {
        SKScene *menuScene  = [[MenuScene alloc] initWithSize:self.size];
        SKTransition *fade = [SKTransition fadeWithDuration:0.5];
        [self.view presentScene:menuScene transition:fade];
    }
}
@end
