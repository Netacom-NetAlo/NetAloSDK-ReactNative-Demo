package com.testreactnativev3;

import android.app.Application;
import android.content.Context;

import androidx.work.Configuration;
import androidx.work.Configuration.Builder;
import androidx.work.Configuration.Provider;

import com.facebook.react.ReactApplication;
import com.facebook.react.ReactNativeHost;
import com.facebook.react.shell.MainReactPackage;
import com.facebook.soloader.SoLoader;
import com.netacom.full.ui.sdk.NetAloSDK;
import com.netacom.full.ui.sdk.NetAloSdkCore;
import com.netacom.lite.entity.ui.theme.NeTheme;
import com.netacom.lite.sdk.AccountKey;
import com.netacom.lite.sdk.AppID;
import com.netacom.lite.sdk.AppKey;
import com.netacom.lite.sdk.SdkConfig;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.List;

import javax.inject.Inject;

import dagger.hilt.android.HiltAndroidApp;
import io.realm.Realm;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.internal.Intrinsics;

@HiltAndroidApp
public final class MainApplication extends Application implements ReactApplication, Provider {
    @Inject
    public NetAloSdkCore netAloSdkCore;
    private final ReactNativeHost mReactNativeHost = new ReactNativeHost(this) {
        public boolean getUseDeveloperSupport() {
            return BuildConfig.DEBUG;
        }

        @NotNull
        protected List getPackages() {
            return CollectionsKt.listOf(new MainReactPackage(), new NetAloSdkPackage());
        }

        @NotNull
        protected String getJSMainModuleName() {
            return "index";
        }
    };
    private final SdkConfig sdkConfig;
    private final NeTheme sdkTheme;

    @NotNull
    public final NetAloSdkCore getNetAloSdkCore() {
        NetAloSdkCore netAloSdkCore = this.netAloSdkCore;
        if (netAloSdkCore == null) {
            Intrinsics.throwUninitializedPropertyAccessException("netAloSdkCore");
        }

        return netAloSdkCore;
    }

    public final void setNetAloSdkCore(@NotNull NetAloSdkCore netAloSdkCore) {
        this.netAloSdkCore = netAloSdkCore;
    }

    @NotNull
    public ReactNativeHost getReactNativeHost() {
        return this.mReactNativeHost;
    }

    @NotNull
    public Configuration getWorkManagerConfiguration() {
        Builder builder = new Builder();
        NetAloSdkCore netAloSdkCore = this.netAloSdkCore;
        if (netAloSdkCore == null) {
            Intrinsics.throwUninitializedPropertyAccessException("netAloSdkCore");
        }

        Configuration configuration = builder.setWorkerFactory(netAloSdkCore.getWorkerFactory()).build();
        Intrinsics.checkNotNullExpressionValue(configuration, "Configuration.Builder()\n…ory)\n            .build()");
        return configuration;
    }

    protected void attachBaseContext(@Nullable Context base) {
        super.attachBaseContext(base);
        Realm.init(this);
    }

    public void onCreate() {
        super.onCreate();
        SoLoader.init(this, false);
        NetAloSDK netAloSDK = NetAloSDK.INSTANCE;
        Application application = this;
        NetAloSdkCore netAloSdkCore = this.netAloSdkCore;
        if (netAloSdkCore == null) {
            Intrinsics.throwUninitializedPropertyAccessException("netAloSdkCore");
        }
        netAloSDK.initNetAloSDK(application, netAloSdkCore, this.sdkConfig, this.sdkTheme);
    }

    public MainApplication() {
        int appId = AppID.NETALO_DEV;
        String appKey = AppKey.NETALO_DEV;
        String accountKey = AccountKey.NETALO_DEV;
        boolean isSyncContact = false;
        boolean hidePhone = false;
        boolean hideCreateGroup = false;
        boolean hideAddInfoInChat = false;
        boolean hideInfoInChat = false;
        boolean hideCallInChat = false;
        String classMainActivity = MainActivity.class.getName();
        this.sdkConfig = new SdkConfig(appId, appKey, accountKey, classMainActivity, isSyncContact, hidePhone, hideCreateGroup, hideAddInfoInChat, hideInfoInChat, hideCallInChat);
        this.sdkTheme = new NeTheme("#00B14F", "#D6F3E2", "#683A00", "#00B14F");
    }
}
