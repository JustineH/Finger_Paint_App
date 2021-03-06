//
//  ViewController.m
//  Finger_Paint_App
//
//  Created by Justine Herman on 11/11/16.
//  Copyright © 2016 Justine Herman. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()

@property (nonatomic) NSMutableArray *listOfLines;
@property (nonatomic) UIColor *currentColor;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.listOfLines = [[NSMutableArray alloc] init];
    ((DrawView *)self.view).strokeColor = [UIColor orangeColor];
    self.currentColor = [UIColor blueColor];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)paintColor:(UIButton *)sender
{
    self.currentColor = sender.backgroundColor;
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    
    NSMutableArray *line = [NSMutableArray array];
    [line addObject:[NSValue valueWithCGPoint:touchPoint]];
    
    [self.listOfLines addObject:line];
    [((DrawView *)self.view).arrayOfColours addObject:self.currentColor];
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event

{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    
    NSMutableArray *line = [self.listOfLines lastObject];
    [line addObject:[NSValue valueWithCGPoint:touchPoint]];
    
    ((DrawView *)self.view).listOfLines = self.listOfLines;
    [self.view setNeedsDisplay];

}


-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self touchesMoved:touches withEvent:event];
    
}


- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [self touchesEnded:touches withEvent:event];
    
}

@end
