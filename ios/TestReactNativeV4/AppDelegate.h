#import <React/RCTBridgeDelegate.h>
#import <UIKit/UIKit.h>
#import <NetAloFull/NetAloFull-Swift.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, RCTBridgeDelegate>

+ (AppDelegate *) sharedInstance;
@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) NetAloFull *sdk;

@end
