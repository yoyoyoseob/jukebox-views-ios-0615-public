//
//  FISPlaylist.h
//  JukeboxViews
//
//  Created by Yoseob Lee on 6/12/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISSong.h"

@interface FISPlaylist : NSObject
@property (nonatomic, strong) FISSong* song;
@property (nonatomic, strong) NSMutableArray* songs;

-(void)sortSongsByTitle; // Sort songs alphabetically ascending by TITLE, same --> by ARTIST
-(void)sortSongsByArtist; // Sort songs alphabetically by ARTIST, same --> by ALBUM and then TITLE
-(void)sortSongsByAlbum; // Sort songs alphabetically by ALBUM, same --> TITLE
-(NSString*)description; // Representation of the playlist \n for new line
-(FISSong*)songAtPosition:(NSNumber*)position; // Returns songs at position (position should start from 1)

-(instancetype)init;

@end
