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
    
    NSSortDescriptor *sortDescriptorReleaseDate = [NSSortDescriptor sortDescriptorWithKey:ManagedAlbumAttributes.releaseDate ascending:NO];
    NSSortDescriptor *sortDescriptorAlbumId = [NSSortDescriptor sortDescriptorWithKey:ManagedAlbumAttributes.albumId ascending:NO];
    
    ManagedAlbum *lastAlbum = [[self.albums sortedArrayUsingDescriptors:@[sortDescriptorReleaseDate, sortDescriptorAlbumId]] firstObject];
    
    return lastAlbum.artworkURL;
}

@end
