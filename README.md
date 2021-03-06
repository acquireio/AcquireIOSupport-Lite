# AcquireIOSupport-Lite

AcquireIO Support (Lite) for real time chat


This guide describes the process of implementing AcquireIOSupport Lite SDK into your iOS app.

We recommend using CocoaPods as the most advanced way of managing iOS project dependencies.

### Installation
To connect AcquireIOSupport Lite SDK to your iOS app just add it into your Podfile:

1) Create a Podfile in your project's root directory, if it doesn't exist yet.

2) Add the **AcquireIOSupport-Lite** in Podfile under your desired target:

   ```

   target :YourTargetName do
      pod 'AcquireIOSupport-Lite'
   end

   ```

3) The AcquireIOSupport SDK supports module stability and therefore all its dependencies must be built in with the "Build Libraries for Distribution" setting enabled, however this is not currently supported in Cocoapods. Running below command will ensure Xcode builds the dependencies with the correct settings. Once Cocoapods supports module stability, this workaround can be removed.

Add the following to the bottom of your Podfile: 

    ```

    post_install do |installer|
      installer.pods_project.targets.each do |target|
        if ['Socket.IO-Client-Swift', 'Starscream'].include? target.name
          target.build_configurations.each do |config|
              config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
              config.build_settings['ENABLE_BITCODE'] = 'NO'
          end
        end
      end
    end

    ```


4)  Run below command to install the SDK to your project .
        
        $ pod install --repo-update



5)  Open your project using the generated *.xcworkspace file.


>  ###   **Note:** If you are new to CocoaPods, go to [CocoaPods](https://cocoapods.org/) to learn how to install it.


Make sure to always open the Xcode workspace instead of the project file when building your project:


```
open YourTargetName.xcworkspace
```

6) Make sure to disable bitcode for your project: Go to your project's settings and find the **Build settings** tab, check **All** and search for **bitcode**, then set it to **No**.


### Setup Info.plist

>  *Since iOS 10, it's mandatory to add before you access privacy-sensitive data like Camera, Photo Library, and so on, you must ask for the authorization, or your app will crash when you access them.*

Open the file in your project named info.plist, right click it, opening as Source Code, paste this code below to it. Or you can open info.plist as Property List by default, click the add button, Xcode will give you the suggest completions while typing Privacy - with the help of keyboard and

Remember to write your description why you ask for this authorization, between ```<string>``` and ```</string>```, or your app will be rejected by apple:
```
<!-- Camera -->
<key>NSCameraUsageDescription</key>
<string>$(PRODUCT_NAME) use camera to send photo</string>

<!-- Photo Library -->
<key>NSPhotoLibraryUsageDescription</key>
<string>$(PRODUCT_NAME) send photo/video to agent</string>

```

## Setup and installation guide

* Our [installation guide](https://developer.acquire.io/v/2.0.0/sdk/ios/sdk-setup-guide/integration-guide-lite) contains full setup and initialization instructions.


* Please contact us on [AcquireIO Support](https://acquire.io) with any questions you may have, we're only a message away!
