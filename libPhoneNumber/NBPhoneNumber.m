//
//  NBPhoneNumber.m
//  libPhoneNumber
//
//  Created by ishtar on 12. 12. 13..
//  Copyright (c) 2012년 NHN. All rights reserved.
//

#import "NBPhoneNumber.h"
#import "NBPhoneNumberDefines.h"

@implementation NBPhoneNumber

@synthesize countryCode, nationalNumber, extension, italianLeadingZero, rawInput, countryCodeSource, preferredDomesticCarrierCode;

- (id)init
{
    self = [super init];
    
    if (self)
    {
        self.countryCodeSource = nil;
        self.italianLeadingZero = NO;
        self.nationalNumber = -1;
        self.countryCode = -1;
    }
    
    return self;
}


- (void)clearCountryCodeSource
{
    [self setCountryCodeSource:nil];
}


- (NBECountryCodeSource)getCountryCodeSourceOrDefault
{
    if (self.countryCodeSource == nil)
        return NBECountryCodeSourceFROM_NUMBER_WITH_PLUS_SIGN;
    
    return [self.countryCodeSource intValue];
}


- (BOOL)isEqual:(id)object
{
    if ([object isKindOfClass:[NBPhoneNumber class]] == NO)
        return NO;
    
    NBPhoneNumber *other = object;
    return (self.countryCode == other.countryCode) && (self.nationalNumber == other.nationalNumber) &&
        (self.italianLeadingZero == other.italianLeadingZero) &&
        ((self.extension == nil && other.extension == nil) || [self.extension isEqualToString:other.extension]);
}


- (id)copyWithZone:(NSZone *)zone
{
	NBPhoneNumber *phoneNumberCopy = [[NBPhoneNumber allocWithZone:zone] init];
    
	phoneNumberCopy.countryCode = self.countryCode;
    phoneNumberCopy.nationalNumber = self.nationalNumber;
    phoneNumberCopy.extension = [self.extension copy];
    phoneNumberCopy.italianLeadingZero = self.italianLeadingZero;
    phoneNumberCopy.rawInput = [self.rawInput copy];
    phoneNumberCopy.countryCodeSource = [self.countryCodeSource copy];
    phoneNumberCopy.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    
	return phoneNumberCopy;
}


- (NSString *)description
{
    return [NSString stringWithFormat:@" - countryCode[%ld], nationalNumber[%llu], extension[%@], italianLeadingZero[%@], rawInput[%@] countryCodeSource[%d] preferredDomesticCarrierCode[%@]", self.countryCode, self.nationalNumber, self.extension, self.italianLeadingZero?@"Y":@"N", self.rawInput, [self.countryCodeSource intValue], self.preferredDomesticCarrierCode];
}

@end
