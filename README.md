# AppDotNet

The AppDotNet library provides an asynchronous Objective-C wrapper for the [App.net API](http://developers.app.net). The goal of this project is to provide a common base for ADN apps, making it easy for new developers to start building their ideas without the overhead of reimplementing the API methods and model objects. It supports both iOS and OS X.

## Status

This is a work in progress, and I develop parts as needed for my own App.net projects. Model objects for Users, Posts, Channels, Messages, and Files are fully implemented, along with their annotations and other sub-objects. More of the resources will be added over time.

## Getting Started

Example code to get you started using the library is below. For a more thorough overview of the various parts of the library, see this [AppDotNet Overview](https://github.com/mattrubin/AppDotNet/wiki/AppDotNet-Overview).

### Authentication

An `ADNAuthenticationRequest` can be used to construct a URL for the web-based authentication flow. A working example of authentication and extracting an `access_token` from the callback URL can be seen in [NDAAuthenticationViewController](https://github.com/mattrubin/NetDotApp/blob/master/NetDotApp/Classes/NDAAuthenticationViewController.m).

```objc
ADNAuthenticationRequest *authRequest = [ADNAuthenticationRequest new];
authRequest.clientId = <#yourClientId#>;
authRequest.responseType = ADNAuthenticationResponseTypeToken;
authRequest.redirectURI = @"yourapp://callback";
authRequest.scopes = ADNScopeBasic | ADNScopeFiles;
authRequest.appStoreCompliant = YES;

NSURL *authURL = authRequest.URL;
// load the authURL in a UIWebView and figure out when auth is finished based on what URL the web view tries to load next.
```

### Setting up `ADNClient`

The `ADNClient` class is responsible for communicating with App.net. It has a method corresponding to each API endpoint. The simplest way to make use of the client is through the singleton instance `[ADNClient sharedClient]`.

Once an access token is acquired, it should be passed to the client:
```objc
[[ADNClient sharedClient] setAccessToken:accessToken];
```

To support multiple accounts, you can create multiple instances of `ADNClient`, each with their own access token.

### Making API Requests

Each method on `ADNClient` takes whatever parameters are required by that API endpoint, as well as an optional completion block. The completion block is passed three objects: the object or collection of objects which were returned from the server, an `ADNMetadata` object which contains the `meta` information from the response envelope, and possibly an `NSError` if something went wrong. The completion block is run on the main thread by default. 

#### Fetching a user:

```objc
[[ADNClient sharedClient] getUser:@"@mattrubin"
            withCompletionHandler:^(ADNUser *user, ADNMetadata *meta, NSError *error)
{
    if (user) {
        NSLog(@"This user's name is %@", user.name);
    } else {
        // Handle the error...
        NSLog(@"meta: %@", meta);
        // Useful info might be in the meta object returned from ADN
    }
}];
```

Additional API examples can be found in the more thorough ["Getting Started" guide](https://github.com/mattrubin/AppDotNet/wiki/Getting-Started) in the source repository's wiki.

<!--
#### Fetching new files:

```objc
NSDictionary *parameters = self.maxId ? @{@"since_id":self.maxId} : nil;

[[ADNClient sharedClient] getMyFilesWithParameters:parameters
                                 completionHandler:^(NSArray *files, ADNMetadata *meta, NSError *error)
 {
     if (!error) {
         NSLog(@"Fetched %i new files...", files.count);
         
         if (files.count) { // If there are new files
             self.maxId = meta.maxId;
             
             [self.files insertObjects:files
                             atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, files.count)]];
             // Update the UI to show the new files...
         }
     } else {
         // Handle the error...
         NSLog(@"error: %@", error);
         NSLog(@"meta: %@", meta);
     }
 }];
```

#### Creating a Public Post:

In this example, the individual steps are:

1. Getting the `sharedClient` (in this example it is assumed that the `accessToken` is already set on the client object).
2. Preparing an `ADNPost` instance to post.
3. Posting this instance using the `sharedClient`.

```objc
- (void)postPostWithText:(NSString *)text
{
    ADNClient *myClient = [ADNClient sharedClient];
    ADNPost *myPost = [[ADNPost alloc] init];
    myPost.text = text;
    [myClient postPost:myPost completionHandler:NULL];
}
```

#### Retrieving Information About the Currently Authorized User

This example shows how to use the completion block to interact with the rest of the application. The strategy here is:

1. Retrieve the `sharedClient` and set its `accessToken`.
2. Call the `getUser` method with the special username `me`.
3. Use the completion handler to place a new operation on the main queue to update the UI.

```objc
- (void)retrieveUserInformation
{
    ADNClient *myClient = [ADNClient sharedClient];
    myClient.accessToken = userAccessToken;
    [myClient getUser:@"me" withCompletionHandler:^(ADNUser *user, ADNMetadata *meta, NSError *error){
        [self.usernameLabel setText:user.username];
        [self.userIdLabel setText:user.userId];
    }];
}
```
-->

## Installation

I recommend adding this library to your code's repository as a [Git submodule](http://git-scm.com/book/en/Git-Tools-Submodules) and then to Xcode as a subproject. A thorough walkthrough of using subprojects and submodules can be found [here](http://www.blog.montgomerie.net/easy-xcode-static-library-subprojects-and-submodules).

## Requirements

The AppDotNet library is intended to work on iOS 5.0 and above. There is also an OS X framework target, and OS X 10.7+ is fully supported.

GitHub's [Mantle](http://github.com/github/Mantle) framework is used for modeling ADN objects, and the [AFNetworking](https://github.com/AFNetworking/AFNetworking) library is used for making API calls. They are included as submodules and can be pulled with `git submodule update --recursive --init`.

The library and its submodules require [ARC](http://en.wikipedia.org/wiki/Automatic_Reference_Counting), and have been developed using Xcode 4.5 and above.

Other framework dependencies are:
* CoreLocation.framework
* SystemConfiguration.framework
* (on iOS): MobileCoreServices.framework

## License

This code is distributed under the terms and conditions of the MIT license.


>MIT License

>Copyright (c) 2012 Matt Rubin

>Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

>The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

