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
	self.view = nil;
	self.leadBoltSectionId = nil;

	return self;
}

- (void) initializeWithManifest:(NSDictionary *)manifest appDelegate:(TeaLeafAppDelegate *)appDelegate {
	@try {
		NSDictionary *ios = [manifest valueForKey:@"ios"];
		self.leadBoltSectionId = [ios valueForKey:@"leadBoltSectionId"];
		NSString *appFireworksKey = [ios valueForKey:@"leadBoltFireworksKey"];
		self.view = appDelegate.tealeafViewController.view;

		NSLOG(@"{leadBolt} Initializing with manifest leadBoltSectionId: '%@' and fireworksKey: '%@'",
				self.leadBoltSectionId, appFireworksKey);

		[[NSNotificationCenter defaultCenter] addObserver:self
			selector:@selector(handleModuleFailed)
			name:@"onModuleFailed" object:@"AppFireworksNotification"];
		[[NSNotificationCenter defaultCenter] addObserver:self
			selector:@selector(handleModuleCached)
			name:@"onModuleCached" object:@"AppFireworksNotification"];
		[[NSNotificationCenter defaultCenter] addObserver:self
			selector:@selector(handleModuleClosed)
			name:@"onModuleClosed" object:@"AppFireworksNotification"];
		[AppTracker startSession:appFireworksKey];

		if (appDelegate.gameSupportsLandscape) {
			//[self.myAdController setLandscapeMode:@"1"];
			[AppTracker setLandscapeMode:YES];
		}

		// For AdFailed: - called when LeadBolt Ad cannot be loaded
		[[NSNotificationCenter defaultCenter] addObserver:self
			selector:@selector(handleLBEvent:)
			name:@"onAdFailed" object:nil];

		// For AdClosed: - called when user closes the App Ad
		[[NSNotificationCenter defaultCenter] addObserver:self
			selector:@selector(handleLBEvent:)
			name:@"onAdClosed" object:nil];

		// For AdCached: - called once the Ad is successfully cached on the
		// device after [ad loadAdToCache] has been called
		[[NSNotificationCenter defaultCenter] addObserver:self
			selector:@selector(handleLBEvent:)
			name:@"onAdCached" object:nil];
	}
	@catch (NSException *exception) {
		NSLOG(@"{leadBolt} Failure to get ios:leadBoltSectionId from manifest file: %@", exception);
	}
}

-(void)handleModuleFailed {
	NSLOG(@"{leadBolt} Module load failed");
	self.myAdController = [LeadboltOverlay createAdWithSectionid:self.leadBoltSectionId
		view:self.view];
	[self.myAdController loadAdToCache];
}

-(void)handleModuleCached {
	NSLOG(@"{leadBolt} module cached");
	[self sendToJS:@"LeadboltAdAvailable"];
}

-(void)handleModuleClosed {
	NSLOG(@"{leadBolt} module closed");
	[self sendToJS:@"LeadboltAdDismissed"];
}

- (void) cacheInterstitial:(NSDictionary *)jsonObject {
	[AppTracker loadModuleToCache:@"inapp" view:self.view];
}

- (void) showInterstitial:(NSDictionary *)jsonObject {
	NSLOG(@"{leadBolt} Showing interstitial");
	if(self.myAdController) {
		[self.myAdController loadAd];
		self.myAdController = nil;
	} else {
		[AppTracker loadModule:@"inapp" view:self.view];
	}
}

-(void)handleLBEvent:(NSNotification *)notif {
	if([notif.name isEqualToString:@"onAdFailed"]) {
		NSLOG(@"{leadBolt} ad failed");
		[self sendToJS:@"LeadboltAdNotAvailable"];
	}
	else if([notif.name isEqualToString:@"onAdClosed"]) {
		NSLOG(@"{leadBolt} ad closed");
		[self sendToJS:@"LeadboltAdDismissed"];
	}
	else if([notif.name isEqualToString:@"onAdCached"]) {
		NSLOG(@"{leadBolt} ad cached");
		[self sendToJS:@"LeadboltAdAvailable"];
	}
}

-(void) sendToJS:(NSString *)event {
	[[PluginManager get] dispatchJSEvent:[NSDictionary dictionaryWithObjectsAndKeys:
		event, @"name",
		nil]];
}
@end
