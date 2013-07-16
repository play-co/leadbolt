//
//  LeadboltOverlay.h
//  Leadbolt
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LeadboltOverlay : NSObject<UIWebViewDelegate>

// Initialize
+(LeadboltOverlay*) createAdWithSectionid:(NSString*)sectionid view:(UIView*)view;

// For Quick Start Ads
-(void) loadStartAd:(NSString *)notificationId;

// For Display Ads
-(void) loadAd;
-(void) destroyAd;
-(void) pauseAd;
-(void) resumeAd;
-(void) setLandscapeMode:(NSString *)newMode;
-(void) setAdditionalDockingMargin:(NSNumber *)newmargin;

// For Audio Ads
-(void) loadAudioAd;
-(void) shakeMotionStarted;
-(void) shakeMotionEnded;

// For Local Notification Ads
-(void) loadNotification;
-(void) notificationLoaded:(UILocalNotification *)notif;

// For Opt-in/EULA
-(void) loadOptin;

// General SDK methods
-(void) setLocationControl:(NSString *)newlocationcontrol;
-(void) setTokens:(NSDictionary *) newtokens;
-(void) setSubid:(NSString *) newsubid;


/// Deprecated methods
-(void)setSectionid:(NSString *) newsectionid __attribute__((deprecated));
-(void)setAdWebView:(UIWebView *) newwebview __attribute__((deprecated));
-(void)setCloseBar:(UIToolbar *) newclosebar __attribute__((deprecated));
-(void)setFooterBar:(UIToolbar *) newfooterbar __attribute__((deprecated));
-(void)setClickCloseBar:(UIToolbar *) newclickclosebar __attribute__((deprecated));
-(void)setClickFooterBar:(UIToolbar *) newclickfooterbar __attribute__((deprecated));
-(void)setMask:(UIView *) newmask __attribute__((deprecated));



@end
