import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ads/banner_ads_4.dart';
import '../screens/home_screen.dart';
import '../settings/app_settings.dart';
import '../ads/ads_initial.dart';
import '../api/firebase_api.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  static String route = '/notification-screen';

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> _notifications = [];

  @override
  void initState() {
    loadNotifications();
    super.initState();
  }

  Future<void> loadNotifications() async {
    List<Map<String, dynamic>> fetchedNotifications =
        await FireBaseApi().getNotificationsFromFirestore();
    setState(() {
      _notifications = fetchedNotifications;
    });
    debugPrint(
        '..............load................:    ${_notifications.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint('Building widget...');
    Future.delayed(Duration.zero, () => Ads().loadAd1());

    //     RemoteMessage message =
    //     ModalRoute.of(context)!.settings.arguments as RemoteMessage;

    if (_notifications.isEmpty) {
      return const MyHomePage();
    }
    double height = MediaQuery.of(context).size.height;
    return AppSettings.scaffoldAppBar(
      context,
      Stack(
        children: [
          SizedBox(
            height: height,
            child: ListView.separated(
              padding: const EdgeInsets.all(10),
              separatorBuilder: (__, _) => const Divider(
                height: 8,
                endIndent: 30,
                indent: 30,
              ),
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> notification = _notifications[index];
                return ListTile(
                  title: Text(
                    notification['body'] ??
                        notification.remove(
                          notification,
                        ),
                    textAlign: AppSettings.center,
                    style: AppSettings.textStyleMessage(23),
                  ),
                  onTap: () {
                    final bodyText = notification['body'];
                    final scaffold = ScaffoldMessenger.of(context);
                    if (bodyText != null) {
                      Clipboard.setData(ClipboardData(text: bodyText));
                      scaffold.hideCurrentSnackBar();
                      scaffold.showSnackBar(
                        const SnackBar(
                          content: Text(
                            'تم نسخ النص إلى الحافظة',
                            textAlign: AppSettings.center,
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
          const BannerAds4()
        ],
      ),
    );
  }
}
