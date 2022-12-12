import 'package:exifview/generated/l10n.dart';
import 'package:exifview/style/style.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:exif/exif.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("ExifView")),
        backgroundColor: Colors.black38,
        leading: image != null
            ? IconButton(icon: Icon(Icons.clear), onPressed: clearimage)
            : null,
      ),
      body:Container(
          child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
            mainAxisAlignment: image == null ? MainAxisAlignment.center :MainAxisAlignment.start,
        children: [
          //画像の表示と選択
          image == null
              ? ElevatedButton.icon(
                  icon: Icon(Icons.image),
                  label: Text(S.of(context).SelectImage),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, onPrimary: Colors.black),
                  onPressed: () {
                    getImageFromGallery();
                  },
                )
              : Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                    child: SizedBox(
                      height: 150,
                      child: Image.file(
                        image!, fit: BoxFit.scaleDown,
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
                          //ファイル変更日時
                          ExifDateTime(),
                          //横幅
                          ExifWidth(),
                          //縦幅
                          ExifLength()
                        ],
              ),
                  )
            ],
          )
        ],
      )),
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
          children: [
            Text(S.of(context).Make, style: TextStyle(fontSize: titleFont),), pickedMake == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedMake, style: TextStyle(fontSize: FontSize),)
          ],
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
            Text(S.of(context).ImageWidth, style: TextStyle(fontSize: titleFont),), pickedWidth != "null"  ? SelectableText(pickedWidth,style: TextStyle(fontSize: FontSize),) : pickedLength != "null" ? SelectableText(pickedWidth) :Text(S.of(context).Unknow),
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
          children: [
            Text(S.of(context).ImageLength, style: TextStyle(fontSize: titleFont),), pickedLength != "null" ? SelectableText(pickedLength,style: TextStyle(fontSize: FontSize),) : pickedLength != "null" ? SelectableText(pickedLength,) :Text(S.of(context).Unknow),
          ],
        ),
      ],
    );
  }
}
