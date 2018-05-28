# Space Pictures
This is an app that displays pictures from the NASA APOD API. It pulls their listing, allows you to submit your own pictures and stores all the data using Core Data. Note, that videos are not shown.

## Installation

To install this app:

1. Ensure you have cocoapods installed using:

        sudo gem install cocoapods
2. Install pods with:

        pod install
3. Open the app in XCode from the generated `Space Pictures.xcworkspace` and run

*Note: For mail submission to work, you must have installed the app on a real device, not using simulator*

## User Experience
The app is composed of three main screens:

### 1. Space Pictures
Space Picture screen occurs on load and is a UICollectionView of the pictures from the APOD API. It has pull to refresh and infinite scrolling capabilities and displays the newest photos first. You can tap pictures here to go to the detail screen, or tap the button in the top right to go to the apod submission screen.

### 2. Space Picture Detail
This screen is pushed onto the navigation controller when any cell in the space pictures screen is tapped. It shows extra details of the tapped picture returned from the APOD API.

### 3. APOD Submission (Mail Composer)
This is presented after pressing the APOD Submission button the top right of the Space Pictures Screen. This is an email submission where users can add their own space pictures to submit to NASA.