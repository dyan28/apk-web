import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Floating Button Example'),
            floating: true,
            snap: true,
            // You can customize other properties of the SliverAppBar as needed
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // Your scrollable content goes here
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 50, // Adjust the number of items as needed
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your button click logic here
          print('Floating Button Clicked!');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
