import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page3'),),
      body: Center(child:       ElevatedButton(
        onPressed: (){
          // GoRouter.of(context).pushNamed('page3');
        }, child: Text(' go to page3'),
      ),),
    );
  }
}