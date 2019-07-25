//
//  MyAnnotation.h
//  MKAnnotationViewDemo
//
//  Created by Glen Ella on 2019/7/19.
//  Copyright © 2019 sh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyAnnotation : NSObject<MKAnnotation>
//CLLocationCoordinate2D是一个结构体对象, 其中有两个属性经度和纬度
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
//有经纬度属性

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@end

NS_ASSUME_NONNULL_END
