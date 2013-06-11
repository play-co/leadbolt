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

You can test for successful integration on the LeadBolt website.

