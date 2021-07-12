/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, { Component, useState } from "react";
import ReactNative from "react-native";
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

const { NetAloSDK } = ReactNative.NativeModules;

const App = () => {
  const [text, onChangeText] = React.useState("Useless Text");
  const [shouldShowA, setShouldShowA] = useState(false);
  const [shouldShowB, setShouldShowB] = useState(false);
  OneSignal.setLogLevel(6, 0);
  OneSignal.setAppId("9ace9559-83bc-4a60-a2df-f297bbf16a42");
  
  return (
    <SafeAreaView style={{ flex: 1 }}>
      <View style={styles.container}>
        <Text style={styles.bigtitle}>NetAloSDK Demo React Native</Text>
        <View style={styles.marginTitle} />
        {!shouldShowA && !shouldShowB ? (
          <View>
            <Text>NetAloSDK Demo Application, Please select user:</Text>
            <View style={styles.marginButton} />
            <TouchableOpacity
              style={[styles.button]}
              onPress={() => {
                NetAloSDK.setUser(
                  "281474977755108",
                  "9a0c2c258c4edb30ce63fa4c56070a681464e5d8",
                  "TestChangeUserNameA",
                  "a6hIg_MRfWKSPeAXkkxAjA6coypt1y6j1KtJAkbd9k_E2w46wZuU4mbhNvA4Uzdl",
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
                  "281474977755109",
                  "53fabd950b2514577aed89e42c5118d9aec13965",
                  "TestChangeUserNameB",
                  "338679d107904e0c77380ab0f2ea223c4af5fa4d",
                  "XX",
                  "+84969143732",
                  false
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
              onPress={() => NetAloSDK.showListConversations()}
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
                "281474977755109",
                "53fabd950b2514577aed89e42c5118d9aec13965"
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
                "281474977755108",
                "22529a03555a3bedccc92dd4b9f1ecf78bb75c12"
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

export default App;
