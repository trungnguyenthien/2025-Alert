import 'package:flutter/material.dart';
import '../../core/base_page.dart';

class ProfilePage extends BasePage {
  const ProfilePage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppBar(
        title: const Text("Profile"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
      );

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("👤 Profile Page"));
  }
}
