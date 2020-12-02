/*
 * @Author: your name
 * @Date: 2020-10-28 09:53:10
 * @LastEditTime: 2020-10-28 12:09:01
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \seesome\lib\components\livepalyer_page.dart
 */
import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:getflutter/components/loader/gf_loader.dart';
import 'package:getflutter/types/gf_loader_type.dart';
import 'package:seesome/components/controller_widget_builder.dart.dart';

class LivePlayerPage extends StatefulWidget {
  final sourceHttp;

  const LivePlayerPage({Key key, this.sourceHttp}) : super(key: key);

  @override
  _LivePlayerPageState createState() => _LivePlayerPageState();
}

class _LivePlayerPageState extends State<LivePlayerPage> {
  IjkMediaController mediaController =
      new IjkMediaController(autoRotate: true, needChangeSpeed: false);

  var isLoad = false;

  @override
  void initState() {
    super.initState();

    mediaController.setNetworkDataSource(
      widget.sourceHttp,
      autoPlay: true,
    );
    mediaController.ijkStatusStream.listen((event) {
      isLoad = mediaController.isPlaying ? true : false;
      setState(() {});
    });
  }

  @override
  Future<void> dispose() async {
    await mediaController.stop();
    super.dispose();
  }

  Widget loadingVideo() => Container(
        color: Colors.black,
        child: Center(
          child: GFLoader(
            type: GFLoaderType.circle,
            loaderColorOne: Colors.blueAccent,
            loaderColorTwo: Colors.black,
            loaderColorThree: Colors.pink,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: double.infinity,
      alignment: Alignment.center,
      color: Colors.black,
      //height: double.infinity,
      child: isLoad
          ? GestureDetector(
              onTap: () {
                print(mediaController);
                if (mediaController.isPlaying) {
                  mediaController.pause();
                } else {
                  mediaController.play();
                }
              },
              child: AspectRatio(
                aspectRatio: 0.656, //mediaController.value.aspectRatio,
                child: IjkPlayer(
                  mediaController: mediaController,
                  controllerWidgetBuilder: (mediaController) {
                    return defaultBuildIjkControllerWidget(mediaController);
                  },
                ),
              ),
            )
          : loadingVideo(),
    );
  }
}
