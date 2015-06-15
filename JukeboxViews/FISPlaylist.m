//
//  FISPlaylist.m
//  JukeboxViews
//
//  Created by Yoseob Lee on 6/12/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import "FISPlaylist.h"

@implementation FISPlaylist

-(instancetype)init

{
    self = [super init];
    if (self){
        _songs = [[NSMutableArray alloc]init];
        _song = [[FISSong alloc]init];
        
//        FISSong *song1 = [[FISSong alloc]initWithTitle:@"Hold On Be Strong" artist:@"Tupac Shakur" album:@"R U Still Down?" andFileName:@"hold_on_be_strong"];
//        [_songs addObject:song1];
//        
//        FISSong *song2 = [[FISSong alloc]initWithTitle:@"Higher Love" artist:@"Steve Winwood" album:@"Back in the High Life" andFileName:@"higher_love"];
//        [_songs addObject:song2];
//        
//        FISSong *song3 = [[FISSong alloc]initWithTitle:@"Mo Money Mo Problems" artist:@"Notorious B.I.G." album:@"Life After Death" andFileName:@"mo_money_mo_problems"];
//        [_songs addObject:song3];
//        
//        FISSong *song4 = [[FISSong alloc]initWithTitle:@"Old Thing Back" artist:@"The Notorious B.I.G." album:@"Life After Death" andFileName:@"old_thing_back"];
//        [_songs addObject:song4];
    }
    return self;
}

-(NSString *)description
{
    NSMutableString *playList = [[NSMutableString alloc]init];
    
    for (NSUInteger i = 0; i < [self.songs count]; i++){
        FISSong *track = self.songs[i];
        
        NSString *trackInfo = [NSString stringWithFormat:@"Title: %@ Artist: %@ Album: %@", track.title, track.artist, track.album];
        
        [playList appendFormat:@"%lu. %@\n\n", (i+1), trackInfo];
    }
    return playList;
}

-(FISSong *)songAtPosition:(NSNumber *)position // Returns songs at position (position should start from 1)
{
    if ([position integerValue] > ([self.songs count] + 1) || [position integerValue] == 0){
        return nil;
    }
    else {
        NSInteger humanPosition = [position integerValue] - 1;
        return self.songs[humanPosition];
    }
}

-(void)sortSongsByTitle // Sort songs alphabetically ascending by TITLE, same --> by ARTIST
{
    NSSortDescriptor *sortByTitle = [[NSSortDescriptor alloc]initWithKey:@"title" ascending:YES selector:@selector(localizedStandardCompare:)];
    NSSortDescriptor *sortByArtist = [[NSSortDescriptor alloc]initWithKey:@"artist" ascending:YES selector:@selector(localizedStandardCompare:)];
    
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortByTitle, sortByArtist, nil];
    NSArray *sortedArray = [self.songs sortedArrayUsingDescriptors:sortDescriptors];
    self.songs = [[NSArray arrayWithArray:sortedArray]mutableCopy];
}

-(void)sortSongsByArtist // Sort songs alphabetically by ARTIST, same --> by ALBUM and then TITLE
{
    NSSortDescriptor *sortByArtist = [[NSSortDescriptor alloc]initWithKey:@"artist" ascending:YES selector:@selector(localizedStandardCompare:)];
    NSSortDescriptor *sortByAlbum = [[NSSortDescriptor alloc]initWithKey:@"album" ascending:YES selector:@selector(localizedStandardCompare:)];
    NSSortDescriptor *sortByTitle = [[NSSortDescriptor alloc]initWithKey:@"title" ascending:YES selector:@selector(localizedStandardCompare:)];
    
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortByArtist, sortByAlbum, sortByTitle, nil];
    NSArray *sortedArray = [self.songs sortedArrayUsingDescriptors:sortDescriptors];
    self.songs = [[NSArray arrayWithArray:sortedArray]mutableCopy];
}

-(void)sortSongsByAlbum // Sort songs alphabetically by ALBUM, same --> TITLE
{
    NSSortDescriptor *sortByAlbum = [[NSSortDescriptor alloc]initWithKey:@"album" ascending:YES selector:@selector(localizedStandardCompare:)];
    NSSortDescriptor *sortByTitle = [[NSSortDescriptor alloc]initWithKey:@"title" ascending:YES selector:@selector(localizedStandardCompare:)];
    
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortByAlbum, sortByTitle, nil];
    NSArray *sortedArray = [self.songs sortedArrayUsingDescriptors:sortDescriptors];
    self.songs = [[NSArray arrayWithArray:sortedArray]mutableCopy];
}

//-(void)setSongs:(NSMutableArray *)songs
//{
//    
//}

@end
