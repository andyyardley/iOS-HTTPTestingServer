iOS Testing HTTP Sever Integration Document
==========================================

iOS Testing HTTP Server is a library for iOS used to integrate a WebServer into an application allowing, this was done so that the ruby script we were using to run our Appium tests was able to pass configuration information to the app, there by configuring the mock services being.

### Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like iOSTesting-HTTP-Server in your projects.

#### Podfile

```ruby
platform :ios, '7.0'
pod 'iOS-Testing-HTTP-Server', :git => 'git@github.com:andyyardley/iOSTesting-HTTP-Server.git'
```

### Setup & Configuration

We would suggest using a category to facilite the  creation and initialisation of the WebServer to your project, using a target to add the category to be enabled for QA builds only.
A second category for the AppDelegate would allow you to configure your mock services when the correct arguments are received there by allowing you to configure the appropriate service behaviours.

Copyright 2015.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
