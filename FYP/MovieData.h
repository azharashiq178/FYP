//
//  MovieData.h
//  FYP
//
//  Created by apple on 2/19/17.
//  Copyright © 2017 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieData : NSObject

@property (nonatomic,strong) NSString *Actors;
@property (nonatomic,strong) NSString *Awards;
@property (nonatomic,strong) NSString *Country;
@property (nonatomic,strong) NSString *Director;
@property (nonatomic,strong) NSString *Genre;
@property (nonatomic,strong) NSString *Language;
@property (nonatomic,strong) NSString *Metascore;
@property (nonatomic,strong) NSString *Plot;
@property (nonatomic,strong) NSString *Poster;
@property (nonatomic,strong) NSString *Rated;
@property (nonatomic,strong) NSString *Released;
@property (nonatomic,strong) NSString *Response;
@property (nonatomic,strong) NSString *Runtime;
@property (nonatomic,strong) NSString *Title;
@property (nonatomic,strong) NSString *Type;
@property (nonatomic,strong) NSString *Writer;
@property (nonatomic,strong) NSString *Year;
@property (nonatomic,strong) NSString *imdbID;
@property (nonatomic,strong) NSString *imdbRating;
@property (nonatomic,strong) NSString *imdbVotes;


-(instancetype)initWithJSON:(NSDictionary *)json;



@end
