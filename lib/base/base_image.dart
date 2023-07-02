import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:luckywheel/base/loading.dart';

class PhuongImage extends StatefulWidget {
   final String url;
   final double? height;
   final double? width;
   
   PhuongImage({required this.url, this.height, this.width});

  @override
  State<PhuongImage> createState() => _PhuongImageState();
}

class _PhuongImageState extends State<PhuongImage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: widget.url,
        height: widget.height,
        width: widget.width,
        placeholder: (context, url) =>
            LoadingIndicator(), // Widget hiển thị khi đang tải
        errorWidget: (context, url, error) =>
            Icon(Icons.error), // Widget hiển thị khi có lỗi
      ),
    );
  }
}
