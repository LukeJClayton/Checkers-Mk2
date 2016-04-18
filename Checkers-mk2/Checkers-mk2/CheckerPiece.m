//
//  CheckerPiece.m
//  Checkers-mk2
//
//  Created by LukeClayton on 22/03/2016.
//  Copyright © 2016 LukeClayton. All rights reserved.
//

#import "CheckerPiece.h"

@interface CheckerPiece ()
{
    SKSpriteNode *pieceSprite;
}

@end


@implementation CheckerPiece

-(id)initWithColour:(bool)colour
{
    if(self = [super init])
    {
        _colour = colour;
        
        if(_colour)
        {
            pieceSprite = [SKSpriteNode spriteNodeWithImageNamed:@"WhitePiece"];
        }
        else
        {
            pieceSprite = [SKSpriteNode spriteNodeWithImageNamed:@"BlackPiece"];
        }
        
        [self addChild:pieceSprite];
    }
    return self;
}

-(void)setPositionX:(int)x Y:(int)y
{
    xposition = x;
    yposition = y;
}

-(int)getXPosition
{
    return xposition;
}

-(int)getYPosition
{
    return yposition;
}

@end

