JYYQRCodeView
=============

UIImageView Subclass for displaying a QR Code

## Usage

Copy the JYYQRCodeView class into your project or add this line to your [Podfile](http://cocoapods.org/):

	pod 'JYYQRCodeView', '~> 1.1'

## Overview

Import the header:

	#import "JYYQRCodeView.h"

Then simply alloc and init the view like so (or use storyboards if you are so inclined)

    JYYQRCodeView *someCodeView = [[JYYQRCodeView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) stringToEncode:@"Hello, world!" andErrorCorrectionLevel:ErrorCorrectionLevelLow];

You can update the encoded text like so
    
    [someCodeView encodeString:@"New String" withErrorCorrectionLevel:ErrorCorrectionLevelLow];

Note, You will need to pass in one of the following ErrorCorrectionLevels. You can read more about them [here](http://en.wikipedia.org/wiki/QR_code#Error_correction)
  
  ErrorCorrectionLevelLow, ErrorCorrectionLevelMedium, ErrorCorrectionLevelQuartile, ErrorCorrectionLevelHigh
