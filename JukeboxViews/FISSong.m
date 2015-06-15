//
//  FISSong.m
//  JukeboxViews
//
//  Created by Yoseob Lee on 6/12/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import "FISSong.h"

@implementation FISSong

-(instancetype)init
{
    self = [self initWithTitle:@"" artist:@"" album:@"" andFileName:@""];
    return self;
}

-(instancetype)initWithTitle:(NSString*)songTitle
                      artist:(NSString*)songArtist
                       album:(NSString*)songAlbum
                 andFileName:(NSString*)file
{
    self = [super init];
    if (self){
        _title = songTitle;
        _artist = songArtist;
        _album = songAlbum;
        _fileName = file;
    }
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"Title: %@ Artist: %@ Album: %@", self.title, self.artist, self.album];
}
@end

