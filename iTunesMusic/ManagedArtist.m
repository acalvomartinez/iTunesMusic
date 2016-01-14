#import "ManagedArtist.h"

#import "ManagedAlbum.h"

@interface ManagedArtist ()

// Private interface goes here.

@end

@implementation ManagedArtist

- (NSString *)artworkURL {
    if (!self.albums) {
        return nil;
    }
    
    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"releaseDate" ascending:NO]];
    
    ManagedAlbum *lastAlbum = [[self.albums sortedArrayUsingDescriptors:sortDescriptors] firstObject];
    
    return lastAlbum.artworkURL;
}

@end
