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
    
    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"releaseDate" ascending:YES]];
    
    ManagedAlbum *lastAlbum = [[self.albums sortedArrayUsingDescriptors:sortDescriptors] lastObject];
    
    return lastAlbum.artworkURL;
}

@end
