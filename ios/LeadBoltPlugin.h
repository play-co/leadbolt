#import "PluginManager.h"
#import "sdk/LeadBoltOverlay.h"
#import "sdk/AppFireworks/AppTracker.h"

@interface LeadBoltPlugin : GCPlugin

@property (nonatomic, retain) LeadboltOverlay *myAdController;
@property (nonatomic, retain) UIView *view;
@property (nonatomic, retain) NSString *leadBoltSectionId;

@end

