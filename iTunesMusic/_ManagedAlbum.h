// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ManagedAlbum.h instead.

#import <CoreData/CoreData.h>

extern const struct ManagedAlbumAttributes {
	__unsafe_unretained NSString *albumId;
	__unsafe_unretained NSString *artworkURL;
	__unsafe_unretained NSString *releaseDate;
	__unsafe_unretained NSString *title;
} ManagedAlbumAttributes;

extern const struct ManagedAlbumRelationships {
	__unsafe_unretained NSString *artist;
} ManagedAlbumRelationships;

@class ManagedArtist;

@interface ManagedAlbumID : NSManagedObjectID {}
@end

@interface _ManagedAlbum : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ManagedAlbumID* objectID;

@property (nonatomic, strong) NSNumber* albumId;

@property (atomic) int16_t albumIdValue;
- (int16_t)albumIdValue;
- (void)setAlbumIdValue:(int16_t)value_;

//- (BOOL)validateAlbumId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* artworkURL;

//- (BOOL)validateArtworkURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* releaseDate;

//- (BOOL)validateReleaseDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ManagedArtist *artist;

//- (BOOL)validateArtist:(id*)value_ error:(NSError**)error_;

@end

@interface _ManagedAlbum (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveAlbumId;
- (void)setPrimitiveAlbumId:(NSNumber*)value;

- (int16_t)primitiveAlbumIdValue;
- (void)setPrimitiveAlbumIdValue:(int16_t)value_;

- (NSString*)primitiveArtworkURL;
- (void)setPrimitiveArtworkURL:(NSString*)value;

- (NSDate*)primitiveReleaseDate;
- (void)setPrimitiveReleaseDate:(NSDate*)value;

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (ManagedArtist*)primitiveArtist;
- (void)setPrimitiveArtist:(ManagedArtist*)value;

@end
