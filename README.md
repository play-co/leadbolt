# Game Closure DevKit Plugin: LeadBolt

## Usage

Install the plugin with `basil install leadbolt`.

Download your game's LeadBolt .jar file and drop it into the devkit/addons/leadbolt/android directory as "leadbolt.jar", as in this example:

~~~
├── README.md
├── android
│   ├── LeadBoltPlugin.java
│   ├── config.json
│   ├── leadbolt.jar  <-- Insert your JAR file here
│   ├── manifest.xml
│   └── manifest.xsl
└── ios
    └── config.json
~~~

Include it in the `manifest.json` file under the "addons" section for your game:

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
		"LeadBoltPackage": "com.qcbcfhovhver"
	},
~~~

You can test for successful integration on the LeadBolt website.

