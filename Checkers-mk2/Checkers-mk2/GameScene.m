//
//  GameScene.m
//  Checkers-mk2
//
//  Created by LukeClayton on 21/03/2016.
//  Copyright (c) 2016 LukeClayton. All rights reserved.
//

#import "GameScene.h"
#import "CheckerPiece.h"
#import "Vector.h"
#import "GameOverScene.h"

@interface GameScene()
{
    //Image View Array Declaration
    SKSpriteNode *gridCell[65];
    int piecePosition[8][8]; //0 empty, 1 white, 2 black
    
    CheckerPiece *whitePieces[12], *blackPieces[12], *touchedPiece; //Piece objects declared
    
    NSMutableArray *pieceContainer;
    
    Vector *vectors[4]; //4 possible places a piece can move to
}

@property BOOL contentCreated;

@end

int cellWidth; //Gap between checkers
int cellHeight;
int squares = 64; //Amount of squares on board
int leftX; //Left border of board
int topY; //Top border of board

@implementation GameScene

-(void)didMoveToView:(SKView *)view
{
    if (!self.contentCreated)
    {
        [self createSceneContents]; //Separate method so it can be called again later
        self.contentCreated = YES;
    }
}
#pragma mark - Scene Contents
-(void)createSceneContents
{
    /* Setup your scene here */
    pieceContainer = [[NSMutableArray alloc] init]; //Initialise array
    
    [self setAnchorPoint:(CGPointMake(0.5, 0.5))]; //Sets anchor point to center
#pragma mark Background Setup
    //Background
    SKSpriteNode *backgroundImage = [SKSpriteNode spriteNodeWithImageNamed:@"CheckersBackground"];
    backgroundImage.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)); //Centers the sprite
    backgroundImage.size = self.frame.size;
    [self addChild:backgroundImage];
    self.scaleMode = SKSceneScaleModeAspectFit;
    
#pragma mark Variable declaration and defintion
    int index;
    int row, column;
    row = 0;
    column = 0;
    int firstColour = 0;
    
    //Define variables from header
    cellWidth = 115;
    cellHeight = cellWidth;
    topY = 380-4*cellHeight;
    leftX = 207-4*cellWidth;
    
