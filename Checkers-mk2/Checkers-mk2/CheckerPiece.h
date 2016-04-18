//
//  Checker Piece.h
//  Checkers-mk2
//
//  Created by LukeClayton on 22/03/2016.
//  Copyright © 2016 LukeClayton. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface CheckerPiece : SKNode
{
    int xposition, yposition;
}

@property(readonly) bool colour;
-(id)initWithColour:(bool)colour;
-(void)setPositionX:(int)x Y:(int)y;
-(int)getXPosition;
-(int)getYPosition;

@end

