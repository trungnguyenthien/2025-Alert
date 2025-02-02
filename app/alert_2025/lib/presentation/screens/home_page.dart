import 'package:flutter/material.dart';
import '../../core/base_page.dart';

class HomePage extends BasePage {
  const HomePage({super.key});

  @override
  PreferredSizeWidget? get appBar => null; // ❌ Không sử dụng AppBar mặc định

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // 🔹 SliverAppBar giúp tạo hiệu ứng Large Title giống iOS
        SliverAppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          expandedHeight: 120, // Chiều cao tối đa của AppBar khi mở rộng
          floating: false,
          pinned: true, // Giữ tiêu đề nhỏ khi cuộn xuống
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
            centerTitle: false,
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
          ),
        ),

          // 🔹 Nội dung danh sách với nền trắng
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                color: Colors.white, // ✅ Đảm bảo danh sách có nền trắng
                child: ListTile(
                  leading: const Icon(Icons.home),
                  title: Text("Item ${index + 1}"),
                  subtitle: const Text("Subtitle"),
                ),
              ),
              childCount: 20, // Giả lập danh sách có 20 item
            ),
          ),
      ],
    );
  }
}
