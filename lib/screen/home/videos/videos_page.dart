import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:luckywheel/screen/home/videos/videos_controller.dart';

class VideosPage extends GetView<VideosController> {
  const VideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: VideosController(),
      builder: (VideosController controller) {
        return Scaffold(
          
        );
      },
    );
  }
}