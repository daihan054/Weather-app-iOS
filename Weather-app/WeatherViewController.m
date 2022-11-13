//
//  ViewController.m
//  Weather-app
//
//  Created by Reve on 11/10/22.
//

#import "WeatherViewController.h"
#import "Weather-model.m"
#import "HourlyTableViewCell.h"
#import "WeatherCell.h"
#import <CoreLocation/CoreLocation.h>
#import "Webservice.h"
#import "ProgressHud.h"

@interface WeatherViewController () <UITableViewDelegate,UITableViewDataSource, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *models;
@property (strong,nonatomic) CLLocationManager* locationManager;
@property(strong,nonatomic) CLLocation* _Nullable currentLocation;

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[HourlyTableViewCell nib] forCellReuseIdentifier:HourlyTableViewCell.identifier];
    
    [self.tableView registerNib:[WeatherCell nib] forCellReuseIdentifier:WeatherCell.identifier];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.locationManager = [[CLLocationManager alloc]init];
    
    [ProgressHUD show: @"Loading..."];
    [[Webservice sharedInstance] fetchTodaysWeatherDataWithCompletionHandler:^(NSDictionary * _Nullable responseDict) {
        [ProgressHUD showSuccess];
        if(responseDict) {
            NSLog(@"%@",responseDict[@"main"][@"temp"]);
        }
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self setupLocation];
}

-(void) setupLocation {
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(self.models)
        return self.models.count;
    else
        return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[UITableViewCell alloc]init];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    if(locations && locations.count > 0 && self.currentLocation == nil) {
        self.currentLocation = locations.firstObject;
        [self.locationManager stopUpdatingLocation];
        [self requestWeatherForLocation];
    }
}

-(void) requestWeatherForLocation {
    if(self.currentLocation == nil) {
        return;
    }
    
    CLLocationDegrees longitude = self.currentLocation.coordinate.longitude;
    CLLocationDegrees latitude = self.currentLocation.coordinate.latitude;
    
    NSLog(@"%f | %f",longitude,latitude);
}
 
@end
