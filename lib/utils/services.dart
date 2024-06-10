import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Utils {
  Future<void> loadAssetsImage(String imageUrl, BuildContext context) async {
    try {
      print("-------------------$imageUrl--------------------------------------");
      if (true/*!imageCache.containsKey(AssetImage(imageUrl))*/) {
        await precacheImage(AssetImage(imageUrl), context);
        // print('Image loaded and cached successfully!');
      } else {
        // print('Image cached already!');
      }

      // await precacheImage(AssetImage(imagePath), context);
    } catch (e) {
      // print('Failed to load and cache the image: $e');
    }
  }
  Future<void> loadFileImage(File imagFile, BuildContext context) async {
    try {
      if (true/*!imageCache.containsKey(AssetImage(imageUrl))*/) {
        await precacheImage(FileImage(imagFile), context);
        // print('Image loaded and cached successfully!');
      } else {
        // print('Image cached already!');
      }

      // await precacheImage(AssetImage(imagePath), context);
    } catch (e) {
      // print('Failed to load and cache the image: $e');
    }
  }

  Future<void> loadNetworkImage(String imageUrl, BuildContext context) async {
    try {
      if (!imageCache.containsKey(NetworkImage(imageUrl))) {
        await precacheImage(NetworkImage(imageUrl), context);
        // print('Image loaded and cached successfully!');
      } else {
        // print('Image cached already!');
      }

      // await precacheImage(AssetImage(imagePath), context);
    } catch (e) {
      // print('Failed to load and cache the image: $e');
    }
  }



  Future<File> saveImage(String imageUrl) async {
File finalFile=File(imageUrl);
    try {


      if(!Platform.isAndroid) {
        var status = await Permission.storage.status;

        if (status.isDenied) {
          Permission.storage.request();
        }
      }
      // Download image

      // Get temporary directory
      final dir = await getApplicationDocumentsDirectory();

      var filename = '${dir.path}/SaveImage/$imageUrl';

      // Save to filesystem

      if (!await File(filename).exists()) {
        final file = File(filename).create(recursive: true);
        final http.Response response = await http.get(Uri.parse(imageUrl));
        await file.then((nFileName) async {
          await File(nFileName.path).readAsBytes().then((value) async {
            await nFileName.writeAsBytes(response.bodyBytes);
          });
          imageUrl = nFileName.path;
          finalFile= nFileName;
        });
      } else {
        finalFile= File(filename);
      }
return finalFile;
      // return file;
    } catch (e) {
      print("-----------------------------------${e.toString()}");
      return finalFile;
    }
  }



  String timeNow() {
    var timeNow = DateTime.now();

    String formattedString = DateFormat("MMM d, y || hh:mm a").format(timeNow);
    return formattedString;
  }
}
class SizeReportingWidget extends StatefulWidget  {
  final Widget child;
  final ValueChanged<Size> onSizeChange;

  const SizeReportingWidget({
    super.key,
    required this.child,
    required this.onSizeChange,
  });

  @override
  State<SizeReportingWidget> createState() => _SizeReportingWidgetState();
}

class _SizeReportingWidgetState extends State<SizeReportingWidget> {
  Size? _oldSize;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _notifySize());
    return widget.child;
  }

  void _notifySize() {
    if (!mounted) {
      return;
    }
    final size = context.size;
    if (_oldSize != size && size != null) {
      _oldSize = size;
      widget.onSizeChange(size);
    }
  }
}