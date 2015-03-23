//
//  AKPropertyLabel.m
//  AudioKitPlayground
//
//  Created by Aurelius Prochazka on 3/22/15.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#import "AKPropertyLabel.h"

@implementation AKPropertyLabel


- (void)setProperty:(id)property
{
    _property = property;
    [self.property addObserver:self forKeyPath:@"value" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:NULL];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context
{
    [self setNeedsDisplay];
};

- (void)setNeedsDisplay
{
    if ([_property isKindOfClass:[AKInstrumentProperty class]])
    {
        AKInstrumentProperty *p = (AKInstrumentProperty *)_property;
        self.text = [NSString stringWithFormat:@"%f", p.value];
    }
    else if ([_property isKindOfClass:[AKNoteProperty class]])
    {
        AKNoteProperty *p = (AKNoteProperty *)_property;
        self.text = [NSString stringWithFormat:@"%f", p.value];
    }
    
    [super setNeedsDisplay];
}

@end