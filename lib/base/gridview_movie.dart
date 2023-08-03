// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:luckywheel/helper/validate.dart';
import 'package:luckywheel/temp.dart';

class GridViewMovie extends StatelessWidget {
  List<dynamic> listData;
  String routes;

   GridViewMovie({
    Key? key,
    required this.listData,
    required this.routes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: listData.length,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        final item = listData[index];
        return GestureDetector(
          onTap: () {
            print(item['id']);
            Validate.nullOrEmpty(routes) ?  null :
            Get.toNamed(routes,arguments: item['id']);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    Validate.nullOrEmpty(item['poster_path']) ? 'https://mycodetips.com/wp-content/uploads/2020/01/null-vale.png':
                    Temp.imageMovieDB(url: item['poster_path'])[2],
                    // height: 300,
                    width: Get.width / 2,
                    fit: BoxFit.cover,
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
                    Validate.nullOrEmpty(item['vote_average']) ? '0.0' : 
                    Temp.convertVote(item['vote_average']),
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
                Validate.nullOrEmpty(item['title']) && Validate.nullOrEmpty(item['name']) ? 'No name' :
                Validate.nullOrEmpty(item['title'])
                    ? item['name']
                    : item['title'],                 
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
