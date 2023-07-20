import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckywheel/screen/home/videos/videos_controller.dart';
import 'package:flutter_html/flutter_html.dart';

class VideosPage extends GetView<VideosController> {
  const VideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: VideosController(),
      builder: (VideosController controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Xem bong da'),
          ),
          body: Center(
            child: Html(
              data: '''
                <div style='width:100%;height:300px;position:relative;padding-bottom:56.250%;background:#000000;'><iframe src='https://www.scorebat.com/embed/v/WGlzd3AxUGxqVm1yMGdQODJNWlMzQT09/?token=OTQ5MTlfMTY4OTg1MDc0M18yZWRjODhjOTExNWE3M2M3N2NiMTQwNzIyN2I3YTc5YWVmMDFkMTIw&utm_source=api&utm_medium=video&utm_campaign=apifd' frameborder='0' width='100%' height='100%' allowfullscreen allow='autoplay; fullscreen' style='width:100%;height:100%;position:absolute;left:0px;top:0px;overflow:hidden;'></iframe></div>
              ''',
            ),
          ),
        );
      },
    );
  }
}