#pragma mark Grid Creation and Initialisation
    for(int index = 0;index < 8;index++)
    {
        for(int jndex = 0; jndex < 8;jndex++)
        {
            piecePosition[index][jndex] = 0; //Define whole array
        }
    }
    
    for(int index = 0;index < 12;index++)
    {
        whitePieces[index] = [[CheckerPiece alloc] initWithColour:true]; //True means white
        blackPieces[index] = [[CheckerPiece alloc] initWithColour:false]; //False means black
    }
    
    for(index=1;index<=64;index++)
    {
        if(firstColour == 0) //Assigns the first colour for the first square of the board and continues in an alternating pattern
        {
            gridCell[index] = [SKSpriteNode spriteNodeWithImageNamed:@"WhiteSquare"];
        }
        else
        {
            gridCell[index] = [SKSpriteNode spriteNodeWithImageNamed:@"BlackSquare"];
        }
        
        //Assigns a position value to the gridCell array for each space within this array
        gridCell[index].position = CGPointMake((leftX + cellWidth * column)-(cellWidth*1.26), (topY + cellHeight * row)-(cellHeight*3));
        gridCell[index].zPosition = 1;
        gridCell[index].size = CGSizeMake(115, 115);
        //Gives a few values that every instance of one of the board square node shares
        
        switch(index)
        {
            //Individual initialisation and declaration of the default pieces for their default positions
#pragma mark White Piece Declaration
            case 2:
                piecePosition[1][0] = 1;
                [whitePieces[0] setPositionX:1 Y:0];
                whitePieces[0].position = gridCell[index].position;
                whitePieces[0].zPosition = 2;
                [self addChild:whitePieces[0]];
                break;
                
            case 4:
                piecePosition[3][0] = 1;
                [whitePieces[1] setPositionX:3 Y:0];
                whitePieces[1].position = gridCell[index].position;
                whitePieces[1].zPosition = 2;
                [self addChild:whitePieces[1]];
                break;
                
            case 6:
                piecePosition[5][0] = 1;
                [whitePieces[2] setPositionX:5 Y:0];
                whitePieces[2].position = gridCell[index].position;
                whitePieces[2].zPosition = 2;
                [self addChild:whitePieces[2]];
                break;
                
            case 8:
                piecePosition[7][0] = 1;
                [whitePieces[3] setPositionX:7 Y:0];
                whitePieces[3].position = gridCell[index].position;
                whitePieces[3].zPosition = 2;
                [self addChild:whitePieces[3]];
                break;
                
            case 9:
                piecePosition[0][1] = 1;
                [whitePieces[4] setPositionX:0 Y:1];
                whitePieces[4].position = gridCell[index].position;
                whitePieces[4].zPosition = 2;
                [self addChild:whitePieces[4]];
                break;
                
            case 11:
                piecePosition[2][1] = 1;
                [whitePieces[5] setPositionX:2 Y:1];
                whitePieces[5].position = gridCell[index].position;
                whitePieces[5].zPosition = 2;
                [self addChild:whitePieces[5]];
                break;
                
            case 13:
                piecePosition[4][1] = 1;
                [whitePieces[6] setPositionX:4 Y:1];
                whitePieces[6].position = gridCell[index].position;
                whitePieces[6].zPosition = 2;
                [self addChild:whitePieces[6]];
                break;
                
            case 15:
                piecePosition[6][1] = 1;
                [whitePieces[7] setPositionX:6 Y:1];
                whitePieces[7].position = gridCell[index].position;
                whitePieces[7].zPosition = 2;
                [self addChild:whitePieces[7]];
                break;
                
            case 18:
                piecePosition[1][2] = 1;
                [whitePieces[8] setPositionX:1 Y:2];
                whitePieces[8].position = gridCell[index].position;
                whitePieces[8].zPosition = 2;
                [self addChild:whitePieces[8]];
                break;
                
            case 20:
                piecePosition[3][2] = 1;
                [whitePieces[9] setPositionX:3 Y:2];
                whitePieces[9].position = gridCell[index].position;
                whitePieces[9].zPosition = 2;
                [self addChild:whitePieces[9]];
                break;
                
            case 22:
                piecePosition[5][2] = 1;
                [whitePieces[10] setPositionX:5 Y:2];
                whitePieces[10].position = gridCell[index].position;
                whitePieces[10].zPosition = 2;
                [self addChild:whitePieces[10]];
                break;
                
            case 24:
                piecePosition[7][2] = 1;
                [whitePieces[11] setPositionX:7 Y:2];
                whitePieces[11].position = gridCell[index].position;
                whitePieces[11].zPosition = 2;
                [self addChild:whitePieces[11]];
                break;
                
#pragma mark Black Piece Initialisation
            case 41:
                piecePosition[0][5] = 2;
                [blackPieces[0] setPositionX:0 Y:5];
                blackPieces[0].position = gridCell[index].position;
                blackPieces[0].zPosition = 2;
                [self addChild:blackPieces[0]];
                break;
                
            case 43:
                piecePosition[2][5] = 2;
                [blackPieces[1] setPositionX:2 Y:5];
                blackPieces[1].position = gridCell[index].position;
                blackPieces[1].zPosition = 2;
                [self addChild:blackPieces[1]];
                break;
                
            case 45:
                piecePosition[4][5] = 2;
                [blackPieces[2] setPositionX:4 Y:5];
                blackPieces[2].position = gridCell[index].position;
                blackPieces[2].zPosition = 2;
                [self addChild:blackPieces[2]];
                break;
                
            case 47:
                piecePosition[6][5] = 2;
                [blackPieces[3] setPositionX:6 Y:5];
                blackPieces[3].position = gridCell[index].position;
                blackPieces[3].zPosition = 2;
                [self addChild:blackPieces[3]];
                break;
                
            case 50:
                piecePosition[1][6] = 2;
                [blackPieces[4] setPositionX:1 Y:6];
                blackPieces[4].position = gridCell[index].position;
                blackPieces[4].zPosition = 2;
                [self addChild:blackPieces[4]];
                break;
                
            case 52:
                piecePosition[3][6] = 2;
                [blackPieces[5] setPositionX:3 Y:6];
                blackPieces[5].position = gridCell[index].position;
                blackPieces[5].zPosition = 2;
                [self addChild:blackPieces[5]];
                break;
                
            case 54:
                piecePosition[5][6] = 2;
                [blackPieces[6] setPositionX:5 Y:6];
                blackPieces[6].position = gridCell[index].position;
                blackPieces[6].zPosition = 2;
                [self addChild:blackPieces[6]];
                break;
                
            case 56:
                piecePosition[7][6] = 2;
                [blackPieces[7] setPositionX:7 Y:6];
                blackPieces[7].position = gridCell[index].position;
                blackPieces[7].zPosition = 2;
                [self addChild:blackPieces[7]];
                break;
                
            case 57:
                piecePosition[0][7] = 2;
                [blackPieces[8] setPositionX:0 Y:7];
                blackPieces[8].position = gridCell[index].position;
                blackPieces[8].zPosition = 2;
                [self addChild:blackPieces[8]];
                break;
                
            case 59:
                piecePosition[2][7] = 2;
                [blackPieces[9] setPositionX:2 Y:7];
                blackPieces[9].position = gridCell[index].position;
                blackPieces[9].zPosition = 2;
                [self addChild:blackPieces[9]];
                break;
                
            case 61:
                piecePosition[4][7] = 2;
                [blackPieces[10] setPositionX:4 Y:7];
                blackPieces[10].position = gridCell[index].position;
                blackPieces[10].zPosition = 2;
                [self addChild:blackPieces[10]];
                break;
                
            case 63:
                piecePosition[6][7] = 2;
                [blackPieces[11] setPositionX:6 Y:7];
                blackPieces[11].position = gridCell[index].position;
                blackPieces[11].zPosition = 2;
                [self addChild:blackPieces[11]];
                break;
        }
        
        [self addChild:gridCell[index]];
        
        //Used to alternate the Colours of the game board by toggling the value of the first colour variable when needed
        column = column + 1;
        firstColour = 1 - firstColour;
        if(column > 7)
        {
            row = row + 1;
            firstColour = 1 - firstColour;
            column = 0;
        }
        
        //Pretty self explanitory, enables user interaction for each grid cell
        gridCell[index].userInteractionEnabled = YES;
    }
}
#pragma mark - Touch Method
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /* Called when a touch begins */
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInNode:self];
    
    SKNode *node = [self nodeAtPoint:location];
    
    if(node != nil)
    {
        //Remove all vectors already on screen
        [[self childNodeWithName:@"vector1"] removeFromParent];
        [[self childNodeWithName:@"vector2"] removeFromParent];
        [[self childNodeWithName:@"vector3"] removeFromParent];
        [[self childNodeWithName:@"vector4"] removeFromParent];
        
        //If the node doesn't have a name
        if(node.name == nil)
        {
            int xposition, yposition;
            
            //Converts node to CheckerPiece
            [pieceContainer addObject:node.parent];
            touchedPiece = pieceContainer[0];
            [pieceContainer removeLastObject];
            
            xposition = [touchedPiece getXPosition];
            yposition = [touchedPiece getYPosition];
            
            if((!((xposition - 1) < 0)) && (!((yposition + 1) > 7))) //If the selected square is not out of bounds
            {
                if(piecePosition[xposition - 1][yposition + 1] == 0) //If the top-left square is empty
                {
                    vectors[0] = [[Vector alloc] initWithX:xposition - 1 Y:yposition + 1]; //Initialises the vector with the position of the empty space
                    SKLabelNode *vector = [SKLabelNode labelNodeWithFontNamed:@"Wingdings"];
                    vector.text = @"X";
                    vector.position = CGPointMake(gridCell[1].position.x + (115 * (xposition - 1)), gridCell[1].position.y + (115 * (yposition + 1))); //Sets the graphical position of the vector
                    vector.name = @"vector1";
                    vector.zPosition = 100; //Brings the sprite to the front
                    vector.fontSize = 60;
                    [self addChild:vector];
                }
                else
                {
                    if((piecePosition[xposition - 2][yposition + 2] == 0) && (piecePosition[xposition - 1][yposition + 1] != piecePosition[xposition][yposition])) //If the piece is an enemy piece and the space top-left of that is empty
                    {
                        //Place a vector
                        vectors[0] = [[Vector alloc] initWithX:xposition - 2 Y:yposition + 2];
                        SKLabelNode *vector = [SKLabelNode labelNodeWithFontNamed:@"Wingdings"];
                        vector.text = @"X";
                        vector.position = CGPointMake(gridCell[1].position.x + (115 * (xposition - 2)), gridCell[1].position.y + (115 * (yposition + 2)));
                        vector.name = @"vector1";
                        vector.zPosition = 100;
                        vector.fontSize = 60;
                        [self addChild:vector];
                    }
                }
            }
            if((!((xposition + 1) > 7)) && (!((yposition + 1) > 7)))
            {
                if(piecePosition[xposition + 1][yposition + 1] == 0)
                {
                    vectors[1] = [[Vector alloc] initWithX:xposition + 1 Y:yposition + 1];
                    SKLabelNode *vector = [SKLabelNode labelNodeWithFontNamed:@"Wingdings"];
                    vector.text = @"X";
                    vector.position = CGPointMake(gridCell[1].position.x + (115 * (xposition + 1)), gridCell[1].position.y + (115 * (yposition + 1)));
                    vector.name = @"vector2";
                    vector.zPosition = 100;
                    vector.fontSize = 60;
                    [self addChild:vector];
                }
                else
                {
                    if((piecePosition[xposition + 2][yposition + 2] == 0) && (piecePosition[xposition + 1][yposition + 1] != piecePosition[xposition][yposition]))
                    {
                        vectors[1] = [[Vector alloc] initWithX:xposition + 2 Y:yposition + 2];
                        SKLabelNode *vector = [SKLabelNode labelNodeWithFontNamed:@"Wingdings"];
                        vector.text = @"X";
                        vector.position = CGPointMake(gridCell[1].position.x + (115 * (xposition + 2)), gridCell[1].position.y + (115 * (yposition + 2)));
                        vector.name = @"vector2";
                        vector.zPosition = 100;
                        vector.fontSize = 60;
                        [self addChild:vector];
                    }
                }
            }
            if((!((xposition - 1) < 0)) && (!((yposition - 1) < 0)))
            {
                if(piecePosition[xposition - 1][yposition - 1] == 0)
                {
                    vectors[2] = [[Vector alloc] initWithX:xposition - 1 Y:yposition - 1];
                    SKLabelNode *vector = [SKLabelNode labelNodeWithFontNamed:@"Wingdings"];
                    vector.text = @"X";
                    vector.position = CGPointMake(gridCell[1].position.x + (115 * (xposition - 1)), gridCell[1].position.y + (115 * (yposition - 1)));
                    vector.name = @"vector3";
                    vector.zPosition = 100;
                    vector.fontSize = 60;
                    [self addChild:vector];
                }
                else
                {
                    if((piecePosition[xposition - 2][yposition - 2] == 0) && (piecePosition[xposition - 1][yposition - 1] != piecePosition[xposition][yposition]))
                    {
                        vectors[2] = [[Vector alloc] initWithX:xposition - 2 Y:yposition - 2];
                        SKLabelNode *vector = [SKLabelNode labelNodeWithFontNamed:@"Wingdings"];
                        vector.text = @"X";
                        vector.position = CGPointMake(gridCell[1].position.x + (115 * (xposition - 2)), gridCell[1].position.y + (115 * (yposition - 2)));
                        vector.name = @"vector3";
                        vector.zPosition = 100;
                        vector.fontSize = 60;
                        [self addChild:vector];
                    }
                }
            }
            if((!((xposition + 1) > 7)) && (!((yposition - 1) < 0)))
            {
                if(piecePosition[xposition + 1][yposition - 1] == 0)
                {
                    vectors[3] = [[Vector alloc] initWithX:xposition + 1 Y:yposition - 1];
                    SKLabelNode *vector = [SKLabelNode labelNodeWithFontNamed:@"Wingdings"];
                    vector.text = @"X";
                    vector.position = CGPointMake(gridCell[1].position.x + (115 * (xposition + 1)), gridCell[1].position.y + (115 * (yposition - 1)));
                    vector.name = @"vector4";
                    vector.zPosition = 100;
                    vector.fontSize = 60;
                    [self addChild:vector];
                }
                else
                {
                    if((piecePosition[xposition + 2][yposition - 2] == 0) && (piecePosition[xposition + 1][yposition - 1] != piecePosition[xposition][yposition]))
                    {
                        vectors[3] = [[Vector alloc] initWithX:xposition + 2 Y:yposition - 2];
                        SKLabelNode *vector = [SKLabelNode labelNodeWithFontNamed:@"Wingdings"];
                        vector.text = @"X";
                        vector.position = CGPointMake(gridCell[1].position.x + (115 * (xposition + 2)), gridCell[1].position.y + (115 * (yposition - 2)));
                        vector.name = @"vector4";
                        vector.zPosition = 100;
                        vector.fontSize = 60;
                        [self addChild:vector];
                    }
                }
            }
        }
        else //else a vector was pressed
        {
            //Get the number from the vector's name
            int vectorNumber;
            if(!([node.name rangeOfString:@"1"].location == NSNotFound))
            {
                vectorNumber = 0;
            }
            else if(!([node.name rangeOfString:@"2"].location == NSNotFound))
            {
                vectorNumber = 1;
            }
            else if(!([node.name rangeOfString:@"3"].location == NSNotFound))
            {
                vectorNumber = 2;
            }
            else if(!([node.name rangeOfString:@"4"].location == NSNotFound))
            {
                vectorNumber = 3;
            }
            
            int oldX, oldY;
            oldX = [touchedPiece getXPosition];
            oldY = [touchedPiece getYPosition];
            piecePosition[oldX][oldY] = 0;
            [touchedPiece setPositionX:[vectors[vectorNumber] getXPosition] Y:[vectors[vectorNumber] getYPosition]];
            if([touchedPiece colour])
            {
                piecePosition[[touchedPiece getXPosition]][[touchedPiece getYPosition]] = 1;
            }
            else
            {
                piecePosition[[touchedPiece getXPosition]][[touchedPiece getYPosition]] = 2;
            }
            
            switch(vectorNumber)
            {
                case 0:
                    [[self findPieceX:([touchedPiece getXPosition] + 1) Y:([touchedPiece getYPosition] - 1)] removeFromParent]; //Removes the piece that was passed over
                    NSLog(@"%@", [self findPieceX:([touchedPiece getXPosition] + 1) Y:([touchedPiece getYPosition] - 1)] );
                    piecePosition[[touchedPiece getXPosition] + 1][[touchedPiece getYPosition] - 1] = 0; //Sets the appropriate array index to 0
                    break;
                case 1:
                    [[self findPieceX:([touchedPiece getXPosition] - 1) Y:([touchedPiece getYPosition] - 1)] removeFromParent];
                    NSLog(@"%@", [self findPieceX:([touchedPiece getXPosition] - 1) Y:([touchedPiece getYPosition] - 1)] );
                    piecePosition[[touchedPiece getXPosition] - 1][[touchedPiece getYPosition] - 1] = 0;
                    break;
                case 2:
                    [[self findPieceX:([touchedPiece getXPosition] + 1) Y:([touchedPiece getYPosition] + 1)] removeFromParent];
                    NSLog(@"%@", [self findPieceX:([touchedPiece getXPosition] + 1) Y:([touchedPiece getYPosition] + 1)] );
                    piecePosition[[touchedPiece getXPosition] + 1][[touchedPiece getYPosition] + 1] = 0;
                    break;
                case 3:
                    [[self findPieceX:([touchedPiece getXPosition] - 1) Y:([touchedPiece getYPosition] + 1)] removeFromParent];
                    NSLog(@"%@", [self findPieceX:([touchedPiece getXPosition] - 1) Y:([touchedPiece getYPosition] + 1)] );
                    piecePosition[[touchedPiece getXPosition] - 1][[touchedPiece getYPosition] + 1] = 0;
                    break;
                default:
                    NSLog(@"Error");
                    break;
            }
            [self winCheck];
        }
    }
}

