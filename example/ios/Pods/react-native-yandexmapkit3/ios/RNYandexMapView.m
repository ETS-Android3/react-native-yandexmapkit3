//
//  RNTMapView.m
//  ReactNativeYMMap
//
//  Created by Дима on 11.09.2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "RNYandexMapView.h"
#import <YandexMapKit/YMKMapKitFactory.h>

@implementation RNYandexMap

- (instancetype) init {
  self = [super init];
  YMKPoint *target = [YMKPoint pointWithLatitude:0 longitude:0];
  YMKLogoAlignment *logoAlignment = [YMKLogoAlignment alignmentWithHorizontalAlignment:(YMKLogoHorizontalAlignmentRight) verticalAlignment:(YMKLogoVerticalAlignmentTop)];
  [self.mapWindow.map moveWithCameraPosition:[YMKCameraPosition cameraPositionWithTarget:target
                                                                                    zoom:16
                                                                                 azimuth:0
                                                                                    tilt:0]
  ];
  
  [self.mapWindow.map addCameraListenerWithCameraListener:self];
  [self.mapWindow.map.logo setAlignmentWithAlignment:(logoAlignment)];
  return self;
}

- (void)onCameraPositionChangedWithMap:(YMKMap *)map cameraPosition:(nonnull YMKCameraPosition *)cameraPosition cameraUpdateSource:(YMKCameraUpdateSource)cameraUpdateSource finished:(BOOL)finished {
  int type = 0;
  if(cameraUpdateSource == YMKCameraUpdateSourceGestures) {
    type = 1; // User event
  } else {
    type = 2; // Application event
  }
  if (finished) {
    self.onMapEvent(@{
                      @"type": @(type),
                      @"latitude": @(cameraPosition.target.latitude),
                      @"longitude": @(cameraPosition.target.longitude)
                      });
  }
}

@end
