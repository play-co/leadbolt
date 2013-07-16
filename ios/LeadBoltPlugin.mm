#import "LeadBoltPlugin.h"

@implementation LeadBoltPlugin

// The plugin must call super dealloc.
- (void) dealloc {
	self.myAdController = nil;

	[super dealloc];
}

// The plugin must call super init.
- (id) init {
	self = [super init];
	if (!self) {
		return nil;
	}

	self.myAdController = nil;

	return self;
}

- (void) initializeWithManifest:(NSDictionary *)manifest appDelegate:(TeaLeafAppDelegate *)appDelegate {
	@try {
		NSDictionary *ios = [manifest valueForKey:@"ios"];
		NSString *leadBoltSectionId = [ios valueForKey:@"leadBoltSectionId"];

		NSLog(@"{leadBolt} Initializing with manifest leadBoltSectionId: '%@'", leadBoltSectionId);

		self.myAdController = [LeadboltOverlay createAdWithSectionid:leadBoltSectionId view:appDelegate.tealeafViewController.view];

		/*
		 Setting setLocationControl to 1, will enable you to get the GPS location
		 of the user, but will pop-up a warning to the users and they can decline
		 sending the data
		 */
		[self.myAdController setLocationControl:@"0"];

		if (appDelegate.gameSupportsLandscape) {
			[self.myAdController setLandscapeMode:@"1"];
		}
	}
	@catch (NSException *exception) {
		NSLog(@"{leadBolt} Failure to get ios:leadBoltSectionId from manifest file: %@", exception);
	}
}

- (void) showInterstitial:(NSDictionary *)jsonObject {
	@try {
		NSLOG(@"{leadBolt} Showing interstitial");

		[self.myAdController loadAd];
	}
	@catch (NSException *exception) {
		NSLOG(@"{leadBolt} Exception while processing event: ", exception);
	}
}

@end
