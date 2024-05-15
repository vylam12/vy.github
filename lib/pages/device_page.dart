import 'package:flutter/material.dart';

class DevicePage extends StatelessWidget {
  const DevicePage({super.key, required this.userId});
  final int userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Ẩn nút quay về
      ),
      body: Column(),
    );
  }
}
