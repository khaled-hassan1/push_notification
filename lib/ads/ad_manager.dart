class AdManager {
  
  static bool isTest = false;

  static String bannerHome1 = isTest
      ? 'ca-app-pub-3940256099942544/6300978111' //test
      : 'ca-app-pub-4572535261538266/2933550403'; //real

  static String bannerHome4 = isTest
      ? 'ca-app-pub-3940256099942544/6300978111' //test
      : 'ca-app-pub-4572535261538266/4429614847'; //real

  static String interstitialAd1 = isTest
      ? 'ca-app-pub-3940256099942544/1033173712' //test
      : 'ca-app-pub-4572535261538266/4618167166'; //real

  static String interstitialAd2 = isTest
      ? 'ca-app-pub-3940256099942544/1033173712' //test
      : 'ca-app-pub-4572535261538266/7570003254'; //real
}
