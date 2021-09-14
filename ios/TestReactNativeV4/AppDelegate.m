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

- (instancetype)init
{
  self = [super init];
  if (self) {
    _sdk = [[NetaloUISDK alloc] initWithAppId:1 appKey:@"appkey" accountKey:@"11" appGroupIdentifier:@"group.vn.netacom.netalo-dev" enviroment:1];
    [_sdk addWithDelegate:self];
  }
  return self;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];
  RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
                                                   moduleName:@"TestReactNativeV4"
                                            initialProperties:nil];

  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  
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

// MARK: - SDK Delegates

- (UIViewController * _Nullable)getConversationViewController {
  return NULL;
}

- (void)openContact {
  
}

- (void)popTo:(UIViewController * _Nonnull)viewController {
  
}

- (void)presentWithViewController:(UIViewController * _Nonnull)viewController {
  [self.topViewController presentViewController:viewController animated:true completion:NULL];
}

- (void)pushWithViewController:(UIViewController * _Nonnull)viewController {
  [self.topViewController presentViewController:viewController animated:true completion:NULL];
}

- (void)sessionExpired {
  
}

- (void)switchToMainScreen {
  
}

- (UIViewController * _Nullable)topMostViewController {
  return self.topViewController;
}

- (void)updateStatusBarWithStyle:(UIStatusBarStyle)style {
  
}

- (void)updateThemeColor:(NSInteger)themeColor {
  
}

- (void)userDidLogout {
  
}

- (void)checkChatFunctionsWith:(NSString * _Nonnull)userId {
  
}

- (void)didPressedWithUrl:(NSString * _Nonnull)url {
  
}

- (void)didClose {
  
}

// MARK: - Utils
- (UIViewController *)topViewController{
  return [self topViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

- (UIViewController *)topViewController:(UIViewController *)rootViewController
{
  if ([rootViewController isKindOfClass:[UINavigationController class]]) {
    UINavigationController *navigationController = (UINavigationController *)rootViewController;
    return [self topViewController:[navigationController.viewControllers lastObject]];
  }
  if ([rootViewController isKindOfClass:[UITabBarController class]]) {
    UITabBarController *tabController = (UITabBarController *)rootViewController;
    return [self topViewController:tabController.selectedViewController];
  }
  if (rootViewController.presentedViewController) {
    return [self topViewController:rootViewController.presentedViewController];
  }
  return rootViewController;
}

@end
