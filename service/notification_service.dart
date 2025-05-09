import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void sendPushNotification(String title, String body) {
    _firebaseMessaging.subscribeToTopic("notifications");
  }
}