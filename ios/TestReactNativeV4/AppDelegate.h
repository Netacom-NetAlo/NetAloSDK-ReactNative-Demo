#import <React/RCTBridgeDelegate.h>
#import <UIKit/UIKit.h>
#import <NetaloUISDK/NetaloUISDK-Swift.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, RCTBridgeDelegate, NetaloUIDelegate>

+ (AppDelegate *) sharedInstance;
@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) NetaloUISDK *sdk;

@end
