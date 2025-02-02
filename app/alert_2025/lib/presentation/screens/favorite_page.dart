import 'package:flutter/material.dart';
import '../../core/base_page.dart';

class FavoritePage extends BasePage {
  const FavoritePage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppBar(
        title: const Text("Favorites"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
      );

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("❤️ Favorite Page"));
  }
}
