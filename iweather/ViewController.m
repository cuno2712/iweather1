//
//  ViewController.m
//  iWeather
//
//  Created by Hoang Van Nhat Tan on 1/16/16.
//  Copyright © 2016 Hoang Van Nhat Tan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *location;

@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weathericon;
@property (weak, nonatomic) IBOutlet UILabel *quote;

@property (weak, nonatomic) IBOutlet UILabel *C;

@end

@implementation ViewController
{
    NSArray* quotes;
    NSArray* locations;
    NSArray* photoFiles;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    quotes = @[@"In music the passions enjoy themselves.",
               @"Bad men are full of repentance.",
               @"Love is friendship set on fire.",
               @"Though lovers be lost love shall not.",
               @"Truth is a tendency."];
    locations = @[@"Hai Ba Trung, Hanoi", @"Sydney, Australia", @"New York, USA"];
    
    photoFiles = @[@"rain", @"sunny", @"thunder", @"windy"];
    
}

- (IBAction)updateWeather:(id)sender {
    int quoteIndex = arc4random_uniform(quotes.count);
//    NSLog(@"%d", quoteIndex);
    self.quote.text = quotes[quoteIndex];
    int locationIndex = arc4random_uniform(locations.count);
    int photoIndex = arc4random_uniform(photoFiles.count);
    self.location.text = locations[locationIndex];
    self.weathericon.image = [UIImage imageNamed:photoFiles[photoIndex]];
    NSString* string = [NSString stringWithFormat:@"%2.1f", [self getTemperature]];
    [self.temperature setTitle:string forState:UIControlStateNormal];
}
- (float) getTemperature
{
//    NSLog(@"%f",14.0 + arc4random_uniform(18) + (float)arc4random() / (float) INT32_MAX );
    return 14.0 + arc4random_uniform(18) + (float)arc4random() / (float) INT32_MAX;
}


- (float) convertCtoF:(float)a flag:(NSString*)type
{
    if([type isEqualToString:(@"C")])
    return a*9/5+32;
    else if([type isEqualToString:(@"F")])
        return  (a-32)/1.8;
    else {
        NSLog(@"Wrong Type");
        return 1;}
    
}



- (IBAction)CtoF:(id)sender {
    if([self.C.text isEqualToString:@"C"])
    {
        
        NSString* string = [NSString stringWithFormat:@"%2.1f", [self convertCtoF:self.temperature.titleLabel.text.floatValue flag:@"C"]] ;
        [self.temperature setTitle:string forState:UIControlStateNormal];
        self.C.text = @"F";
    }
    else
    {
        NSString* string = [NSString stringWithFormat:@"%2.1f", [self convertCtoF:self.temperature.titleLabel.text.floatValue flag:@"F"]];
        [self.temperature setTitle:string forState:UIControlStateNormal];
      
         self.C.text = @"C";
    }
    
}

@end
