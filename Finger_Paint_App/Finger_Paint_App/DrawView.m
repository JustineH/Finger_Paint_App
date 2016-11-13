//
//  DrawView.m
//  Finger_Paint_App
//
//  Created by Justine Herman on 11/11/16.
//  Copyright © 2016 Justine Herman. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.listOfLines = [[NSMutableArray alloc] init];
    }
    return self;
}


-(void)drawRect:(CGRect)rect
{
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (NSArray *listOfPoints in self.listOfLines)
    {
        for (int i = 0; i <[listOfPoints count]; i++)
        {
            
            NSValue *pointValue = listOfPoints[i];
            CGPoint point = [pointValue CGPointValue];
            
            if (i == 0)
            {
                [path moveToPoint:point];
            }
            else
            
            {
                [path addLineToPoint:point];
            }

        }
    }

    [self.strokeColor setStroke];
    [path setLineWidth:2.0];
    [path stroke];
}


@end
