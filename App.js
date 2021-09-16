/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, { Component, useState } from "react";
import { NativeModules } from "react-native";
import OneSignal from 'react-native-onesignal';
import {
  StyleSheet,
  Text,
  SafeAreaView,
  View,
  Button,
  TouchableOpacity,
  TextInput
} from "react-native";

const { NetAloSDK } = NativeModules;

const App = () => {
  const [text, onChangeText] = React.useState("Useless Text");
  const [isProduction, setProduction] = useState(true);
  const [shouldShowA, setShouldShowA] = useState(false);
  const [shouldShowB, setShouldShowB] = useState(false);
  OneSignal.setLogLevel(6, 0);
  OneSignal.setAppId("9ace9559-83bc-4a60-a2df-f297bbf16a42");

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <View style={styles.container}>
        <Text style={styles.bigtitle}>NetAloSDK Demo React Native</Text>
        <View style={styles.marginTitle} />
        <TouchableOpacity
          style={[styles.button]}
          onPress={() => {
            NetAloSDK.setDomainLoadAvatarNetAloSdk("URL domain Avatar");
          }}>
          <Text style={styles.title}>Init Config URL Avatar</Text>
        </TouchableOpacity>
        {!shouldShowA && !shouldShowB ? (
          <View>
            <View style={styles.margin} />
            <Text>NetAloSDK Demo Application, Please select user:</Text>
            <View style={styles.marginButton} />
            <TouchableOpacity
              style={[styles.button]}
              onPress={() => {
                NetAloSDK.setUser(
                  isProduction ? "1407374889139870" : "3096224744861880",
                  isProduction ? "9ce5b30f0a2293b7af08174579fd841b0ab4dc7e" : "30800694eff3b59a05141b12ea1345df3e295e68",
                  "Trần Bảo Ngân",
                  "21070812405364",
                  "XX",
                  "+84969143732",
                  true
                );
                setShouldShowB(!shouldShowB);
              }}
            >
              <Text style={styles.title}>Set User A</Text>
            </TouchableOpacity>

            <View style={styles.margin} />
            <TouchableOpacity
              style={[styles.button]}
              onPress={() => {
                NetAloSDK.setUser(
                  isProduction ? "1407374883553294" : "3096224744861878",
                  isProduction ? "fe18990723e60652fe0c530e38d4373b9c4fdf5e" : "653e091fe8c837055d91d8434fb9f5cd70473cf7",
                  "Nguyễn Phú Hải Phong",
                  "21070812405325",
                  "XX",
                  "+84969143732",
                  true
                );
                setShouldShowA(!shouldShowA);
              }}
            >
              <Text style={styles.title}>Set User B</Text>
            </TouchableOpacity>
          </View>
        ) : null}

        <View style={styles.margin} />

        {shouldShowA || shouldShowB ? (
          <View>
            <TouchableOpacity
              style={[styles.button]}
              onPress={() => NetAloSDK.showListConversations(false, [1, 2, 3])}
            >
              <Text style={styles.title}>List Conversations Create Group</Text>
            </TouchableOpacity>
            <View style={styles.margin} />
          </View>
        ) : null}
        {shouldShowA || shouldShowB ? (
          <View>
            <TouchableOpacity
              style={[styles.button]}
              onPress={() => NetAloSDK.showListConversations(true, [1, 2, 3, 5])}
            >
              <Text style={styles.title}>Show List Conversations</Text>
            </TouchableOpacity>
            <View style={styles.margin} />
          </View>
        ) : null}
        {shouldShowA ? (
          <TouchableOpacity
            style={[styles.button]}
            onPress={() =>
              NetAloSDK.openChatWithUser(
                isProduction ? "1407374889139870" : "3096224744861880",
                "Trần Bảo Ngân"
              )
            }
          >
            <Text style={styles.title}>Open Chat With User</Text>
          </TouchableOpacity>
        ) : null}

        {shouldShowB ? (
          <TouchableOpacity
            style={[styles.button]}
            onPress={() =>
              NetAloSDK.openChatWithUser(
                isProduction ? "1407374883553294" : "3096224744861878",
                "Nguyễn Phú Hải Phong"
              )
            }
          >
            <Text style={styles.title}>Open Chat With User</Text>
          </TouchableOpacity>
        ) : null}
        <View style={styles.margin} />
        <TouchableOpacity
          style={[styles.button]}
          onPress={() => {
            NetAloSDK.logOut();
          }}>
          <Text style={styles.title}>LogOut</Text>
        </TouchableOpacity>
        <View style={styles.margin} />
        {/* <TouchableOpacity
              style={[styles.button]}
              onPress={() => {
                navigation.goBack()
              }}>
               <Text style={styles.title}>Back</Text>
            </TouchableOpacity> */}
      </View>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
  input: {
    height: 50,
    padding: 10,
    margin: 18,
    fontSize: 14,
    borderWidth: 1,
    borderRadius: 10,
    borderColor: "#ff9900",
    backgroundColor: "rgba(0,0,0,0)",
  },
  button: {
    fontSize: 22,
    height: 50,
    backgroundColor: "#ff9900",
    borderRadius: 10,
    paddingHorizontal: 20,
    alignItems: "center",
    justifyContent: "center",
  },
  title: {
    textAlign: "center",
    fontSize: 22,
    color: "#fff",
  },
  bigtitle: {
    fontSize: 30,
    color: "#ff9900",
    textAlign: "center",
  },
  margin: {
    height: 20,
  },
  marginTitle: {
    height: 100,
  },
  marginButton: {
    height: 10,
  },
  input: {
    height: 40,
    margin: 12,
    borderWidth: 1,
  },
});

function testConfigAvatarDomain() {
    NetAloSDK.setDomainLoadAvatarNetAloSdk('https://cdn.com/');
}

export default App;
