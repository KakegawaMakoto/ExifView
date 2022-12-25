import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

class AdBanner extends StatelessWidget {
  const AdBanner({
    required this.size,// サイズは利用時に指定
  });
  final AdSize size;
  @override
  Widget build(BuildContext context) {
    // AndroidかiOSを前提とする
    final banner = BannerAd(
      // サイズ
        size: size,
        // 広告ユニットID
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-8178341167378513/3776996897'
            : 'ca-app-pub-8178341167378513/8203327066',
        // イベントのコールバック
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) => print('Ad loaded.'),
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            print('Ad failed to load: $error');
          },
          onAdOpened: (Ad ad) => print('Ad opened.$ad'),
          onAdClosed: (Ad ad) => print('Ad closed.$ad'),
        ),
        // リクエストはデフォルトを使う
        request: const AdRequest())
    // 表示を行うloadをつける
      ..load();
    // 戻り値はSizedBoxに包んで返す
    return SizedBox(
        width: banner.size.width.toDouble(),
        height: banner.size.height.toDouble(),
        child: AdWidget(ad: banner));
  }
}