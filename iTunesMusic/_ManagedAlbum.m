// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ManagedAlbum.m instead.

#import "_ManagedAlbum.h"

const struct ManagedAlbumAttributes ManagedAlbumAttributes = {
	.albumId = @"albumId",
	.artworkURL = @"artworkURL",
	.releaseDate = @"releaseDate",
	.title = @"title",
};

const struct ManagedAlbumRelationships ManagedAlbumRelationships = {
	.artist = @"artist",
};

@implementation ManagedAlbumID
@end

@implementation _ManagedAlbum

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ManagedAlbum" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ManagedAlbum";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ManagedAlbum" inManagedObjectContext:moc_];
}

- (ManagedAlbumID*)objectID {
	return (ManagedAlbumID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"albumIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"albumId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic albumId;

- (int16_t)albumIdValue {
	NSNumber *result = [self albumId];
	return [result shortValue];
}

- (void)setAlbumIdValue:(int16_t)value_ {
	[self setAlbumId:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveAlbumIdValue {
	NSNumber *result = [self primitiveAlbumId];
	return [result shortValue];
}

- (void)setPrimitiveAlbumIdValue:(int16_t)value_ {
	[self setPrimitiveAlbumId:[NSNumber numberWithShort:value_]];
}

@dynamic artworkURL;

@dynamic releaseDate;

@dynamic title;

@dynamic artist;

@end

