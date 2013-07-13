# Game Closure DevKit Plugin: LeadBolt

LeadBolt support is still in progress.  In the meantime you can use this plugin as
a starting point in case you want to integrate it yourself.  Right now only the
Android platform is working and only for analytics it does not show advertising.

## Usage

Create a publisher account with LeadBolt and create a new application.  Download the SDK JAR file and rename it to `leadbolt.jar` and put it in your game's root folder next to your `manifest.json` file.

Install the plugin with `basil install leadbolt`.

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
		"leadBoltPackage": "com.qcbcfhovhver"
	},
~~~

You can test for successful integration on the LeadBolt website.
