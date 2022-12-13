import 'package:exifview/generated/l10n.dart';
import 'package:exifview/style/style.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:exif/exif.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? image;
  final picker = ImagePicker();

  dynamic pickedMake;
  dynamic pickedModel;
  dynamic pickedDateTime;
  dynamic pickedWidth;
  dynamic pickedLength;
  dynamic pickedExifWidth;
  dynamic pickedExifLength;
  dynamic pickedResolution;
  dynamic pickedResolutionUnit;
  dynamic pickedSoftware;
  dynamic pickedDateTimeOriginal;
  dynamic pickedShutterTime;
  dynamic pickedFNumber;
  dynamic pickedISOSpeedRatings;
  dynamic pickedExposureProgram;
  dynamic pickedWhiteBalance;

  //削除
  void clearimage() {
    setState(() {
      image = null;
    });
  }

  Future<void> getImageFromGallery() async {
    //画像選択
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    //Exif取得
    final tags =
        await readExifFromBytes(await File(pickedFile!.path).readAsBytes());

    pickedMake = tags["Image Make"].toString();
    pickedModel = tags["Image Model"].toString();
    pickedDateTime = tags["Image DateTime"].toString();
    pickedWidth = tags["Image ImageWidth"].toString();
    pickedLength = tags["Image ImageLength"].toString();
    pickedExifWidth = tags["EXIF ExifImageWidth"].toString();
    pickedExifLength = tags["EXIF ExifImageLength"].toString();
    pickedResolution = tags["Image XResolution"].toString();
    pickedResolutionUnit = tags["Image ResolutionUnit"].toString();
    pickedSoftware = tags["Image Software"].toString();
    pickedDateTimeOriginal = tags["EXIF DateTimeOriginal"].toString();
    pickedShutterTime = tags["EXIF ExposureTime"].toString();
    pickedFNumber = tags["EXIF FNumber"].toString();
    pickedISOSpeedRatings = tags["EXIF ISOSpeedRatings"].toString();
    pickedExposureProgram = tags["EXIF ExposureProgram"].toString();
    pickedWhiteBalance = tags["EXIF WhiteBalance"].toString();
    setState(() {
      image = File(pickedFile!.path);
      // pickedMake;
      // pickedModel;
      // pickedDateTime;
      // pickedWidth;
      // pickedLength;
      //pickedDateTime.isEmpty ? pickedDateTime : pickedDateTime.substring(0, 16).replaceAll(":", "/").replaceFirst("/", ":", 12);
    });
    for (final entry in tags.entries) {
      print("${entry.key}: ${entry.value}");
    }
    print("1${pickedLength}");
    print(pickedWidth.runtimeType);
  }

  //画像変更
  void addimage() {
    setState(() {
      clearimage();
      getImageFromGallery();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("ExifView")),
        backgroundColor: Colors.black38,
        leading: image != null
            ? IconButton(icon: Icon(Icons.clear), onPressed: clearimage)
            : null,
        actions: [
          if (image != null) IconButton(
              icon: Icon(Icons.add),
              onPressed: addimage)
          else Container(),
          //image != null ? IconButton(icon: Icon(Icons.check), onPressed: convertWidgetToImage) : Text(""),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          mainAxisAlignment: image == null
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            //画像の表示と選択
            image == null
                ? Column(
                  children: [
                    Image.asset("assets/images/imageIcon.png"),
                      Padding(
                        padding: const EdgeInsets.only(top:15),
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.image),
                          label: Text(S.of(context).SelectImage),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white, onPrimary: Colors.black),
                          onPressed: () {
                            getImageFromGallery();
                          },
                        ),
                      ),
                    ],
                )
                : Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      child: SizedBox(
                        height: 150,
                        child: Image.file(
                          image!,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
            Column(
              children: [
                image == null
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            //メーカー
                            ExifMake(),
                            //モデル
                            ExifModel(),
                            //撮影日時
                            ExifDateTimeOriginal(),
                            //シャッタースピード
                            ExifShutterTime(),
                            //F値
                            ExifFNumber(),
                            //ISO
                            ExifISOSpeedRatings(),
                            //撮影モード
                            ExifExposureProgram(),
                            //ホワイトバランス
                            ExifWhiteBalance(),
                            //ファイル変更日時
                            ExifDateTime(),
                            //ソフトウェア
                            ExifSoftware(),
                            //解像度単位
                            ExifResolutionUnit(),
                            //解像度
                            ExifResolution(),
                            //横幅
                            ExifWidth(),
                            //縦幅
                            ExifLength(),
                          ],
                        ),
                      )
              ],
            )
          ],
        )),
      ),
    );
  }

  //線を引く
  Widget LineItem() {
    return Divider(
      color: Colors.black38,
      thickness: 1,
    );
  }

  //メーカー
  ExifMake() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).Make, style: TextStyle(fontSize: titleFont),), pickedMake == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedMake, style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }

  //モデル
  ExifModel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).Model, style: TextStyle(fontSize: titleFont),), pickedModel == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedModel, style: TextStyle(fontSize: FontSize),)
          ],
        ),
      ],
    );
  }

  //ファイル変更日時
  ExifDateTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).DateTime, style: TextStyle(fontSize: titleFont),), pickedDateTime == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedDateTime, style: TextStyle(fontSize: FontSize),)
          ],
        ),
      ],
    );
  }

  //横幅
  ExifWidth() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //pickedWidth == "null" || pickedExifWidth.isEmpty ? Text(S.of(context).Unknow) :
            Text(S.of(context).ImageWidth, style: TextStyle(fontSize: titleFont),), pickedWidth != "null" ? SelectableText(pickedWidth, style: TextStyle(fontSize: FontSize),) : pickedExifWidth != "null" ? SelectableText(pickedExifWidth, style: TextStyle(fontSize: FontSize),) : Text(S.of(context).Unknow),
          ],
        ),
      ],
    );
  }

  //縦幅
  ExifLength() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).ImageLength, style: TextStyle(fontSize: titleFont),), pickedLength != "null" ? SelectableText(pickedLength, style: TextStyle(fontSize: FontSize),) : pickedExifLength != "null" ? SelectableText(pickedExifLength, style: TextStyle(fontSize: FontSize),) : Text(S.of(context).Unknow),],
        ),
      ],
    );
  }

  //解像度
  ExifResolution() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).Resolution, style: TextStyle(fontSize: titleFont),),pickedResolution == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedResolution, style: TextStyle(fontSize: FontSize),)
          ],
        ),
      ],
    );
  }

  //解像度単位
  ExifResolutionUnit() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).ResolutionUnit, style: TextStyle(fontSize: titleFont),), pickedResolutionUnit == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedResolutionUnit, style: TextStyle(fontSize: FontSize),)
          ],
        ),
      ],
    );
  }

  //ソフトウェア
  ExifSoftware() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).Software, style: TextStyle(fontSize: titleFont),), pickedSoftware == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedSoftware, style: TextStyle(fontSize: FontSize),)
          ],
        ),
      ],
    );
  }

  //撮影日時
  ExifDateTimeOriginal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).DateTimeOriginal, style: TextStyle(fontSize: titleFont),), pickedDateTimeOriginal == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedDateTimeOriginal, style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }
  //シャッタースピード
  ExifShutterTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).ExposureTime, style: TextStyle(fontSize: titleFont),), pickedShutterTime == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedShutterTime, style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }
  //F値
  ExifFNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).FNumber, style: TextStyle(fontSize: titleFont),), pickedFNumber == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedFNumber, style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }
  //ISO
  ExifISOSpeedRatings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).ISOSpeedRatings, style: TextStyle(fontSize: titleFont),), pickedISOSpeedRatings == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedISOSpeedRatings, style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }
  //撮影モード
  ExifExposureProgram() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).ExposureProgram, style: TextStyle(fontSize: titleFont),), pickedExposureProgram == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedExposureProgram, style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }
  //ホワイトバランス
  ExifWhiteBalance() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).WhiteBalance, style: TextStyle(fontSize: titleFont),), pickedWhiteBalance == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedWhiteBalance, style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }


}
