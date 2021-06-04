package com.testreactnativev3

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.netacom.base.chat.logger.Logger
import com.netacom.full.ui.sdk.NetAloSDK
import com.netacom.lite.entity.ui.user.NeUser

class NetAloSdkModule internal constructor(private var reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {
    override fun getName(): String {
        return "NetAloSDK"
    }

    override fun getConstants(): Map<String, Any>? {
        return HashMap()
    }

    @ReactMethod
    fun setUser(userId: String?, token: String?, avatar: String?, phone: String?, email: String?) {
        Logger.e("setNetAloUser=$userId, token=$token")
        NetAloSDK.setNetAloUser(NeUser(id = userId?.toLong() ?: 0L, token = token))
    }

    @ReactMethod
    fun showListConversations() {
        Logger.e("openChatConversation")
        NetAloSDK.openNetAlo(reactContext.applicationContext)
    }

    @ReactMethod
    fun openChatWithUser(userId: String?, token: String?) {
        Logger.e("openChatWithUser=$userId, token=$token")
        NetAloSDK.openNetAloSDK(reactContext.applicationContext, NeUser(id = userId?.toLong() ?: 0L, token = token))
    }
}