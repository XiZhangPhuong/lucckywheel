import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckywheel/screen/user/user_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserPage extends GetView<UserController> {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: UserController(),
      builder: (UserController controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Call API User'),
          ),
          body: Container(
            child: controller.isLoading == false
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SmartRefresher(
                  controller: controller.refreshController,
                  onRefresh: controller.onReFresh,
                  onLoading: controller.onLoading,
                  enablePullDown: true,
                  enablePullUp: true,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.listUser.length,
                      itemBuilder: (context, index) {
                        final item = controller.listUser[index];
                        return GestureDetector(
                          onTap: () {
                
                          },
                          child: Card(
                            child: ListTile(
                              title: Text(item.name!),
                              subtitle: Text(item.email!),
                              
                            ),
                          ),
                        );
                      },
                    ),
                ),
          ),
        );
      },
    );
  }
}
