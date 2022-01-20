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
  // const [text, onChangeText] = React.useState("Useless Text");
  const [isProduction, setProduction] = useState(true);
  const [isSelect, setIsSelect] = useState(false);
  const [shouldShowA, setShouldShowA] = useState(false);
  const [shouldShowB, setShouldShowB] = useState(false);
  // OneSignal.setLogLevel(6, 0);
  // OneSignal.setAppId("9ace9559-83bc-4a60-a2df-f297bbf16a42");

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <View style={styles.container}>
        <Button style={[styles.button]} title="Back" onPress={() => { setIsSelect(false) }} />
        <Text style={styles.bigtitle}>NetAloSDK Demo React Native</Text>
        <View style={styles.marginTitle} />
        <TouchableOpacity
          style={[styles.button]}
          onPress={() => {
            NetAloSDK.setDomainLoadAvatarNetAloSdk("");
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
                  isProduction ? "281474977694873" : "281474977694873",
                  isProduction ? "4d5c69aa059d04b761ab6a0eb985b74b7779e40c" : "4d5c69aa059d04b761ab6a0eb985b74b7779e40c",
                  "T111",
                  "Attachments/f91f5ef2-fa03-4d73-b549-60b6ca3c90a0_332CF1D4-8681-4EAF-9EC7-5BB42E8AF5EF.jpg",
                  "XX",
                  "+84101000111",
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
                "281474977724836",
                "G20",
                "pFz0jhyeUzamyXcRx2dXkWUYApADL3Hcr2y6_nrCEV0qhblqq1Rzn4wyMxu2nqnH",
                "aaa@gmail.com",
                "+84101000020"
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
                "281474977724836",
                "G20",
                "pFz0jhyeUzamyXcRx2dXkWUYApADL3Hcr2y6_nrCEV0qhblqq1Rzn4wyMxu2nqnH",
                "aaa@gmail.com",
                "+84101000020"
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
