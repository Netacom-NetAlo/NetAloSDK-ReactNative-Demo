 import React, { Component, useState } from "react";
 import { NativeModules } from 'react-native';
 import {
   StyleSheet,
   Text,
   SafeAreaView,
   View,
   Button,
   TouchableOpacity,
 } from "react-native";
 const { NetAloSDK } = NativeModules;

 const App = () => {
   const [shouldShowA, setShouldShowA] = useState(false);
   const [shouldShowB, setShouldShowB] = useState(false);
   // Call Kafka add line in firebase Listener.
   // NetAloSDK.initFirebase(remoteMessage);
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
                   "2814749772832149",
                   "1c5632c5dcdc339fe7478f1bd4a3f3216827ade3",
                   "a6hIg_MRfWKSPeAXkkxAjA6coypt1y6j1KtJAkbd9k_E2w46wZuU4mbhNvA4Uzdl",
                   "XX",
                   "+84969143732",
                   false
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
                   "2814749772693227",
                   "777011f136b8edb137e92694b671190c174d8d7a",
                   "a6hIg_MRfWKSPeAXkkxAjA6coypt1y6j1KtJAkbd9k_E2w46wZuU4mbhNvA4Uzdl",
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
                 "2814749772832149",
                 "1c5632c5dcdc339fe7478f1bd4a3f3216827ade3"
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
                 "2814749772693227",
                 "777011f136b8edb137e92694b671190c174d8d7a"
               )
             }
           >
             <Text style={styles.title}>Open Chat With User</Text>
           </TouchableOpacity>
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
 });
 
 export default App;
 