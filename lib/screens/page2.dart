import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page2'),),
      body: Center(child: ElevatedButton(
        onPressed: (){
          GoRouter.of(context).pushNamed('page3');
        }, child: Text(' go to page3'),
      ),),
    );
  }
}