//
//  JYYQRCodeView.h
//  Example
//
//  Created by Tom Hutchinson on 12/02/2014.
//  Copyright (c) 2014 JustYoyo Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ErrorCorrectionLevelLow,
    ErrorCorrectionLevelMedium,
    ErrorCorrectionLevelQuartile,
    ErrorCorrectionLevelHigh
} ErrorCorrectionLevel;

@interface JYYQRCodeView : UIImageView

- (id)initWithFrame:(CGRect)frame stringToEncode:(NSString *)stringToEncode andErrorCorrectionLevel:(ErrorCorrectionLevel)errorCorrectionLevel;

- (void)encodeString:(NSString *)stringToEncode withErrorCorrectionLevel:(ErrorCorrectionLevel)errorCorrectionLevel;

@end
