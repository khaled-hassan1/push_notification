import 'package:flutter/material.dart';

class AppSettings {
  static const BoxFit cover = BoxFit.cover;
  static const TextAlign center = TextAlign.center;
  static const TextAlign right = TextAlign.right;
  static const FontWeight bold = FontWeight.bold;
  static const Color red = Colors.red;
  static const Icon delete = Icon(Icons.delete, color: Colors.white);
  static BorderRadius borderRadius = BorderRadius.circular(40);
  static const String assetName = 'assets/ic_launcher.png';
  static const Widget title = Text('🦋خواطر ورسائل');
  static TextStyle textStyleMessage(double fontSize) =>
      TextStyle(fontSize: fontSize, fontWeight: bold);
  static const MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center;
  static const TextStyle textStyle = TextStyle(
    fontSize: 25,
    fontWeight: bold,
  );

  static Widget scaffoldAppBar(BuildContext context, Widget body) => Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 226, 239),
      appBar: AppBar(
        toolbarHeight: 60,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: title,
      ),
      body: body);

  static Center body(Widget child) => Center(
        child: SingleChildScrollView(
          child: child,
        ),
      );

  static SizedBox sizedBox(double height) => SizedBox(height: height);
  static SizedBox sizedBox2(double height, double width, Widget child) =>
      SizedBox(
        height: height,
        width: width,
        child: child,
      );
  static EdgeInsets edgeInsetsOnly(double top, double right, double left) =>
      EdgeInsets.only(top: top, right: right, left: left);

  static Container container(Alignment alignment) => Container(
        color: AppSettings.red,
        alignment: alignment,
        padding: AppSettings.edgeInsetsOnly(0, 16.0, 16.0),
        child: AppSettings.delete,
      );
}
