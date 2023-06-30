import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckywheel/screen/cat/cat_controller.dart';

class CatPage extends GetView<CatController> {
  const CatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CatController(),
      builder: (CatController controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Call API Cat'),
          ),
          body: Container(
            child: Center(
                child: controller.isLoading == false
                    ? CircularProgressIndicator()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButton(
                            value: controller.selected,
                            items: controller.listCat
                                .map((e) => DropdownMenuItem(
                                    value: e.name.toString(),
                                    child: Text(
                                      e.name.toString(),
                                    )))
                                .toList(),
                            onChanged: (value) {
                              controller.changeSelect(
                                  controller.listCat, value.toString());
                              print(controller.findId(
                                  controller.listCat, value!));
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                         Image.network(controller.url),
                        ],
                      )),
          ),
        );
      },
    );
  }
}
