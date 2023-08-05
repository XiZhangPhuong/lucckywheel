import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/helper/validate.dart';
import 'package:luckywheel/temp.dart';

class PhuongListViewMovie extends StatelessWidget {
  String titleListView;
  List<dynamic> listData;
  String pageItem;
  String pageClickAll;
  dynamic valuePageClickAll;

  PhuongListViewMovie({
    required this.titleListView,
    required this.listData,
    required this.pageItem,
    required this.pageClickAll,
    required this.valuePageClickAll,
  });

  @override
  Widget build(BuildContext context) {
    return
     Container(
      padding: EdgeInsets.only(
        left: 10,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleListView,
              style: GoogleFonts.nunito(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
              onPressed: () {
                Validate.nullOrEmpty(pageClickAll)
                    ? null
                    : Get.toNamed(pageClickAll, arguments: valuePageClickAll);
              },
              icon: Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 300,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: listData.length,
            itemBuilder: (context, index) {
              final item = listData[index];
              return GestureDetector(
                onTap: () {
                  print(item['id']);
                  Validate.nullOrEmpty(pageItem)
                      ? null
                      : Get.toNamed(pageItem, arguments: item['id']);
                },
                child: Container(
                  width: 150,
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Validate.nullOrEmpty(item['poster_path'])
                              ? Container()
                              : Image.network(
                                  Temp.imageMovieDB(url: item['poster_path'])
                                      .last,
                                  fit: BoxFit.cover,
                                  width: 150,
                                  // height: 100,
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            Validate.nullOrEmpty(item['vote_average'])
                                ? '0.0'
                                : Temp.convertVote(item['vote_average']),
                            style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        Validate.nullOrEmpty(item['title']) &&
                                Validate.nullOrEmpty(item['name'])
                            ? 'No name'
                            : Validate.nullOrEmpty(item['title'])
                                ? item['name']
                                : item['title'],
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
 
  }
}
