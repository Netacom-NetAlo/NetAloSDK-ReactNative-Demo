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
  const [isSelect, setIsSelect] = useState(false);
  const [shouldShowA, setShouldShowA] = useState(false);
  const [shouldShowB, setShouldShowB] = useState(false);
  OneSignal.setLogLevel(6, 0);
  OneSignal.setAppId("9ace9559-83bc-4a60-a2df-f297bbf16a42");

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <View style={styles.container}>
        <Button style={[styles.button]} title="Back" onPress={() => { setIsSelect(false) }} />
        <Text style={styles.bigtitle}>NetAloSDK Demo React Native</Text>
        <View style={styles.marginTitle} />
        <TouchableOpacity
          style={[styles.button]}
          onPress={() => {
            NetAloSDK.setDomainLoadAvatarNetAloSdk("https://api-uat.wellspringsaigon.edu.vn");
          }}>
          <Text style={styles.title}>Init Config URL Avatar</Text>
        </TouchableOpacity>
        {!isSelect ? (
          <View>
            <View style={styles.margin} />
            <Text>NetAloSDK Demo Application, Please select user:</Text>
            <View style={styles.marginButton} />
            <TouchableOpacity
              style={[styles.button]}
              onPress={() => {
                NetAloSDK.setUser(
                  isProduction ? "3096224744879971" : "3096224744861880",
                  isProduction ? "dd2afde0c67e1ec276d7110ece8078e95c7417f9" : "30800694eff3b59a05141b12ea1345df3e295e68",
                  "Trần Bảo Ngân",
                  "Attachments/f91f5ef2-fa03-4d73-b549-60b6ca3c90a0_332CF1D4-8681-4EAF-9EC7-5BB42E8AF5EF.jpg",
                  "XX",
                  "+84969143732",
                  true
                );
                setIsSelect(true);
                setShouldShowA(false);
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
                  isProduction ? "3096224744879965" : "3096224744861878",
                  isProduction ? "2ec9983d9b5b80b462534ffc5c2c50132892f4bc" : "653e091fe8c837055d91d8434fb9f5cd70473cf7",
                  "Nguyễn Phú Hải Phong",
                  "Attachments/f91f5ef2-fa03-4d73-b549-60b6ca3c90a0_332CF1D4-8681-4EAF-9EC7-5BB42E8AF5EF.jpg",
                  "XX",
                  "+84969143732",
                  true
                );
                setIsSelect(true);
                setShouldShowA(!shouldShowA);
                setShouldShowB(false);
              }}
            >
              <Text style={styles.title}>Set User B</Text>
            </TouchableOpacity>
          </View>
        ) : null}
        <View style={styles.margin} />
        {isSelect && (shouldShowA || shouldShowB) ? (
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
        {isSelect && (shouldShowA || shouldShowB) ? (
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
        {isSelect && shouldShowA ? (
          <TouchableOpacity
            style={[styles.button]}
            onPress={() =>
              NetAloSDK.openChatWithUser(
                isProduction ? "3096224744879971" : "3096224744861880",
                "Trần Bảo Ngân",
                "Attachments/f91f5ef2-fa03-4d73-b549-60b6ca3c90a0_332CF1D4-8681-4EAF-9EC7-5BB42E8AF5EF.jpg",
                "toan@gmail.com",
                "0333332093"
              )
            }
          >
            <Text style={styles.title}>Open Chat With User</Text>
          </TouchableOpacity>
        ) : null}
        {isSelect && shouldShowB ? (
          <TouchableOpacity
            style={[styles.button]}
            onPress={() =>
              NetAloSDK.openChatWithUser(
                isProduction ? "3096224744879965" : "3096224744861878",
                "Nguyễn Phú Hải Phong",
                "Attachments/f91f5ef2-fa03-4d73-b549-60b6ca3c90a0_332CF1D4-8681-4EAF-9EC7-5BB42E8AF5EF.jpg",
                "toan@gmail.com",
                "0333332093"
              )
            } >
            <Text style={styles.title}>Open Chat With User</Text>
          </TouchableOpacity>
        ) : null}
        {isSelect && (shouldShowA || shouldShowB) ? (
          <View>
            <View style={styles.margin} />
            <TouchableOpacity
              style={[styles.button]}
              onPress={() => {
                NetAloSDK.logOut();
              }}>
              <Text style={styles.title}>LogOut</Text>
            </TouchableOpacity>
            <View style={styles.margin} />
          </View>
        ) : null}
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
