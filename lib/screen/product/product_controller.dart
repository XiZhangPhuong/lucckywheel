import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:luckywheel/helper/validate.dart';
import 'package:luckywheel/repository/product_repository.dart';

class ProductController extends GetxController {
  final ProductRepository _productRepository = ProductRepository();
  //
  bool isLoading = false;
  List<dynamic> listProduct = [];
  List<dynamic> listColor = [];
  List<int> listIndex = [];

  @override
  void onInit() {
    super.onInit();
    _getAllProduct();
    _getAllColor();
  }

  ///
  /// xu li color
  ///
  String xuliColor({required int id}) {
    String reuislt = '';
    for (int i = 0; i < listColor.length; i++) {
      if (listColor[i]['id'] == id) {
        reuislt = listColor[i]['name'] as String;
        break;
      }
    }
    return reuislt;
  }

  ///
  /// get all Product
  ///
  Future<void> _getAllProduct() async {
    await _productRepository.getAllProduct(
      onSuccess: (data) {
        listProduct = data;
        isLoading = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// get all Color
  ///
  Future<void> _getAllColor() async {
    await _productRepository.getAllColor(
      onSuccess: (data) {
        listColor = data;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// showBottomsheet List New Update
  ///
  void showBottomSheetNewUpdate({required List<dynamic> listData}) {
    Get.bottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      Container(
        height: Get.height * 0.8,
        child: ListView.builder(
          itemCount: listIndex.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final int dataIndex = listIndex[index];
            final item = listProduct[dataIndex];
            return ListTile(
              onTap: () {},
              leading: Image.network(
                Validate.nullOrEmpty(item['image']) ? '' : item['image'],
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
                  Text(Validate.nullOrEmpty(item['errorDescription'])
                      ? 'No name'
                      : item['errorDescription'.toString()]),
                  Text(Validate.nullOrEmpty(item['sku'])
                      ? 'No name'
                      : item['sku'.toString()]),
                  Text(Validate.nullOrEmpty(item['color'])
                      ? 'Color null'
                      : xuliColor(id: item['color'])),
                ],
              ),
              isThreeLine: true,
            );
          },
        ),
      ),
    );
  }

  ///
  /// show dialog edit item
  ///
  void showDialogEditItem(
      {required dynamic item, required List<dynamic> colors}) {
    Get.bottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      Container(
        height: Get.height * 0.7,
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tên sản phẩm'),
            TextField(
              decoration: InputDecoration(label: Text(item['name'])),
            ),
            SizedBox(
              height: 10,
            ),
            Text('SKU'),
            TextField(
              decoration: InputDecoration(label: Text(item['sku'])),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Color'),
                Column(
                  children: listColor
                      .map(
                        (e) => Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                print(item['color']);
                                item['color'] == e['id'];
                                print(e['id']);
                              },
                              child: Text(
                                e['name'],
                                style: TextStyle(
                                    color: item['color'] == e['id']
                                        ? Colors.red
                                        : Colors.black),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
