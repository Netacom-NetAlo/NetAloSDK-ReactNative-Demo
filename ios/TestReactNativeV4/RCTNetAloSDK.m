
#import "RCTNetAloSDK.h"
#import "AppDelegate.h"
#import "TestReactNativeV4-Swift.h"

@interface RCTNetAloSDK()

@end

@implementation RCTNetAloSDK

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

+ (BOOL)requiresMainQueueSetup
{
    return YES;
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(setUser: (NSString *) userId
                  session: (NSString *)session
                  avatarId: (NSString *)avatarId
                  fullName: (NSString *)fullName
                  phoneNumber: (NSString *)phoneNumber
                  canCreateGroup: (NSNumber * _Nonnull)canCreateGroup)
{
  NSLog(@"%@", userId);
  NSLog(@"%@", session);
  NSLog(@"%@", avatarId);
  NSLog(@"%@", fullName);
  NSLog(@"%@", phoneNumber);
  NSLog([canCreateGroup boolValue] ? @"Yes" : @"No");
  [AppDelegate.sharedInstance.sdk setUserWithUserId:[userId integerValue] fullName:fullName userSession:session avatarId:avatarId phoneNumber:phoneNumber canCreateGroup:[canCreateGroup boolValue]];
}

RCT_EXPORT_METHOD(showListConversations)
{
  UIViewController *rootVC = UIApplication.sharedApplication.keyWindow.rootViewController;
  UIViewController *vc = [AppDelegate.sharedInstance.sdk buildConversationViewController];
  UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:vc];
  [navigation setNavigationBarHidden:YES];
  [navigation setModalPresentationStyle:UIModalPresentationFullScreen];
  [rootVC presentViewController:navigation animated:YES completion:nil];
}

RCT_EXPORT_METHOD(showChatWithUser: (NSString *) userId
                  avatarId: (NSString *)avatarId
                  fullName: (NSString *)fullName
                  phoneNumber: (NSString *)phoneNumber)
{
  
  MockNetAloUser *user = [[MockNetAloUser alloc] initWithId:[userId integerValue] phoneNumber:phoneNumber email:@"" fullName:fullName avatarUrl:avatarId session:@"" canCreateGroup:NO];
  UIViewController *rootVC = UIApplication.sharedApplication.keyWindow.rootViewController;
  UIViewController *vc = [AppDelegate.sharedInstance.sdk buildChatViewController:user type:3];

  UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:vc];
  [navigation setNavigationBarHidden:YES];
  [navigation setModalPresentationStyle:UIModalPresentationFullScreen];
  [rootVC presentViewController:navigation animated:YES completion:nil];
}

RCT_EXPORT_METHOD(showChatWithPhone: (NSString *) phoneNumber)
{
  UIViewController *vc = [AppDelegate.sharedInstance.sdk buildChatViewControllerWithPhoneNumber:phoneNumber];
  
  if (vc != nil) {
    UIViewController *rootVC = UIApplication.sharedApplication.keyWindow.rootViewController;
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:vc];
    [navigation setNavigationBarHidden:YES];
    [navigation setModalPresentationStyle:UIModalPresentationFullScreen];
    [rootVC presentViewController:navigation animated:YES completion:nil];
  }
}

RCT_EXPORT_METHOD(openChatWithUser: (NSString *)userId
                  fullName: (NSString *)fullName)
{
  
  MockNetAloUser *user = [[MockNetAloUser alloc] initWithId:[userId integerValue] phoneNumber:@"" email:@"" fullName:fullName avatarUrl:@"" session:@"" canCreateGroup:NO];
  UIViewController *rootVC = UIApplication.sharedApplication.keyWindow.rootViewController;
  UIViewController *vc = [AppDelegate.sharedInstance.sdk buildChatViewController:user type:3];

  UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:vc];
  [navigation setNavigationBarHidden:YES];
  [navigation setModalPresentationStyle:UIModalPresentationFullScreen];
  [rootVC presentViewController:navigation animated:YES completion:nil];
}


@end
  
