import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../main.dart';
import '../screens/notification_screen.dart';

@pragma('vm:entry-point')
Future<void> handleBackgroundMessage(RemoteMessage? message) async {
  debugPrint(message?.notification!.title);
  debugPrint(message?.notification!.body);
}

class FireBaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _fireStore = FirebaseFirestore.instance;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    debugPrint('....................Token.................: $fCMToken');
    initPushNotifications();
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    saveNotificationToFirestore(message);
    navigatorKey.currentState!
        .pushReplacementNamed(arguments: message, NotificationScreen.route);
  }

  Future<void> saveNotificationToFirestore(RemoteMessage? message) async {
    if (message == null) return;

    DocumentReference documentReference =
        await _fireStore.collection('notifications').add({
      'body': message.notification?.body ?? '',
    });

    String notificationId = documentReference.id;
    await documentReference.update({'id': notificationId});
  }

  Future<List<Map<String, dynamic>>> getNotificationsFromFirestore() async {
    final querySnapshot = await _fireStore.collection('notifications').get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  Future initPushNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onMessage.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  void deleteNotification(String? notificationId) async {
    if (notificationId != null) {
      await _fireStore.collection('notifications').doc(notificationId).delete();
    }
  }
}
