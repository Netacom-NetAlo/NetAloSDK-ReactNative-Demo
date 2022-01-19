#import "AppDelegate.h"

#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

#ifdef FB_SONARKIT_ENABLED
#import <FlipperKit/FlipperClient.h>
#import <FlipperKitLayoutPlugin/FlipperKitLayoutPlugin.h>
#import <FlipperKitUserDefaultsPlugin/FKUserDefaultsPlugin.h>
#import <FlipperKitNetworkPlugin/FlipperKitNetworkPlugin.h>
#import <SKIOSNetworkPlugin/SKIOSNetworkAdapter.h>
#import <FlipperKitReactPlugin/FlipperKitReactPlugin.h>

static void InitializeFlipper(UIApplication *application) {
  FlipperClient *client = [FlipperClient sharedClient];
  SKDescriptorMapper *layoutDescriptorMapper = [[SKDescriptorMapper alloc] initWithDefaults];
  [client addPlugin:[[FlipperKitLayoutPlugin alloc] initWithRootNode:application withDescriptorMapper:layoutDescriptorMapper]];
  [client addPlugin:[[FKUserDefaultsPlugin alloc] initWithSuiteName:nil]];
  [client addPlugin:[FlipperKitReactPlugin new]];
  [client addPlugin:[[FlipperKitNetworkPlugin alloc] initWithNetworkAdapter:[SKIOSNetworkAdapter new]]];
  [client start];
}
#endif

@implementation AppDelegate

+ (AppDelegate *)sharedInstance {
  return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

/*
 Init Netalo SDKs and config parameters
 Description enviroment:
  - testing    = 1
  - production = 2
 */
- (instancetype)init
{
  self = [super init];
  if (self) {
    NetaloConfiguration *config = [[NetaloConfiguration alloc]
                                  initWithEnviroment:1
                                  appId:1
                                  appKey:@"appkey"
                                  accountKey:@"11"
                                  appGroupIdentifier:@"group.vn.netacom.netalo-dev"
                                  userProfileUrl:@"abc.vn"
                                  allowCustomUsername:NO
                                  forceUpdateProfile:YES
                                  allowCustomProfile:NO
                                  allowSetUserProfileUrl:NO
                                  allowAddContact:YES
                                  allowBlockContact:YES
                                  isVideoCallEnable:YES
                                  isVoiceCallEnable:YES
                                  allowLocationEnable:YES
                                  allowTrackingUsingSDK:NO
                                  enableUserStatusInChat:YES
                                  allowTrackingBadgeNumber:NO];
    
   
    _sdk = [[NetAloFull alloc] initWithConfig:config];

  }
  
  return self;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  __weak typeof(self) weakSelf = self;
  
  [_sdk initialize:^(BOOL status) {
    RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];
    RCTRootView *rootView = [[RCTRootView alloc]
                             initWithBridge:bridge
                             moduleName:@"TestReactNativeV4"
                             initialProperties:nil];
    rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
    [weakSelf.sdk buildSDKModule];

    weakSelf.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIViewController *rootViewController = [UIViewController new];
    rootViewController.view = rootView;
    weakSelf.window.rootViewController = rootViewController;
    [weakSelf.window makeKeyAndVisible];
  }];

  BOOL success = [_sdk application:application didFinishLaunchingWithOptions:launchOptions];
  return success;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
  [_sdk application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  [_sdk applicationDidBecomeActive:application];
}

- (void)applicationWillTerminate:(UIApplication *)application {
  [_sdk applicationWillTerminate:application];
}

- (void)applicationWillResignActive:(UIApplication *)application {
  [_sdk applicationWillResignActive:application];
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

@end
