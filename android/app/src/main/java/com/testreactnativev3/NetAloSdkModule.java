package com.testreactnativev3;

import android.content.Context;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.netacom.base.chat.logger.Logger;
import com.netacom.full.ui.sdk.NetAloSDK;
import com.netacom.lite.entity.socket.Call;
import com.netacom.lite.entity.ui.user.NeUser;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.HashMap;
import java.util.Map;

import kotlin.jvm.internal.Intrinsics;

public final class NetAloSdkModule extends ReactContextBaseJavaModule {
    private ReactApplicationContext reactContext;

    @NotNull
    public String getName() {
        return "NetAloSDK";
    }

    @Nullable
    public Map getConstants() {
        return (Map) (new HashMap());
    }

    @ReactMethod
    public final void setUser(@Nullable String userId, @Nullable String token, @Nullable String userName, @Nullable String avatar, @Nullable String email, @Nullable String phone, @Nullable Boolean isAdmin) {
        Logger.INSTANCE.e("setNetAloUser=" + userName + ", token=" + token, new Object[0]);
        NeUser neUser = new NeUser();
        long userID;
        if (userId != null) {
            userID = Long.parseLong(userId);
        } else {
            userID = 0L;
        }
        neUser.setId(userID);
        if (token != null) {
            neUser.setToken(token);
        }
        if (userName != null) {
            neUser.setUsername(userName);
        }
        if (avatar != null) {
            neUser.setAvatar(avatar);
        }
        if (phone != null) {
            neUser.setPhone(phone);
        }
        if (email != null) {
            neUser.setEmail(email);
        }
        if (isAdmin != null) {
           neUser.setAdmin(isAdmin);
        }
        NetAloSDK.INSTANCE.setNetAloUser(neUser);
    }

    @ReactMethod
    public final void showListConversations() {
        Logger.INSTANCE.e("openChatConversation", new Object[0]);
        Context context = this.reactContext.getApplicationContext();
        NetAloSDK.INSTANCE.openNetAlo(context, (NeUser) null, (Call) null, false);
    }

    @ReactMethod
    public final void openChatWithUser(@Nullable String userId, @Nullable String token) {
        Logger.INSTANCE.e("openChatWithUser=" + userId + ", token=" + token, new Object[0]);
        Context context = this.reactContext.getApplicationContext();
        Intrinsics.checkNotNullExpressionValue(context, "reactContext.applicationContext");
        NeUser neUser = new NeUser();
        long userID;
        if (userId != null) {
            userID = Long.parseLong(userId);
        } else {
            userID = 0L;
        }
        neUser.setId(userID);
        if (token != null) {
            neUser.setToken(token);
        }
        NetAloSDK.INSTANCE.openNetAloSDK(context, neUser);
    }

    @ReactMethod
    public final void finishSocket() {
        NetAloSDK.INSTANCE.finishSocket();
    }

    @ReactMethod
    public final void logOut() {
        NetAloSDK.INSTANCE.logOut();
    }

    public NetAloSdkModule(@NotNull ReactApplicationContext reactContext) {
        super(reactContext);
        Intrinsics.checkNotNullParameter(reactContext, "reactContext");
        this.reactContext = reactContext;
    }
}