import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:luckywheel/helper/validate.dart';
import 'package:luckywheel/screen/service/service_controller.dart';
import 'package:luckywheel/temp.dart';
import 'package:luckywheel/util/color_resources.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ServicePage extends GetView<ServiceController> {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ServiceController(),
      builder: (ServiceController controller) {
        return Scaffold(
          backgroundColor: ColorResources.BACKGROUND,
          appBar: controller.isLoadingAddress==false ?null : AppBar(
            backgroundColor: ColorResources.BACKGROUND,
            title: Text(
              controller.address,
              style: GoogleFonts.nunito(fontSize: 20, color: Colors.white),
            ),
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
    return controller.isLoading==false ? LoadingIndicator() : Container(
      child: SmartRefresher(
        controller: controller.refreshController,
        enablePullUp: true,
        //enablePullDown: true,
        onLoading: () {
          controller.onLoadingStore();
        },
        onRefresh: () {
          controller.onRefreshingStore();
        },
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
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Validate.nullOrEmpty(item['name'])
                            ? 'No name'
                            : item['name'].toString(),
                        style: GoogleFonts.nunito(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        Validate.nullOrEmpty(item['street'])
                            ? 'No name'
                            : item['street'].toString(),
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        Validate.nullOrEmpty(item['phone'])
                            ? 'No name'
                            : item['phone'].toString(),
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        Validate.nullOrEmpty(item['email'])
                            ? 'No name'
                            : item['email'].toString(),
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      
                      Text(
                        Validate.nullOrEmpty(item['typeStore'])
                            ? 'No name'
                            : item['typeStore'].toString(),
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        Validate.nullOrEmpty(item['maxService'])
                            ? 'No name'
                            :'Max Service : '+ item['maxService'].toString(),
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        Validate.nullOrEmpty(item['commissionPercent'])
                            ? 'No name'
                            :'CommissionPercent : '+ item['commissionPercent'].toString(),
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        Validate.nullOrEmpty(item['numberBookedInOneHour'])
                            ? 'No name'
                            :'NumberBookedInOneHour : '+ item['numberBookedInOneHour'].toString(),
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        Validate.nullOrEmpty(item['pointOrder'])
                            ? 'No name'
                            :'PointOrder : '+ item['pointOrder'].toString(),
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        Validate.nullOrEmpty(item['totalRates'])
                            ? 'No name'
                            :'TotalRates : '+ item['totalRates'].toString(),
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        Validate.nullOrEmpty(item['totalScore'])
                            ? 'No name'
                            :'TotalScore : '+ item['totalScore'].toString(),
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Divider(
                        color: Colors.white30,
                      ),
                    ],
                  ),
                ));
          },
        ),
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
