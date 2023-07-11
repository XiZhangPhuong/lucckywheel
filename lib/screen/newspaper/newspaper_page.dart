import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/screen/newspaper/newspaper_controller.dart';

class NewSpaperPage extends GetView<NewSpaperController> {
  const NewSpaperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NewSpaperController(),
      builder: (NewSpaperController controller) {
        return Scaffold(
          appBar: _appBar(),
          body: Container(
            // listview category
            child: Column(
              children: [
                // list view category
                _listViewCategory(controller),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(7.0),
                          child: CachedNetworkImage(
                            imageUrl: '',
                            height: 100,
                            width: 100,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        title: Text(
                          'Nhà cái châu âu',
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          'Nhà cái châu âu',
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ///
  /// listview Category
  ///
  Widget _listViewCategory(NewSpaperController controller) {
    return Container(
      height: 60,
      padding: EdgeInsets.all(10.0),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.listCategory.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.onClickCategory(index);
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(width: 1, color: Colors.red),
                  color: controller.currenIndex == index
                      ? Colors.red.withOpacity(0.8)
                      : Colors.white),
              child: Center(
                child: Text(
                  controller.listCategory[index],
                  style: GoogleFonts.nunito(
                      fontSize: 16,
                      color: controller.currenIndex == index
                          ? Colors.white
                          : Colors.red),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  ///
  /// appBar
  ///
  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.red.withOpacity(0.8),
      title: Text(
        'Ứng dụng đọc báo',
        style: GoogleFonts.nunito(
          fontSize: 22,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications),
        ),
      ],
    );
  }
}
