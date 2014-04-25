//
//  JYYQRCodeImageView.m
//  Example
//
//  Created by Tom Hutchinson on 12/02/2014.
//  Copyright (c) 2014 JustYoyo Ltd. All rights reserved.
//

#import "JYYQRCodeImageView.h"

@implementation JYYQRCodeImageView

#pragma mark - Public
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    return self;
}

- (id)initWithFrame:(CGRect)frame stringToEncode:(NSString *)stringToEncode andErrorCorrectionLevel:(ErrorCorrectionLevel)errorCorrectionLevel {
    self = [super initWithFrame:frame];
    [self encodeString:stringToEncode withErrorCorrectionLevel:errorCorrectionLevel];
    return self;
}

- (void)encodeString:(NSString *)stringToEncode withErrorCorrectionLevel:(ErrorCorrectionLevel)errorCorrectionLevel {
    //Set code type
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    
    //Data to encode
    NSData *data = [stringToEncode dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];
    [filter setValue:[self convertErrorCorrectionLevelToString:errorCorrectionLevel] forKey:@"inputCorrectionLevel"];
    
    CIImage *outputImage = [filter outputImage];
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:outputImage
                                       fromRect:[outputImage extent]];
    
    UIImage *image = [UIImage imageWithCGImage:cgImage
                                         scale:1
                                   orientation:UIImageOrientationUp];
    
    UIImage *resized = [self resizeImage:image
                             withQuality:kCGInterpolationNone
                                    rate:10.0];
    
    self.image = resized;
}

#pragma mark - Private
- (UIImage *)resizeImage:(UIImage *)image
             withQuality:(CGInterpolationQuality)quality
                    rate:(CGFloat)rate {
	UIImage *resized = nil;
	CGFloat width = image.size.width * rate;
	CGFloat height = image.size.height * rate;
	
	UIGraphicsBeginImageContext(CGSizeMake(width, height));
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetInterpolationQuality(context, quality);
	[image drawInRect:CGRectMake(0, 0, width, height)];
	resized = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return resized;
}

- (NSString *)convertErrorCorrectionLevelToString:(ErrorCorrectionLevel) whichAlpha {
    NSString *errorCorrectionLevelString = nil;
    
    switch(whichAlpha) {
        case ErrorCorrectionLevelLow:
            errorCorrectionLevelString = @"L";
            break;
        case ErrorCorrectionLevelMedium:
            errorCorrectionLevelString = @"M";
            break;
        case ErrorCorrectionLevelQuartile:
            errorCorrectionLevelString = @"Q";
            break;
        case ErrorCorrectionLevelHigh:
            errorCorrectionLevelString = @"H";
            break;
            
        default:
            errorCorrectionLevelString = @"unknown";
    }
    
    return errorCorrectionLevelString;
}

@end
