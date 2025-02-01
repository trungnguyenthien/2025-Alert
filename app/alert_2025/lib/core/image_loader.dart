import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageLoader extends StatefulWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final String? loadingImage;
  final String? errorImage;

  const ImageLoader({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.loadingImage,
    this.errorImage,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ImageLoaderState createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {
  late String currentImageUrl;

  @override
  void initState() {
    super.initState();
    currentImageUrl = widget.imageUrl;
  }

  @override
  void didUpdateWidget(covariant ImageLoader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.imageUrl != oldWidget.imageUrl) {
      setState(() {
        currentImageUrl = widget.imageUrl;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: currentImageUrl,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,

      /// 🔄 Hiển thị ảnh loading
      placeholder: (context, url) => widget.loadingImage != null
          ? Image.asset(widget.loadingImage!,
              width: widget.width, height: widget.height, fit: widget.fit)
          : Center(child: CircularProgressIndicator()),

      /// ❌ Hiển thị ảnh lỗi
      errorWidget: (context, url, error) => widget.errorImage != null
          ? Image.asset(widget.errorImage!,
              width: widget.width, height: widget.height, fit: widget.fit)
          : Icon(Icons.error, size: widget.width ?? 50, color: Colors.red),
    );
  }
}


// ImageLoader(
//   imageUrl: "https://example.com/image1.png",
//   width: 100,
//   height: 100,
// );

// class ExampleScreen extends StatefulWidget {
//   @override
//   _ExampleScreenState createState() => _ExampleScreenState();
// }

// class _ExampleScreenState extends State<ExampleScreen> {
//   String imageUrl = "https://example.com/image1.png";

//   void changeImage() {
//     setState(() {
//       imageUrl = "https://example.com/image2.png"; // Thay ảnh mới
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ImageLoader(imageUrl: imageUrl, width: 150, height: 150),
//         ElevatedButton(
//           onPressed: changeImage,
//           child: Text("Thay đổi ảnh"),
//         ),
//       ],
//     );
//   }
// }



