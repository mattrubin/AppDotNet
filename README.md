# AppDotNet

The AppDotNet library provides an asynchronous Objective-C wrapper for the [App.net API](http://developers.app.net). The goal of this project is to provide a common base for ADN apps, making it easy for new developers to start building their ideas without the overhead of reimplementing the API methods and model objects. It supports both iOS and OS X.

## Status

This is a work in progress, and I develop parts as needed for my own App.net projects. Model objects for Users, Posts, Channels, Messages, and Files are fully implemented, along with their annotations and other sub-objects. More of the resources will be added over time.

## Getting Started

#### Authentication

```objc
ADNAuthenticationRequest *authRequest = [ADNAuthenticationRequest new];
authRequest.clientId = <#yourClinetID#>;
authRequest.responseType = ADNAuthenticationResponseTypeToken;
authRequest.redirectURI = @"yourapp://callback";
authRequest.scopes = ADNScopeBasic | ADNScopeFiles;
authRequest.appStoreCompliant = YES;
    
NSURL *authURL = authRequest.URL;
// load the authURL in a UIWebView and figure out when auth is finished based on what URL the web view tries to load next.
```

### Using the ADNClient

After authentication the `ADNClient` is the main object which is responsible for communicating with app.net. It is implemented as a singleton. Typically, one interaction with the service is a multi-step process:

1. Fetch the `sharedClient`, when used the first time set the `accessToken` property on the client object with the user access token received during the authentication process.
2. Call the approbiate method on the client.
3. (optional) Handle the result using a completion handler, which is implemented as a block.

#### Creating a Public Post

In this example, the individual steps are:

1. Getting the `sharedClient` (in this example it is assumed that the `accessToken` is already set on the client object).
2. Preparing an `ADNPost` instance to post.
3. Posting this instance using the `sharedClient`.

```objc
- (void)postMessage:(NSString *)text
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
        NSBlockOperation *updateUI = [NSBlockOperation blockOperationWithBlock:^{
        [self.usernameLabel setText:user.username];
        [self.userIdLabel setText:user.userId];
        }];
        // add operation to main queue to update the UI from the main thread only
        [[NSOperationQueue mainQueue] addOperation:updateUI];
    }];
}
```

#### 

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

