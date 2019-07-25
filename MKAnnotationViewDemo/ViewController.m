//
//  ViewController.m
//  MKAnnotationViewDemo
//
//  Created by Glen Ella on 2019/7/19.
//  Copyright © 2019 sh. All rights reserved.
//地图上的大头针视图

#import "ViewController.h"
#import "MyAnnotation.h"

@interface ViewController ()<MKMapViewDelegate>

//创建地图显示视图
@property (strong, nonatomic) MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    //触摸缩放
    self.mapView.zoomEnabled = YES;
    //是否可移动
    self.mapView.scrollEnabled = YES;
    //地图形式
    self.mapView.mapType = MKMapTypeStandard;
//    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.mapView.delegate = self;
    //显示用户位置
    self.mapView.showsUserLocation = YES;
    
    [self.view addSubview:self.mapView];
    
    [self addAnnotation];
    
}

//创建大头针对象的实现方法
- (void)addAnnotation
{
    //指定一个经纬度(大头针对象中有一个经纬度属性)
    CLLocationCoordinate2D location1 = CLLocationCoordinate2DMake(39.95, 116.35);
    //创建大头针对象
    MyAnnotation *annotation1 = [[MyAnnotation alloc] init];
    annotation1.title = @"北京";
    annotation1.subtitle = @"故宫";
    //将创建的经纬度对象,设置为大头针的经纬度
    annotation1.coordinate = location1;
    //将大头针添加到视图上显示
    [self.mapView addAnnotation:annotation1];
    
    CLLocationCoordinate2D location2 = CLLocationCoordinate2DMake(48.95, 116.35);
    MyAnnotation *annotation2   = [[MyAnnotation alloc] init];
    annotation2.title = @"Other Studio";
    annotation2.subtitle = @"Ella`s Studios";
    annotation2.coordinate = location2;
    [self.mapView addAnnotation:annotation2];
    
    //    [self.mapView showAnnotations:@[annotation1, annotation2] animated:YES];
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    //由于当前位置的标注也是一个大头针，所以此时需要判断，此代理方法返回nil使用默认大头针视图
    if ([annotation isKindOfClass:[MyAnnotation class]]) {
        static NSString *identify = @"Anno";
        MKAnnotationView *annoView = [mapView dequeueReusableAnnotationViewWithIdentifier:identify];
        if (!annoView) {
            annoView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identify];
            annoView.canShowCallout = YES;  //允许交互点击
//            annoView.calloutOffset = CGPointMake(0, 0); //定义详情视图偏移量
//            annoView.leftCalloutAccessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
        }
        annoView.annotation = annotation;
        annoView.image = [UIImage imageNamed:@"datouzhen"];//设置大头针视图的图片
        return annoView;
    } else {
        return nil;
    }
}

@end
