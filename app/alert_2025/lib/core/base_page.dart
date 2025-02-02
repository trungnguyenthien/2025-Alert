import 'package:flutter/material.dart';

abstract class BasePage extends StatelessWidget {
  const BasePage({super.key});

  /// 🔹 Each page defines its own AppBar
  PreferredSizeWidget? get appBar;
}
