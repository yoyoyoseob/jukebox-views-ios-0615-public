//
//  FISSong.h
//  JukeboxViews
//
//  Created by Yoseob Lee on 6/12/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISSong : NSObject
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* artist;
@property (nonatomic, strong) NSString* album;
@property (nonatomic, strong) NSString* fileName;

-(NSString*)description;
-(instancetype)init;
-(instancetype)initWithTitle:(NSString*)songTitle
                      artist:(NSString*)songArtist
                       album:(NSString*)songAlbum
                        andFileName:(NSString*)file;

@end
