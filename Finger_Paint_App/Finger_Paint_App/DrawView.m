//
//  DrawView.m
//  Finger_Paint_App
//
//  Created by Justine Herman on 11/11/16.
//  Copyright © 2016 Justine Herman. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.listOfLines = [[NSMutableArray alloc] init];
        self.arrayOfColours = [[NSMutableArray alloc] init];
    }
    return self;
}


-(void)drawRect:(CGRect)rect
{
    for (int line = 0; line < [self.listOfLines count]; line++)
    {
        NSArray *listOfPoints = self.listOfLines[line];
        UIBezierPath *path = [[UIBezierPath alloc] init];
        
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
        
        [[self.arrayOfColours objectAtIndex:line] setStroke];
        [path setLineWidth:3.0];
        [path stroke];
        
    }
}


@end
