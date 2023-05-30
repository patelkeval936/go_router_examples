import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_practice/go_router/route_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: IndexedStack(
          index: selectedIndex,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.go('home/page1');
                  },
                  child: const Text('Page 1 from home page')),

              ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push('/page1');
                  },
                  child: const Text('Page 1 from profile Page')),

            ],
          ),

      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_max_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.verified_user), label: 'User')
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          print(selectedIndex);
        },
      ),
    );
  }
}
