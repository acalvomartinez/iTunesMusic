// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ManagedArtist.h instead.

#import <CoreData/CoreData.h>

extern const struct ManagedArtistAttributes {
	__unsafe_unretained NSString *artistId;
	__unsafe_unretained NSString *artworkURL;
	__unsafe_unretained NSString *name;
} ManagedArtistAttributes;

extern const struct ManagedArtistRelationships {
	__unsafe_unretained NSString *albums;
} ManagedArtistRelationships;

@class ManagedAlbum;

@interface ManagedArtistID : NSManagedObjectID {}
@end

@interface _ManagedArtist : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ManagedArtistID* objectID;

@property (nonatomic, strong) NSNumber* artistId;

@property (atomic) int32_t artistIdValue;
- (int32_t)artistIdValue;
- (void)setArtistIdValue:(int32_t)value_;

//- (BOOL)validateArtistId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* artworkURL;

//- (BOOL)validateArtworkURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *albums;

- (NSMutableSet*)albumsSet;

@end

@interface _ManagedArtist (AlbumsCoreDataGeneratedAccessors)
- (void)addAlbums:(NSSet*)value_;
- (void)removeAlbums:(NSSet*)value_;
- (void)addAlbumsObject:(ManagedAlbum*)value_;
- (void)removeAlbumsObject:(ManagedAlbum*)value_;

@end

@interface _ManagedArtist (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveArtistId;
- (void)setPrimitiveArtistId:(NSNumber*)value;

- (int32_t)primitiveArtistIdValue;
- (void)setPrimitiveArtistIdValue:(int32_t)value_;

- (NSString*)primitiveArtworkURL;
- (void)setPrimitiveArtworkURL:(NSString*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveAlbums;
- (void)setPrimitiveAlbums:(NSMutableSet*)value;

@end
