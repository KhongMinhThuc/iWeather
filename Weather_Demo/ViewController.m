//
//  ViewController.m
//  Weather_Demo
//
//  Created by Khổng Minh Thức on 10/11/16.
//  Copyright © 2016 Khổng Minh Thức. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIImageView *weather;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UIImageView *background;

@property (weak, nonatomic) IBOutlet UIButton *temprature;

@property (weak, nonatomic) IBOutlet UILabel *Clabel;

@property (weak, nonatomic) IBOutlet UILabel *degreeLable;

@property (weak, nonatomic) IBOutlet UILabel *Flable;

@end

@implementation ViewController
{
    NSArray* quotes;
    NSArray* photoFile;
    NSArray* locations;
    NSArray* backgrounds;
    BOOL _isCelciusMode;
    float _temperatureValue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    quotes = @[ @"Đàn ông thông minh thích phụ nữ xinh đẹp và vui tính, đàn ông anh minh thích phụ nữ dễ tính", @"Đàn ông cần có tương lai, còn đàn bà cần có quá khứ", @"Đàn bà khóc bằng mắt, đàn ông khóc bằng tim", @"Đàn ông giữ bí mật của người khác hơn là mình, trái lại đàn bà giữ kín bí mật của mình hơn của người khác." ];
    locations = @[@"Newyork", @"Sydney",@"Hà Nội",@"Hải Phòng"];
    photoFile = @[@"thunder.png",@"sunny.png",@"rain.png",@"windy.png"];
    backgrounds = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"];
    _isCelciusMode= true;
    [self settemp];
    
}
- (IBAction)updateWeather:(id)sender {
    int quoteIndex = arc4random_uniform(quotes.count);
    self.quote.text = quotes[quoteIndex];
    
    int locationIndex = arc4random_uniform(locations.count);
    self.location.text = locations[locationIndex];
    
    int photoFileIndex = arc4random_uniform(photoFile.count);
    self.weather.image = [UIImage imageNamed:photoFile[photoFileIndex]];
    
    int backgrounIndex = arc4random_uniform(backgrounds.count);
    self.background.image = [UIImage imageNamed:backgrounds[backgrounIndex]];
    
    NSString* nhietdo = [NSString stringWithFormat:@"%2.1f",[self getTemperature]];
    [self.temprature setTitle:nhietdo forState:UIControlStateNormal];
    [self temprature];
    
}

- (IBAction)convertTemp1:(id)sender {
    _isCelciusMode =!_isCelciusMode;
    if (_isCelciusMode) {
        self.degreeLable.hidden = false;
        self.Clabel.hidden = false;
        self.Flable.hidden = true;
        _temperatureValue = (_temperatureValue - 32.0) / 1.8;
    } else {
        self.degreeLable.hidden = false;
        self.Clabel.hidden = true;
        self.Flable.hidden = false;
        _temperatureValue = (_temperatureValue + 32.0) / 1.8;
    }
    NSString * string = [NSString stringWithFormat:@"%2.1f",_temperatureValue];
    [self.temprature setTitle:string forState:UIControlStateNormal];
}

-(void) settemp {
    _temperatureValue = [self getTemperature];
    NSString *string = [NSString stringWithFormat:@"%2.1f", _temperatureValue];
    [self.temprature setTitle:string forState:UIControlStateNormal];
}
-(float) getTemperature{
    float temp =  14.0 + arc4random_uniform(18) + (float)arc4random() /(float) INT32_MAX;
    if (_isCelciusMode) {
        return temp;
    } else {
        return (temp + 18) + 32.0;
    }
}


@end
