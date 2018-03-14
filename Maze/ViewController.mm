//
//  ViewController.m
//  Maze
//
//  Created by Matthew Taylor on 2018-02-28.
//  Copyright © 2018 Matthew Taylor. All rights reserved.
//

#import "ViewController.h"
#import "MazeBuilder.h"

@interface ViewController () {
    Renderer *glesRenderer;
    MazeObject *maze;
}

@property (weak, nonatomic) IBOutlet UISwitch *dayToggle;
@property (weak, nonatomic) IBOutlet UISwitch *fogToggle;
@property (weak, nonatomic) IBOutlet UISwitch *lightToggle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    glesRenderer = [[Renderer alloc] init];
    GLKView *view = (GLKView *)self.view;
    [glesRenderer setup:view];
    [glesRenderer loadModels];
    
    UIPanGestureRecognizer * singleDragRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(singleDragResponder:)];
    [singleDragRecognizer setMinimumNumberOfTouches:1];
    [singleDragRecognizer setMaximumNumberOfTouches:1];
    [self.view addGestureRecognizer:singleDragRecognizer];
    
    UITapGestureRecognizer * tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapResponder:)];
    [tapRecognizer setNumberOfTouchesRequired:1];
    [tapRecognizer setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:tapRecognizer];
    
    
    UITapGestureRecognizer * doubleTapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTapResponder:)];
    [doubleTapRecognizer setNumberOfTouchesRequired:2];
    [doubleTapRecognizer setNumberOfTapsRequired:2];
    [self.view addGestureRecognizer:doubleTapRecognizer];
        
    maze = [[MazeObject alloc] init:glesRenderer x:10 y:10];
}

- (void)singleDragResponder: (UIGestureRecognizer *) sender {
    
}

- (void)tapResponder: (UIGestureRecognizer *) sender {
    
}


- (void)doubleTapResponder: (UIGestureRecognizer *) sender {
    
}

- (void)daytimeToggle{
}

- (void)foggyToggle {
    if ([_fogToggle isOn]) {
        
    }
    
}

- (void)flashlightToggle{
    if ([_lightToggle isOn]) {
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)update {
    [glesRenderer update];
    if ([_dayToggle isOn]) {
        [glesRenderer nightDiffuse];
    } else {
        [glesRenderer dayDiffuse];
    }
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
    [glesRenderer draw:rect];
}
@end
