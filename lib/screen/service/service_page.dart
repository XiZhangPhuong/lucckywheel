import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/helper/validate.dart';
import 'package:luckywheel/screen/service/service_controller.dart';
import 'package:luckywheel/util/color_resources.dart';

class ServicePage extends GetView<ServiceController> {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ServiceController(),
      builder: (ServiceController controller) {
        return Scaffold(
          backgroundColor: ColorResources.BACKGROUND,
          appBar: AppBar(
            backgroundColor: ColorResources.BACKGROUND,
            title: Text('Service DB '),
          ),
          body: ContainedTabBarView(
            tabBarProperties: TabBarProperties(
              indicatorColor: ColorResources.MAIN,
            ),
            tabs: [
              Text(
                'Store',
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Text(
                'Order',
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
            views: [
              _listStore(controller),
              _listOrder(controller),
            ],
          ),
        );
      },
    );
  }

  ///
  ///
  ///
  Widget _listStore(ServiceController controller) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.listStore.length,
        itemBuilder: (context, index) {
          final item = controller.listStore[index];
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(
                bottom: 10,
              ),
              child: ListTile(
                leading: Validate.nullOrEmpty(item['thumbnail']) ? Container() :
                 ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(item['thumbnail'],height: 50,width: 50,fit: BoxFit.cover,),),
                title:  Text(
                Validate.nullOrEmpty(item['name']) ? 'No name' : item ['name'].toString(),
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  color: Colors.white,
                ),
                
              ),
               subtitle:  Text(
                Validate.nullOrEmpty(item['street']) ? 'No name' : item ['street'].toString(),
                style: GoogleFonts.nunito(
                  color: Colors.white,
                ),
              ),
            ),
          )
          );
        },
        
      ),
    );
  }
}

///
/// listOrder
///
Widget _listOrder(ServiceController controller) {
  return Container();
}
