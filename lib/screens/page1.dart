import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page1'),),
      body: Center(child:
      ElevatedButton(
        onPressed: (){
          GoRouter.of(context).goNamed('page2');
        }, child: Text(' go to page2'),
      ),
      ),
    );
  }
}

