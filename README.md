# Game Closure DevKit Plugin: LeadBolt

This plugin adds support for [LeadBolt](http://www.leadbolt.com/) interstitial advertising on Android and iOS platforms.
This first uses Leadbolt Connect for direct deals and later falls back to the regular interstitials. It uses AppFireworks for Leadbolt connect.

## Usage

Create a publisher account with LeadBolt and create a new application.

### Android only:
Download the SDK JAR file and rename it to `leadbolt.jar` and put it in your game's root folder next to your `manifest.json` file.

Install the plugin by forking it in the addons directory.

Include the plugin in the `manifest.json` file under the "addons" section for your game:

~~~
"addons": [
	"leadbolt"
],
~~~

Also add the LeadBolt package name under the "android" section.  You can find
your package name on the SDK download page on the LeadBolt website next to the
JAR download link.

~~~
	"android": {
		"versionCode": 1,
		"icons": {
			"36": "resources/images/promo/icon36.png",
			"48": "resources/images/promo/icon48.png",
			"72": "resources/images/promo/icon72.png",
			"96": "resources/images/promo/icon96.png"
		},
		"leadBoltPackage": "com.qcbcfhovhver",
		"leadBoltSectionId": "227037220",
		"appFireworksKey": "thekeyfromthewebsite"
	},
~~~

~~~
	"ios": {
		"bundleID": "mmp",
		"appleID": "568975017",
		"version": "1.0.3",
		"icons": {
			"57": "resources/images/promo/icon57.png",
			"72": "resources/images/promo/icon72.png",
			"114": "resources/images/promo/icon114.png",
			"144": "resources/images/promo/icon144.png"
		},
		"leadBoltSectionId": "227037220",
		"appFireworksKey": "thekeyfromthewebsite"
	},
~~~

You can test for successful integration on the [LeadBolt website](http://www.leadbolt.com/).

Then you can edit your game JavaScript code to import the LeadBolt object:

~~~
import plugins.leadbolt.leadBolt as leadBolt;
~~~

Pre-load an interstitial with:

~~~
leadBolt.cacheInterstitial();
~~~

And use the `showInterstitial` method to show an ad:

~~~
leadBolt.showInterstitial();
~~~

Provides the following callbacks `leadBolt.onAdAvailable`, `leadBolt.onAdDismissed` and `leadBolt.onAdNotAvailable`
to know if the ad was cached, whether the ad was closed, or ad not available respectively.

Eg:

~~~
leadBolt.onAdAvailable = function {
	//ad available and cached
};
~~~

~~~
leadBolt.onAdNotAvailable = function {
	//ad not available
};
~~~

~~~
leadBolt.onAdDismissed = function {
	//ad closed, do next steps
};
~~~
