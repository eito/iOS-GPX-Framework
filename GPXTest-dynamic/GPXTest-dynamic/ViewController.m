//
//  ViewController.m
//  GPXTest-dynamic
//
//  Created by Eric Ito on 11/2/14.
//  Copyright (c) 2014 Eric Ito. All rights reserved.
//

#import "ViewController.h"

@import gpx;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"metadata" ofType:@"gpx"];
    GPXRoot *root = [GPXParser parseGPXAtPath:path];
    for (GPXLink *link in root.metadata.links) {
        NSLog(@"link: %@", link);
    }
    
    GPXMetadata *meta = [[GPXMetadata alloc] init];
    meta.name = @"MetaName";
    meta.desc = @"Description of Metadata";
    GPXBounds *bounds = [GPXBounds boundsWithMinLatitude:-25.0 minLongitude:-35.0 maxLatitude:25.0 maxLongitude:35.0];
    meta.bounds = bounds;
    meta.keyword = @"keyword";
    root = [[GPXRoot alloc] init];
    root.metadata = meta;
    
    NSLog(@"gpx: %@", [meta gpx]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
