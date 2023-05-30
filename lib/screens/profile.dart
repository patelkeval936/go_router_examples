import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String userName;
  const ProfilePage({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ProfilePage'),),
      body: Center(child: Text('Hello $userName'),),
    );
  }
}