-(void)winCheck
{
    bool whiteOnBoard = false;
    bool blackOnBoard = false;
    for(int index=0;index<7;index++)
    {
        for(int jndex=0;jndex<7;jndex++)
        {
            if(piecePosition[index][jndex] == 1)
            {
                whiteOnBoard = true;
            }
            else if(piecePosition[index][jndex] == 2)
            {
                blackOnBoard = true;
            }
        }
        if(((whiteOnBoard)&&(!blackOnBoard))||((blackOnBoard)&&(!whiteOnBoard)))
        {
            SKScene *gameOverScene  = [[GameOverScene alloc] initWithSize:self.size];
            SKTransition *fade = [SKTransition fadeWithDuration:0.5];
            [self.view presentScene:gameOverScene transition:fade];
        }
    }
}

-(CheckerPiece *)findPieceX:(int)x Y:(int)y
{
    CheckerPiece *foundPiece;
    
    for(int index = 0; index < 12; index++) //Once for each array index
    {
        if(([whitePieces[index] getXPosition] == x) && ([whitePieces[index] getYPosition] == y)) //If the current position matches the desired coordinates
        {
            foundPiece = whitePieces[index]; //Set found piece
            break; //Stop looping
        }
        if (([blackPieces[index] getXPosition] == x) && ([blackPieces[index] getYPosition] == y))
        {
            foundPiece = blackPieces[index];
            break;
        }
    }
    return foundPiece;
}

-(void)update:(CFTimeInterval)currentTime
{
    /* Called before each frame is rendered */
    for(int i = 0;i < 12;i++)
    {
        //Set new position of all white pieces
        double xpos, ypos;
        xpos = gridCell[1].position.x + (115 * [whitePieces[i] getXPosition]);
        ypos = gridCell[1].position.y + (115 * [whitePieces[i] getYPosition]);
        whitePieces[i].position = CGPointMake(xpos, ypos);
        
        //And all black pieces
        xpos = gridCell[1].position.x + (115 * [blackPieces[i] getXPosition]);
        ypos = gridCell[1].position.y + (115 * [blackPieces[i] getYPosition]);
        blackPieces[i].position = CGPointMake(xpos, ypos);
    }
}

@end
