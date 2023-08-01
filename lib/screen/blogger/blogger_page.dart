import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:luckywheel/helper/validate.dart';
import 'package:luckywheel/screen/blogger/blogger_controller.dart';
import 'package:luckywheel/util/color_resources.dart';

class BloggerPage extends GetView<BloggerController> {
  const BloggerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BloggerController(),
      builder: (BloggerController controller) {
        return Scaffold(
          backgroundColor: ColorResources.BACKGROUND,
          appBar: controller.isLoading == false ? null : _appBar(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              
            },
            tooltip: 'Thêm bài đăng',
            backgroundColor: ColorResources.MAIN.withOpacity(0.7),
            child: Icon(Icons.add,size: 30,),
          ),
          body: controller.isLoading == false
              ? LoadingIndicator()
              : Container(
                  padding: EdgeInsets.all(10.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.listPost.length,
                    itemBuilder: (context, index) {
                      final item = controller.listPost[index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(width: 1, color: Colors.white),
                        ),
                        margin: EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: ListTile(
                          onTap: () {
                            print(item['id']);
                            controller.gotoDetailBlogger(id: item['id']);
                            //controller.showBottomSheet(item: item);
                          },
                          leading: Image.network(
                              'https://www.blogger.com/img/logo_blogger_40px.png'),
                          title: Text(
                            Validate.nullOrEmpty(item['title'])
                                ? ''
                                : item['title'].toString(),
                            style: GoogleFonts.nunito(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            Validate.nullOrEmpty(item['author']['displayName'])
                                ? ''
                                : 'Tác giả : ' +
                                    item['author']['displayName'].toString(),
                            style: GoogleFonts.nunito(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                         
                        ),
                      );
                    },
                  ),
                ),
        );
      },
    );
  }

  ///
  /// appBar
  ///
  AppBar _appBar() {
    return AppBar(
      backgroundColor: ColorResources.MAIN,
      leading:
          Image.network('https://www.blogger.com/img/logo_blogger_40px.png'),
      title: Text(
        'Danh sách bài đăng Blogger',
        style: GoogleFonts.nunito(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
