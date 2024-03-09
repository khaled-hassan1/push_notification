import 'package:flutter/material.dart';

import '../ads/banner_ads_1.dart';
import '../settings/app_settings.dart';
import '../ads/ads_initial.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
   Future.delayed(Duration.zero,() =>  Ads().loadAd2());
    return AppSettings.scaffoldAppBar(
        context,
        Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: AppSettings.edgeInsetsOnly(90, 0, 0),
              child: const Text(
                'انتظر الإشعار',
                style: AppSettings.textStyle,
              ),
            ),
            Container(
              margin: AppSettings.edgeInsetsOnly(50, 0, 0),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: AppSettings.borderRadius,
                child: AppSettings.sizedBox2(
                  300,
                  280,
                  const FadeInImage(
                    placeholder: AssetImage(
                      AppSettings.assetName,
                    ),
                    image: AssetImage(
                      AppSettings.assetName,
                    ),
                    fit: AppSettings.cover,
                  ),
                ),
              ),
            ),
            const BannerAds(),
          ],
        ));
  }
}
