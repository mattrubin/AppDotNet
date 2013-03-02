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

