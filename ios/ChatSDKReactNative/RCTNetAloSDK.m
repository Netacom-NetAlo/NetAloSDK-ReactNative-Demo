
#import "RCTNetAloSDK.h"
#import "AppDelegate.h"

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
                  phoneNumber: (NSString *)phoneNumber)
{
  NSLog(@"%@", userId);
  NSLog(@"%@", token);
  NSLog(@"%@", avatarId);
  NSLog(@"%@", fullName);
  NSLog(@"%@", phoneNumber);
  
  NetAloUserHolder *user = [[NetAloUserHolder alloc]
                            initWithId:[userId integerValue]
                            phoneNumber:phoneNumber
                            email:@""
                            fullName:fullName
                            avatarUrl:avatarId
                            session:token];
  
  [AppDelegate.sharedInstance.sdk loginWithUser:user];
}

RCT_EXPORT_METHOD(showListConversations)
{
  [AppDelegate.sharedInstance.sdk showListGroupWithCompletion:^(NSError * _Nullable) {

  }];
}

RCT_EXPORT_METHOD(showChatWithUser: (NSString *) userId
                  avatarId: (NSString *)avatarId
                  fullName: (NSString *)fullName
                  phoneNumber: (NSString *)phoneNumber)
{
  [AppDelegate.sharedInstance.sdk
   
   showChatUserWith:[userId integerValue]
   phone:phoneNumber
   fullName:fullName
   email:NULL
   profileUrl:avatarId
   completion:^(NSError * _Nullable) {
    
  }];
}

RCT_EXPORT_METHOD(showChatWithPhone: (NSString *) phoneNumber)
{
  NSLog(@"showChatWithPhone");
}


 RCT_EXPORT_METHOD(showCallUserWith: (NSString *) userId
                   avatarId: (NSString *)avatarId
                   fullName: (NSString *)fullName
                   email: (NSString *)email
                   isVideoCall: (BOOL)isVideoCall
                   phoneNumber: (NSString *)phoneNumber)
 {
   [AppDelegate.sharedInstance.sdk showCallUserWith: [userId integerValue]
                                              phone: phoneNumber
                                           fullName: fullName
                                              email: email
                                         profileUrl: avatarId
                                        isVideoCall: isVideoCall
                                         completion:^(NSError * _Nullable) {
    
   }];
 }

RCT_EXPORT_METHOD(setLanguage: (NSString *) language)
{
  NSLog(@"setLanguage @%@", language);
  [AppDelegate.sharedInstance.sdk setLanguageWithLanguage:language];
}

RCT_EXPORT_METHOD(openChatWithUser: (NSString *)userId
                  fullName: (NSString *)fullName
                  avatarId: (NSString *)avatarId
                  email: (NSString *)email
                  phoneNumber: (NSString *)phoneNumber)
{
  [AppDelegate.sharedInstance.sdk
   showChatUserWith:[userId integerValue]
   phone:phoneNumber
   fullName:fullName
   email:email
   profileUrl:avatarId
   completion:^(NSError * _Nullable) {
    
  }];
}

RCT_EXPORT_METHOD(logOut)
{
  //Call this to logout sdk
  NSLog(@"Log out");
//  [AppDelegate.sharedInstance.sdk logout];
}

RCT_EXPORT_METHOD(setDomainLoadAvatarNetAloSdk: (NSString *)domain)
{
  [AppDelegate.sharedInstance.sdk setUserProfileUrlWith:domain];
}


@end
  
