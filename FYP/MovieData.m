//
//  MovieData.m
//  FYP
//
//  Created by apple on 2/19/17.
//  Copyright © 2017 apple. All rights reserved.
//

#import "MovieData.h"

@implementation MovieData



-(instancetype)initWithJSON:(NSDictionary *)json{
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:json];
    }
    return self;
}



-(void)setValue:(id)value forKey:(NSString *)key{
    
    if ([value isEqual:[NSNull null]] || !value) {
        return;
    }
    
//    if ([key isEqualToString:@"Array"]) {
//        
//        
//    }
    
    [super setValue:value forKey:key];
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    NSLog(@"This class is not key value compliant for key : %@",key);
}

@end
