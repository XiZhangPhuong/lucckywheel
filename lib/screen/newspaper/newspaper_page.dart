import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:luckywheel/helper/validate.dart';
import 'package:luckywheel/screen/newspaper/newspaper_controller.dart';
import 'package:luckywheel/temp.dart';

class NewSpaperPage extends GetView<NewSpaperController> {
  const NewSpaperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NewSpaperController(),
      builder: (NewSpaperController controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Ứng dụng đọc báo '),
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
          ),
          body: controller.isLoading == false
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.dataNewSpaper.length,
                    itemBuilder: (context, index) {
                      final item = controller.dataNewSpaper[index];
                      return ListTile(
                        contentPadding: EdgeInsetsDirectional.all(5.0),
                        onTap: () {
                          controller.showBottomSheetWeb(url: item.link);
                        },
                        leading: Image.network('https://s.vnecdn.net/vnexpress/i/v20/logos/vne_logo_rss.png',
                        width: 50,fit: BoxFit.cover,
                        ),
                        title: Text(Validate.nullOrEmpty(item.title)
                            ? 'No data'
                            : item.title.toString(),),
                        subtitle: Text(Validate.nullOrEmpty(item.pubDate) ?'No data' :
                        item.pubDate,
                        ),    
                      );
                      
                    },
                  ),
                ),
        );
      },
    );
  }
}
