import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:luckywheel/helper/validate.dart';
import 'package:luckywheel/screen/product/product_controller.dart';

class ProductPage extends GetView<ProductController> {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProductController(),
      builder: (ProductController controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Danh sách sản phẩm'),
          ),
          body: controller.isLoading == false
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.listProduct.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final item = controller.listProduct[index];
                            return ListTile(
                              onTap: () {
                               
                              },
                              leading: Image.network(
                                Validate.nullOrEmpty(item['image'])
                                    ? ''
                                    : item['image'],
                                width: 50,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.error);
                                },
                              ),
                              title: Text(Validate.nullOrEmpty(item['name'])
                                  ? 'No name'
                                  : item['name'.toString()]),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(Validate.nullOrEmpty(
                                          item['errorDescription'])
                                      ? 'No name'
                                      : item['errorDescription'.toString()]),
                                  Text(Validate.nullOrEmpty(item['sku'])
                                      ? 'No name'
                                      : item['sku'.toString()]),
                                  Text(Validate.nullOrEmpty(item['color'])
                                      ? 'Color null'
                                      : controller.xuliColor(
                                          id: item['color'])),
                                ],
                              ),
                              isThreeLine: true,
                              trailing: IconButton(onPressed: () {
                                if(controller.listIndex.contains(index)){
                                  return;
                                }
                                controller.listIndex.add(index);
                                controller.showDialogEditItem(item: item, colors: controller.listColor);
                                
                              }, icon: Icon(Icons.edit),color: Colors.red,),
                            );
                          },
                        ),
                      ),

                      // button submid
                      GestureDetector(
                        onTap: () {
                          controller.showBottomSheetNewUpdate(listData: controller.listProduct);
                        },
                        child: Container(
                          width: Get.width * 0.9,
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
