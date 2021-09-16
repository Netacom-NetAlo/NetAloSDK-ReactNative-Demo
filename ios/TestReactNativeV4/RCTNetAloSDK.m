
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
                  token: (NSString *)token
                  fullName: (NSString *)fullName
                  avatarId: (NSString *)avatarId
                  email: (NSString *)email
                  phoneNumber: (NSString *)phoneNumber
                  isAdmin: (NSNumber * _Nonnull)isAdmin)
{
  NSLog(@"%@", userId);
  NSLog(@"%@", token);
  NSLog(@"%@", avatarId);
  NSLog(@"%@", fullName);
  NSLog(@"%@", phoneNumber);
  NSLog([isAdmin boolValue] ? @"Yes" : @"No");
  [AppDelegate.sharedInstance.sdk setUserWithUserId:[userId integerValue] fullName:fullName userSession:token avatarId:avatarId phoneNumber:phoneNumber canCreateGroup:[isAdmin boolValue]];
}

RCT_EXPORT_METHOD(showListConversations: (NSNumber * _Nonnull)isAdmin
                  groupTypes: (NSArray *)groupTypes)
{
  // GroupTypes:
  //case unknown        = 0     // Due to server define
  //case privateGroup   = 1     // Secret group
  //case group          = 2     // Group more than 1vs1
  //case publicGroup    = 3     // The chat conversation 1vs1
  //case officalAccount = 5     // Offical Account
  UIViewController *rootVC = UIApplication.sharedApplication.keyWindow.rootViewController;
  UIViewController *vc = [AppDelegate.sharedInstance.sdk
                          buildConversationViewControllerWithCanCreateGroup:[isAdmin boolValue]
                          filterGroupTypes:groupTypes];
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

RCT_EXPORT_METHOD(logOut)
{
//  [AppDelegate.sharedInstance.sdk logout];
}

RCT_EXPORT_METHOD(setDomainLoadAvatarNetAloSdk: (NSString *)domain)
{
  [AppDelegate.sharedInstance.sdk setUserProfileUrl:domain];
}


@end
  
