import 'package:flutter/material.dart';
import '../../core/base_page.dart';

class SearchPage extends BasePage {
  const SearchPage({super.key});

  @override
  PreferredSizeWidget? get appBar => null; // ❌ Không có AppBar

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔍 SearchBar ngay dưới SafeArea với khoảng cách 10px
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.search, color: Colors.white70),
                filled: true,
                fillColor: Colors.grey[800], // Nền SearchBar
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 5),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),

        // 🔽 Nội dung chính của trang
        const Expanded(
          child: Center(child: Text("🔍 Search Page")),
        ),
      ],
    );
  }
}
