//
//  Vector.h
//  Checkers-mk2
//
//  Created by LukeClayton on 29/03/2016.
//  Copyright © 2016 LukeClayton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vector : NSObject
{
    int xposition, yposition;
}

- (id)initWithX:(int)x Y:(int)y;
- (int)getXPosition;
- (int)getYPosition;
@end
