import 'package:exifview/generated/l10n.dart';
import 'package:exifview/service/admob.dart';
import 'package:exifview/style/style.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:exif/exif.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'Hero＿image.dart';
import 'TapImageScreen.dart';
import 'admob.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // final image = (image  != null) ? Image.asset("assets/images/imageIcon.png") : Image.file(
  //   image!,
  // ),

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
  dynamic pickedColorSpace;
  dynamic pickedOffsetTime;
  dynamic pickedFocalLength;
  dynamic pickedFocalLengthIn35mm;
  dynamic pickedLensModel;
  dynamic pickedLightSource;
  dynamic pickedFlash;
  dynamic pickedComponentsConfiguration;
  dynamic pickedGPSLatitudeRef;
  dynamic pickedGPSLatitude;
  dynamic pickedGPSLongitudeRef;
  dynamic pickedGPSLongitude;
  dynamic pickedGPSAltitudeRef;
  dynamic pickedGPSAltitude;
  dynamic pickedGPSProcessingMethod;
  dynamic pickedGPSDate;
  dynamic pickedImageDescription;
  dynamic pickedCopyright;
  dynamic IntNum;
  dynamic IntNum2;
  dynamic IntpickedF;
  dynamic iPickedGPSLatitude;
  dynamic iPickedGPSLong;

  //緯度経度を「,」区切りにして配列に順に入れる
  List<dynamic> GPSLat = [];
  List<dynamic> GPSLatNum = [];
  List<dynamic> GPSLong = [];
  List<dynamic> GPSLongNum = [];
  late String GpsLat10;
  late double GpsLat10Num = 0;
  late String GpsLong10;
  late double GpsLong10Num = 0;
  List<Marker> markers =[];



  //削除
  void clearimage() {
    setState(() {
      image = null;
      pickedFNumber = "";
      pickedDateTime = "";
      pickedDateTimeOriginal = "";
      pickedGPSLatitude = "";
      pickedGPSLongitude = "";
      GPSLat.clear();
      GPSLatNum.clear();
      GPSLong.clear();
      GPSLongNum.clear();
      GpsLong10Num = 0.0;
      GpsLat10Num = 0.0;
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
    pickedImageDescription = tags["Image ImageDescription"].toString();
    pickedCopyright = tags["Image Copyright"].toString();
    pickedShutterTime = tags["EXIF ExposureTime"].toString();
    pickedFNumber = tags["EXIF FNumber"].toString();
    pickedISOSpeedRatings = tags["EXIF ISOSpeedRatings"].toString();
    pickedExposureProgram = tags["EXIF ExposureProgram"].toString();
    pickedWhiteBalance = tags["EXIF WhiteBalance"].toString();
    pickedColorSpace = tags["EXIF ColorSpace"].toString();
    pickedOffsetTime = tags["EXIF OffsetTime"].toString();
    pickedFocalLength = tags["EXIF FocalLength"].toString();
    pickedFocalLengthIn35mm = tags["EXIF FocalLengthIn35mmFilm"].toString();
    pickedLensModel = tags["EXIF LensModel"].toString();
    pickedLightSource = tags["EXIF LightSource"].toString();
    pickedFlash = tags["EXIF Flash"].toString();
    pickedComponentsConfiguration = tags["EXIF ComponentsConfiguration"].toString();
    pickedGPSLatitudeRef = tags["GPS GPSLatitudeRef"].toString();
    pickedGPSLatitude = tags["GPS GPSLatitude"].toString();
    pickedGPSLongitudeRef = tags["GPS GPSLongitudeRef"].toString();
    pickedGPSLongitude = tags["GPS GPSLongitude"].toString();
    pickedGPSAltitudeRef = tags["GPS GPSAltitudeRef"].toString();
    pickedGPSAltitude = tags["GPS GPSAltitude"].toString();
    pickedGPSProcessingMethod = tags["GPS GPSProcessingMethod"].toString();
    pickedGPSDate = tags["GPS GPSDate"].toString();

    
    // pickedDateTime== "null" ? pickedDateTime : pickedDateTime.replaceAll(":", "/").replaceFirst("/", ":", 12,).replaceFirst("/", ":", 16,);
    setState(() {
      image = File(pickedFile!.path);

      //GPS操作
      GpsLat10 = "0";
      GpsLong10 = "0";
      if(pickedGPSLatitude != "null" && pickedGPSLongitude != "null" ){
        pickedGPSLatitude = pickedGPSLatitude.replaceAll("[", "");
        pickedGPSLatitude = pickedGPSLatitude.replaceAll("]", "");
        pickedGPSLongitude = pickedGPSLongitude.replaceAll("[", "");
        pickedGPSLongitude = pickedGPSLongitude.replaceAll("]", "");

        GPSLong.addAll(pickedGPSLongitude.split(new RegExp(r',')));
        GPSLat.addAll(pickedGPSLatitude.split(new RegExp(r',')));
        if(GPSLat[2].contains("/")){
          GPSLatNum = GPSLat[2].split(new RegExp(r'/'));
          IntNum = int.parse(GPSLatNum[0]);
          IntNum2 = int.parse(GPSLatNum[1]);
          IntpickedF = IntNum / IntNum2;
          GPSLat.insert(2, IntpickedF.toString());
          GPSLat.removeAt(3);
          GpsLat10Num = double.parse(GPSLat[0]) + (double.parse(GPSLat[1]) * 60 + double.parse(GPSLat[2]) ) / 3600;
          GpsLat10 = GpsLat10Num.toString();
        }
        if(GPSLong[2].contains("/")){
          GPSLongNum = GPSLong[2].split(new RegExp(r'/'));
          IntNum = int.parse(GPSLongNum[0]);
          IntNum2 = int.parse(GPSLongNum[1]);
          IntpickedF = IntNum / IntNum2;
          GPSLong.insert(2, IntpickedF.toString());
          GPSLong.removeAt(3);
          GpsLong10Num = double.parse(GPSLong[0]) + (double.parse(GPSLong[1]) * 60 + double.parse(GPSLong[2]) ) / 3600;
          GpsLong10 = GpsLong10Num.toString();
        }
        print(GpsLat10);
        print(GpsLong10);
        print("緯度1　${GPSLat[0]}");
        print("緯度2　${GPSLat[1]}");
        print("緯度3　${GPSLat[2]}");
        print("経度1　${GPSLong[0]}");
        print("経度2　${GPSLong[1]}");
        print("経度3　${GPSLong[2]}");

      }

      //ファイル変更時間操作
      if (pickedDateTime == "null" ){
        pickedDateTime;
      } else if (pickedDateTime != "null" ){
        pickedDateTime = pickedDateTime.replaceAll(":", "/").replaceFirst("/", ":", 12,).replaceFirst("/", ":", 16,);
        pickedDateTime;
      }
      //撮影時間
      if (pickedDateTimeOriginal == "null" ){
        pickedDateTimeOriginal;
      } else if (pickedDateTimeOriginal != "null" ){
        pickedDateTimeOriginal = pickedDateTimeOriginal.replaceAll(":", "/").replaceFirst("/", ":", 12,).replaceFirst("/", ":", 16,);
        pickedDateTimeOriginal;
      }
      //F値操作
      if (pickedFNumber == "null") {
        return pickedFNumber;
      }
      if (pickedFNumber.length == 1) {
        pickedFNumber = pickedFNumber + ".0";
        return pickedFNumber;
      }
      //小数点ありのF値の表示がされないので計算をする
      if (pickedFNumber.length == 3 || pickedFNumber.length == 4 ||
          pickedFNumber.length == 5) {
        //３文字の時
        if (pickedFNumber.length == 3) {
          var num1 = pickedFNumber.substring(0, 1);
          var num2 = pickedFNumber.substring(2, 3);
          //var IntpickedF = num1.parse(num1) / num3.parse(num3);
          IntNum = int.parse(num1);
          IntNum2 = int.parse(num2);
          IntpickedF = IntNum / IntNum2;
          pickedFNumber = IntpickedF.toString();
          return pickedFNumber;
        }
        //4文字の時
        else if (pickedFNumber.length == 4) {
          var num1 = pickedFNumber.substring(0, 2);
          var num2 = pickedFNumber.substring(3, 4);
          //var IntpickedF = num1.parse(num1) / num3.parse(num3);
          IntNum = int.parse(num1);
          IntNum2 = int.parse(num2);
          IntpickedF = IntNum / IntNum2;
          pickedFNumber = IntpickedF.toString();
          return pickedFNumber;
        }
        //5文字の時
        else if (pickedFNumber.length == 5) {
          var num1 = pickedFNumber.substring(0, 2);
          var num2 = pickedFNumber.substring(3, 5);
          //var IntpickedF = num1.parse(num1) / num3.parse(num3);
          IntNum = int.parse(num1);
          IntNum2 = int.parse(num2);
          IntpickedF = IntNum / IntNum2;
          pickedFNumber = IntpickedF.toString();
          return pickedFNumber;
        }
      }

    });
    for (final entry in tags.entries) {
      print("${entry.key}: ${entry.value}");
    }

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
            AdBanner(size: AdSize.banner),
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
            : Container(
              height:  150,
              child: HeroImage(
                onTap: () => _DisplayLargeImage(context, image),
                image: Image.file(
                  image!,
                  fit: BoxFit.scaleDown,
              ),
              ),
            ),
                // : Padding(
                //     padding: const EdgeInsets.only(top: 10),
                //     child: Container(
                //       child: SizedBox(
                //         height: 150,
                //         child: Image.file(
                //           image!,
                //           fit: BoxFit.scaleDown,
                //         ),
                //       ),
                //
                //     ),
                //   ),
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
                            //レンズモデル
                            ExifLensModel(),
                            //標準時
                            ExifOffsetTime(),
                            //撮影日時
                            ExifDateTimeOriginal(),
                            //シャッタースピード
                            ExifShutterTime(),
                            //F値
                            ExifFNumber(),
                            //ISO
                            ExifISOSpeedRatings(),
                            //焦点距離
                            ExifFocalLength(),
                            //35mm換算
                            ExifFocalLengthIn35mmFilm(),
                            //撮影モード
                            ExifExposureProgram(),
                            //ホワイトバランス
                            ExifWhiteBalance(),
                            //色空間
                            ExifColorSpace(),
                            //光源
                            ExifLightSource(),
                            //フラッシュ
                            ExifFlash(),
                            //ファイル変更日時
                            ExifDateTime(),
                            //ソフトウェア
                            ExifSoftware(),
                            //著作権
                            ExifCopyright(),
                            //説明
                            ExifImageDescription(),
                            //解像度単位
                            ExifResolutionUnit(),
                            //解像度
                            ExifResolution(),
                            //横幅
                            ExifWidth(),
                            //縦幅
                            ExifLength(),
                            //コンポネート
                            ExifComponentsConfiguration(),
                            //北緯南緯
                            ExifGPSLatitudeRef(),
                            //緯度
                            ExifGPSLatitude(),
                            //東経西経
                            ExifGPSLongitudeRef(),
                            //経度
                            ExifGPSLongitude(),
                            //高度の基準
                            ExifGPSAltitudeRef(),
                            //高度
                            ExifGPSAltitude(),
                            //測位方式
                            ExifGPSProcessingMethod(),
                            //GPS日付
                            ExifGPSDate(),
                            LineItem(),
                            (pickedGPSLatitude != "null" && pickedGPSLongitude != "null") ? MapContainer() : Container(),
                            SizedBox(height: 20,),
                            AdBanner(size: AdSize.banner),
                          ],
                        ),
                      ),
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
//色空間
  ExifColorSpace() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).ColorSpace, style: TextStyle(fontSize: titleFont),), pickedColorSpace == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedColorSpace, style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }
  //標準時
  ExifOffsetTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).OffsetTime, style: TextStyle(fontSize: titleFont),), pickedOffsetTime == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedOffsetTime, style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }
  //焦点距離
  ExifFocalLength() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).FocalLength, style: TextStyle(fontSize: titleFont),), pickedFocalLength == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedFocalLength, style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }
  //35mm換算
  ExifFocalLengthIn35mmFilm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).FocalLengthIn35mmFilm, style: TextStyle(fontSize: titleFont),), pickedFocalLengthIn35mm == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedFocalLengthIn35mm, style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }
  //レンズモデル
  ExifLensModel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).LensModel, style: TextStyle(fontSize: titleFont),), pickedLensModel == "null" || pickedLensModel == "N/A" ? Text(S.of(context).Unknow) : SelectableText(pickedLensModel, style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }
  //光源
  ExifLightSource() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).LightSource, style: TextStyle(fontSize: titleFont),), pickedLightSource == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedLightSource, style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }
  //フラッシュ
  ExifFlash() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).Flash, style: TextStyle(fontSize: titleFont),), pickedFlash == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedFlash, style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }
  //コンポネート
  ExifComponentsConfiguration() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).ComponentsConfiguration, style: TextStyle(fontSize: titleFont),), pickedComponentsConfiguration == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedComponentsConfiguration, style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }
  //北緯南緯
  ExifGPSLatitudeRef() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).GPSLatitudeRef, style: TextStyle(fontSize: titleFont),), pickedGPSLatitudeRef == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedGPSLatitudeRef, style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }
  //緯度
  ExifGPSLatitude() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //children: [Text(S.of(context).GPSLatitude, style: TextStyle(fontSize: titleFont),), pickedGPSLatitude == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedGPSLatitude, style: TextStyle(fontSize: FontSize),)],
          children: [
            Text(S.of(context).GPSLatitude, style: TextStyle(fontSize: titleFont),), pickedGPSLatitude == "null" ? Text(S.of(context).Unknow) : SelectableText(GPSLat.join(","), style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }
  //東経西経
  ExifGPSLongitudeRef() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).GPSLongitudeRef, style: TextStyle(fontSize: titleFont),), pickedGPSLongitudeRef == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedGPSLongitudeRef, style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }
  //経度
  ExifGPSLongitude() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).GPSLongitude, style: TextStyle(fontSize: titleFont),), pickedGPSLongitude == "null" ? Text(S.of(context).Unknow) : SelectableText(GPSLong.join(","), style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }
  //高度の基準
  ExifGPSAltitudeRef() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).GPSAltitudeRef, style: TextStyle(fontSize: titleFont),), pickedGPSAltitudeRef == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedGPSAltitudeRef, style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }
  //高度
  ExifGPSAltitude() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).GPSAltitude, style: TextStyle(fontSize: titleFont),), pickedGPSAltitude == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedGPSAltitude, style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }
  //測位方式
  ExifGPSProcessingMethod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).GPSProcessingMethod, style: TextStyle(fontSize: titleFont),), pickedGPSProcessingMethod == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedGPSProcessingMethod, style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }
  //GPS日付
  ExifGPSDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).GPSDate, style: TextStyle(fontSize: titleFont),), pickedGPSDate == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedGPSDate, style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }
  //著作権
  ExifCopyright() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).Copyright, style: TextStyle(fontSize: titleFont),), pickedCopyright == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedCopyright, style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }
  //説明
  ExifImageDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineItem(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(S.of(context).ImageDescription, style: TextStyle(fontSize: titleFont),), pickedImageDescription == "null" ? Text(S.of(context).Unknow) : SelectableText(pickedImageDescription, style: TextStyle(fontSize: FontSize),)],
        ),
      ],
    );
  }

  //画像拡大の遷移
  _DisplayLargeImage(BuildContext context, File? image) {
   Navigator.push(context,
       MaterialPageRoute(builder: (_) => TapImageScreen(image: (image == null)  ? Image.asset("assets/images/imageIcon.png") : Image.file(image) ) ));
  }

  //Map表示
  MapContainer() {
    return  Container(
      width: 300,
      height: 350,
      child: FlutterMap(
          options: MapOptions(
            center: latLng.LatLng(GpsLat10Num!, GpsLong10Num!),
            zoom: 16.3,
            maxZoom: 18.3,
            minZoom: 1.0,
          ),

        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.makoto.exifview.exifview',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: latLng.LatLng(GpsLat10Num == 0 ? 0.0 :GpsLat10Num, GpsLong10Num == 0 ? 0.0 : GpsLong10Num),
                width: 60,
                height: 60,
                builder: (context) => const Icon(
                  size:50,
                  Icons.location_pin,
                  color: Colors.red,
                ),
              ),
            ],
        )
        ],
        // nonRotatedChildren: [
        //   AttributionWidget.defaultWidget(
        //     source: 'OpenStreetMap contributors',
        //     onSourceTapped: null,
        //   ),
        // ],
        ),
    );
  }
}
