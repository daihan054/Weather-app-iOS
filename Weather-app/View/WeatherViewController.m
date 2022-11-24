//
//  ViewController.m
//  Weather-app
//
//  Created by Reve on 11/10/22.
//

#import "WeatherViewController.h"
#import "HourlyCollectionViewCell.h"
#import "WeatherCell.h"
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>
#import "Webservice.h"
#import "ProgressHud.h"
#import "WeatherForecast.h"
#import "UIView+Extension.h"
#import "HourlyCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeatherViewController () <UITableViewDelegate,UITableViewDataSource, CLLocationManagerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *dailyTimeArray;
@property (strong,nonatomic) NSMutableArray *dailyMinTemperatureArray;
@property (strong,nonatomic) NSMutableArray *dailyMaxTemperatureArray;

@property (strong,nonatomic) NSMutableArray *hourlyTimeArray;
@property (strong,nonatomic) NSMutableArray *hourlyTemperatureArray;

@property (strong,nonatomic) CLLocationManager* locationManager;
@property(strong,nonatomic,nullable) CLLocation* currentLocation;
@property (weak, nonatomic) IBOutlet UIView *dailyForecastParentView;

@property (weak, nonatomic) IBOutlet UILabel *todaysTemp;
@property (weak, nonatomic) IBOutlet UIView *hourlyParentVIew;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(strong,nonatomic) Webservice* webservice;

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerNib:[HourlyCollectionViewCell nib] forCellWithReuseIdentifier:[HourlyCollectionViewCell identifier]];
    
    [self.tableView registerNib:[WeatherCell nib] forCellReuseIdentifier:WeatherCell.identifier];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.locationManager = [[CLLocationManager alloc]init];
    self.webservice = [Webservice sharedInstance];
    [self makeViewCornerRounded];
    
}

-(void) makeViewCornerRounded {
    [self.dailyForecastParentView makeRoundedCornerWithRadius: 10.0];
    [self.hourlyParentVIew makeRoundedCornerWithRadius: 10.0];
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

#pragma mark - TableViewDelegates
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dailyTimeArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeatherCell* cell = (WeatherCell*) [tableView dequeueReusableCellWithIdentifier:@"WeatherCell" forIndexPath:indexPath];
    [cell updateUIWith: [self getDayNameFrom: self.dailyTimeArray[indexPath.row]] minTemp:self.dailyMinTemperatureArray[indexPath.row] maxTemp:self.dailyMaxTemperatureArray[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  100;
}

#pragma mark - CollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  self.hourlyTimeArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HourlyCollectionViewCell* cell = (HourlyCollectionViewCell*) [collectionView dequeueReusableCellWithReuseIdentifier:@"HourlyCollectionViewCell" forIndexPath:indexPath];
    
    [cell updateUIWithTimeString:@"1pm" tempString:@"17C"];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 100);
}

#pragma mark - Location delegate

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
    
    [self.webservice fetchTodaysWeatherDataWithLatitude:latitude longitude:longitude completionBlock:^(NSDictionary * _Nullable responseDict) {
        [ProgressHUD showSuccess: @"Loaded"];
        if(!responseDict) { return; }
        
        WeatherForecast* modelObj = [self parseJSONwithDictionary:responseDict];
        weakSelf.dailyTimeArray = modelObj.daily.time;
        weakSelf.dailyMinTemperatureArray = modelObj.daily.temperature_2m_min;
        weakSelf.dailyMaxTemperatureArray = modelObj.daily.temperature_2m_max;
        weakSelf.hourlyTimeArray = modelObj.hourly.time;
        weakSelf.hourlyTemperatureArray = modelObj.hourly.temperature_2m;
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            weakSelf.todaysTemp.text = [NSString stringWithFormat:@"%@°C",modelObj.current_weather.temperature];
            [weakSelf.tableView reloadData];
            [weakSelf.collectionView reloadData];
        });
    }];
    
    NSLog(@"%f | %f",longitude,latitude);
}

-(WeatherForecast*) parseJSONwithDictionary:(NSDictionary*) dictionary {
    
    WeatherForecast* weatherforecast = [[WeatherForecast alloc]init];
    weatherforecast.latitude = dictionary[@"latitude"];
    weatherforecast.longitude = dictionary[@"longitude"];
    weatherforecast.generationtime_ms = dictionary[@"generationtime_ms"];
    weatherforecast.utc_offset_seconds = dictionary[@"utc_offset_seconds"];
    weatherforecast.timezone = dictionary[@"timezone"];
    weatherforecast.timezone_abbreviation = dictionary[@"timezone_abbreviation"];
    weatherforecast.elevation = dictionary[@"elevation"];
    
    CurrentWeatherData* currentWeatherData = [CurrentWeatherData new];
    currentWeatherData.temperature = dictionary[@"current_weather"][@"temperature"];
    currentWeatherData.windspeed = dictionary[@"current_weather"][@"windspeed"];
    currentWeatherData.winddirection = dictionary[@"current_weather"][@"winddirection"];
    currentWeatherData.weathercode = dictionary[@"current_weather"][@"weathercode"];
    currentWeatherData.time = dictionary[@"current_weather"][@"time"];
    
    weatherforecast.current_weather = currentWeatherData;
    
    HourlyUnit* hourlyUnit = [HourlyUnit new];
    hourlyUnit.time = dictionary[@"hourly_units"][@"time"];
    hourlyUnit.temperature_2m = dictionary[@"hourly_units"][@"temperature_2m"];
    
    weatherforecast.hourly_units = hourlyUnit;
    
    HourlyWeatherData* hourlyWeatherData = [HourlyWeatherData new];
    hourlyWeatherData.time = dictionary[@"hourly"][@"time"];
    hourlyWeatherData.temperature_2m = dictionary[@"hourly"][@"temperature_2m"];
    
    weatherforecast.hourly = hourlyWeatherData;
    
    DailyUnit* dailyUnit = [DailyUnit new];
    dailyUnit.time = dictionary[@"daily_units"][@"time"];
    dailyUnit.temperature_2m_min = dictionary[@"daily_units"][@"temperature_2m_min"];
    dailyUnit.temperature_2m_max = dictionary[@"daily_units"][@"temperature_2m_max"];
    
    weatherforecast.daily_units = dailyUnit;
    
    DailyWeatherData* dailyWeatherData = [DailyWeatherData new];
    dailyWeatherData.time = dictionary[@"daily"][@"time"];
    dailyWeatherData.temperature_2m_min = dictionary[@"daily"][@"temperature_2m_min"];
    dailyWeatherData.temperature_2m_max = dictionary[@"daily"][@"temperature_2m_max"];
    
    weatherforecast.daily = dailyWeatherData;
    
    return weatherforecast;
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
