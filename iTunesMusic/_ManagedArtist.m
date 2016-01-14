// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ManagedArtist.m instead.

#import "_ManagedArtist.h"

const struct ManagedArtistAttributes ManagedArtistAttributes = {
	.artistId = @"artistId",
	.artworkURL = @"artworkURL",
	.name = @"name",
};

const struct ManagedArtistRelationships ManagedArtistRelationships = {
	.albums = @"albums",
};

@implementation ManagedArtistID
@end

@implementation _ManagedArtist

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ManagedArtist" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ManagedArtist";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ManagedArtist" inManagedObjectContext:moc_];
}

- (ManagedArtistID*)objectID {
	return (ManagedArtistID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"artistIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"artistId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic artistId;

- (int32_t)artistIdValue {
	NSNumber *result = [self artistId];
	return [result intValue];
}

- (void)setArtistIdValue:(int32_t)value_ {
	[self setArtistId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveArtistIdValue {
	NSNumber *result = [self primitiveArtistId];
	return [result intValue];
}

- (void)setPrimitiveArtistIdValue:(int32_t)value_ {
	[self setPrimitiveArtistId:[NSNumber numberWithInt:value_]];
}

@dynamic artworkURL;

@dynamic name;

@dynamic albums;

- (NSMutableSet*)albumsSet {
	[self willAccessValueForKey:@"albums"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"albums"];

	[self didAccessValueForKey:@"albums"];
	return result;
}

@end

