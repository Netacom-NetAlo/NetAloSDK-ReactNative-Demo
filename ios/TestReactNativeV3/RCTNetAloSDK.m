
#import "RCTNetAloSDK.h"
#import "AppDelegate.h"
#import "TestReactNativeV3-Swift.h"


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

RCT_EXPORT_METHOD(setUser: (int64_t) userId
                  session: (NSString *)session
                  avatarId: (NSString *)avatarId
                  fullName: (NSString *)fullName
                  phoneNumber: (NSString *)phoneNumber)
{
  [AppDelegate.sharedInstance.sdk setUserWithUserId:userId fullName:fullName userSession:session avatarId:avatarId phoneNumber:phoneNumber];
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

RCT_EXPORT_METHOD(showChatWithUser: (int64_t) userId
                  avatarId: (NSString *)avatarId
                  fullName: (NSString *)fullName
                  phoneNumber: (NSString *)phoneNumber)
{
  
  MockNetAloUser *user = [[MockNetAloUser alloc] initWithId:userId phoneNumber:phoneNumber email:@"" fullName:fullName avatarUrl:avatarId session:@""];
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

@end
  
