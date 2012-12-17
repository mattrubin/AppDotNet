//
//  AppDotNetTests.m
//  AppDotNetTests
//
//  Created by Me on 12/14/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "AppDotNetTests.h"

#import "ADN.h"
#import "ADNHelper.h"

@implementation AppDotNetTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testUsers
{
    
    /*
    NSLog(@"==================================================");
    [ADN getCurrentUserWithCompletionHandler:nil];
    NSLog(@"==================================================");
    [ADN getUserWithID:3 completionHandler:nil];
    NSLog(@"==================================================");
    [ADN getUserWithUsername:@"dalton" completionHandler:nil];
    NSLog(@"==================================================");
    [ADN getUserWithUsername:@"@berg" completionHandler:nil];
    NSLog(@"==================================================");
    */
}

- (void)testUserFromDictionary
{
    NSString *path = [[NSBundle bundleForClass:self.class] pathForResource:@"User" ofType:@"json"];
    NSData *userData = [NSData dataWithContentsOfFile:path];
    
    NSDictionary *responseEnvelope;
    NSDictionary *userDictionary;
    if ((responseEnvelope = [ADNHelper dictionaryFromJSONData:userData])) {
        userDictionary = [ADNHelper responseDataFromEnvelope:responseEnvelope];
    }
    if (!userDictionary) return;
    
    ADNUser *user = [ADNUser userFromDictionary:userDictionary];
    
    [self validateUser:user withDictionary:userDictionary];
}

- (void)validateUser:(ADNUser*)user withDictionary:(NSDictionary*)userDictionary
{
    STAssertEqualObjects([userDictionary objectForKey:@"id"],       ([NSString stringWithFormat:@"%u", user.userID]), @"(id)");
    STAssertEqualObjects(user.username, [userDictionary objectForKey:@"username"], @"(username)");
    STAssertEqualObjects(user.name,     [userDictionary objectForKey:@"name"],     @"(name)");
    
    NSDictionary *description = [userDictionary objectForKey:@"description"];
    STAssertEqualObjects(user.descriptionText, [description objectForKey:@"text"], @"(description.text)");
    STAssertEqualObjects(user.descriptionHTML, [description objectForKey:@"html"], @"(description.html)");
    [self validateEntities:user.descriptionEntities withDictionary:[description objectForKey:@"entities"]];
    
    STAssertEqualObjects(user.timezone, [userDictionary objectForKey:@"timezone"], @"(timezone)");
    STAssertEqualObjects(user.locale,   [userDictionary objectForKey:@"locale"],   @"(locale)");

    [self validateImage:user.avatarImage withDictionary:[userDictionary objectForKey:@"avatar_image"]];
    [self validateImage:user.coverImage  withDictionary:[userDictionary objectForKey:@"cover_image"]];
    
    STAssertEqualObjects(user.typeString, [userDictionary objectForKey:@"type"], @"(type)");
    STAssertEqualObjects([[ADNHelper dateFormatter] stringFromDate:user.createdAt], [userDictionary objectForKey:@"created_at"], @"(created_at)");
    
    NSDictionary *counts = [userDictionary objectForKey:@"counts"];
    STAssertEquals(user.followingCount, (NSUInteger)[[counts objectForKey:@"following"] integerValue], @"(counts.following)");
    STAssertEquals(user.followerCount,  (NSUInteger)[[counts objectForKey:@"followers"] integerValue], @"(counts.followers)");
    STAssertEquals(user.postCount,      (NSUInteger)[[counts objectForKey:@"posts"] integerValue],     @"(counts.posts)");
    STAssertEquals(user.starCount,      (NSUInteger)[[counts objectForKey:@"stars"] integerValue],     @"(counts.stars)");

    STAssertEquals(user.followsYou, [[userDictionary objectForKey:@"follows_you"] boolValue], @"(follows_you)");
    STAssertEquals(user.youFollow,  [[userDictionary objectForKey:@"you_follow"] boolValue],  @"(you_follow)");
    STAssertEquals(user.youMuted,   [[userDictionary objectForKey:@"you_muted"] boolValue],   @"(you_muted)");
    
    [self validateAnnotations:user.annotations withArray:[userDictionary objectForKey:@"annotations"]];
}

