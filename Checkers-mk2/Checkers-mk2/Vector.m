//
//  Vector.m
//  Checkers-mk2
//
//  Created by LukeClayton on 29/03/2016.
//  Copyright © 2016 LukeClayton. All rights reserved.
//

#import "Vector.h"

@interface Vector ()

@end

@implementation Vector

- (id)initWithX:(int)x Y:(int)y
{
    if(self = [super init])
    {
        xposition = x;
        yposition = y;
    }
    
    return self;
}

- (int)getXPosition
{
    return xposition;
}

- (int)getYPosition
{
    return yposition;
}

@end