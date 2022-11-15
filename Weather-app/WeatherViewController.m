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
#import "WeatherForecast.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeatherViewController () <UITableViewDelegate,UITableViewDataSource, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *dailyTime;
@property (strong,nonatomic) NSMutableArray *dailyMinTemperature;
@property (strong,nonatomic) NSMutableArray *dailyMaxTemperature;
@property (strong,nonatomic) CLLocationManager* locationManager;
@property(strong,nonatomic,nullable) CLLocation* currentLocation;
@property (weak, nonatomic) IBOutlet UILabel *todaysTemp;
@property(strong,nonatomic) WeatherForecast* modelObj;

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[HourlyTableViewCell nib] forCellReuseIdentifier:HourlyTableViewCell.identifier];
    
    [self.tableView registerNib:[WeatherCell nib] forCellReuseIdentifier:WeatherCell.identifier];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.locationManager = [[CLLocationManager alloc]init];
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
    if(self.dailyTime)
        return self.dailyTime.count;
    else
        return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeatherCell* cell = (WeatherCell*) [tableView dequeueReusableCellWithIdentifier:@"WeatherCell" forIndexPath:indexPath];
    [cell updateUIWith: [self getDayNameFrom: self.dailyTime[indexPath.row]] minTemp:self.dailyMinTemperature[indexPath.row] maxTemp:self.dailyMaxTemperature[indexPath.row]];
    return cell;
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    if(locations.count > 0 && self.currentLocation == nil) {
        self.currentLocation = locations.firstObject;
        [self.locationManager stopUpdatingLocation];
        [self requestWeatherForLocation];
    }
}

-(void) requestWeatherForLocation {
    if(self.currentLocation == nil) {
        return;
    }
    
    double longitude = self.currentLocation.coordinate.longitude;
    double latitude = self.currentLocation.coordinate.latitude;
    
    [ProgressHUD show: @"Loading..."];
    __weak typeof(self) weakSelf = self;
    
    [[Webservice sharedInstance] fetchTodaysWeatherDataWithLatitude:latitude longitude:longitude completionBlock:^(NSDictionary * _Nullable responseDict) {
        [ProgressHUD showSuccess: @"Loaded"];
        if(!responseDict) { return; }
        
        WeatherForecast* modelObj = [[WeatherForecast alloc]initWithDictionary:responseDict];
        weakSelf.dailyTime = modelObj.daily.time;
        weakSelf.dailyMinTemperature = modelObj.daily.temperature_2m_min;
        weakSelf.dailyMaxTemperature = modelObj.daily.temperature_2m_max;
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            weakSelf.todaysTemp.text = [NSString stringWithFormat:@"%@°C",[responseDict[@"current_weather"][@"temperature"] stringValue]];
            [self.tableView reloadData];
        });
    }];
    
    NSLog(@"%f | %f",longitude,latitude);
}

-(NSString*) getDayNameFrom:(NSString*)dateString {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormat dateFromString:dateString];
    if([[NSCalendar currentCalendar] isDateInToday:date]) {
        return @"Today";
    } else {
        [dateFormat setDateFormat:@"EEE"];
        return [dateFormat stringFromDate:date];
    }
}
 
@end


NS_ASSUME_NONNULL_END