- (void)validateEntities:(ADNEntities*)entities withDictionary:(NSDictionary*)entitiesDictionary
{
    if (![entities isKindOfClass:[ADNEntities class]]) {
        STFail(@"Entities is not an ADNEntities object. %@", entities);
    }
    if (![entitiesDictionary isKindOfClass:[NSDictionary class]]) {
        STFail(@"Entities dictionary is not an NSDictionary. %@", entitiesDictionary);
    }
    
    NSArray *mentionsArray = [entitiesDictionary objectForKey:@"mentions"];
    for (NSDictionary *mentionDictionary in mentionsArray) {
        BOOL success = NO;

        for (ADNMention *mention in entities.mentions) {
            if (([mention.username isEqualToString:[mentionDictionary objectForKey:@"name"]]) &&
                ([[NSString stringWithFormat:@"%u", mention.userID] isEqualToString:[mentionDictionary objectForKey:@"id"]]) &&
                (mention.position == [[mentionDictionary objectForKey:@"pos"] integerValue]) &&
                (mention.length == [[mentionDictionary objectForKey:@"len"] integerValue]))
            {
                success = YES;
                break;
            }
        }
        if (!success) {
            STFail(@"No matching mention entity found:\n%@", mentionDictionary);
        }
    }
    
    
    NSArray *hashtagsArray = [entitiesDictionary objectForKey:@"hashtags"];
    for (NSDictionary *hashtagDictionary in hashtagsArray) {
        BOOL success = NO;
        
        for (ADNHashtag *hashtag in entities.hashtags) {
            if (([hashtag.name isEqualToString:[hashtagDictionary objectForKey:@"name"]]) &&
                (hashtag.position == [[hashtagDictionary objectForKey:@"pos"] integerValue]) &&
                (hashtag.length == [[hashtagDictionary objectForKey:@"len"] integerValue]))
            {
                success = YES;
                break;
            }
        }
        if (!success) {
            STFail(@"No matching hashtag entity found:\n%@", hashtagDictionary);
        }
    }
    
    NSArray *linksArray = [entitiesDictionary objectForKey:@"links"];
    for (NSDictionary *linkDictionary in linksArray) {
        BOOL success = NO;
        
        for (ADNLink *link in entities.links) {
            if (([link.text isEqualToString:[linkDictionary objectForKey:@"text"]]) &&
                ([link.url isEqualToString:[linkDictionary objectForKey:@"url"]]) &&
                (link.position == [[linkDictionary objectForKey:@"pos"] integerValue]) &&
                (link.length == [[linkDictionary objectForKey:@"len"] integerValue]))
            {
                success = YES;
                break;
            }
        }
        if (!success) {
            STFail(@"No matching link entity found:\n%@", linkDictionary);
        }
    }

}

- (void)validateImage:(ADNImage*)image withDictionary:(NSDictionary*)imageDictionary
{
    if (![image isKindOfClass:[ADNImage class]]) {
        STFail(@"Image is not an ADNImage. %@", image);
    }
    if (![imageDictionary isKindOfClass:[NSDictionary class]]) {
        STFail(@"Image dictionary is not an NSDictionary. %@", imageDictionary);
    }

    STAssertEquals(image.height, (NSUInteger)[[imageDictionary objectForKey:@"height"] integerValue], @"(height)");
    STAssertEquals(image.width,  (NSUInteger)[[imageDictionary objectForKey:@"width"] integerValue],  @"(width)");
    STAssertEqualObjects(image.url, [imageDictionary objectForKey:@"url"], @"(url)");
}

- (void)validateAnnotations:(NSDictionary*)annotations withArray:(NSArray*)annotationsArray
{
    if (![annotations isKindOfClass:[NSDictionary class]]) {
        STFail(@"Annotations is not an NSDictionary. %@", annotations);
    }
    if (![annotationsArray isKindOfClass:[NSArray class]]) {
        STFail(@"Annotations array is not an NSArray. %@", annotationsArray);
    }
    
    for (NSDictionary *annotationDict in annotationsArray) {
        NSString *type = [annotationDict objectForKey:@"type"];
        ADNAnnotation *annotation;
        if ((annotation = [annotations objectForKey:type])) {
            if (([annotation.type isEqualToString:type]) &&
                ([annotation.value isEqual:[annotationDict objectForKey:@"value"]])) {
                continue;
            }
        }
        STFail(@"No matching annotation found:\n%@", annotationDict);
    }

}


@end
