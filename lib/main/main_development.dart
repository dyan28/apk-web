import 'package:students/env/env_state.dart';

import 'app.dart';

Future<void> main() async {
  setupAndRunApp(env: EnvValue.development);
}
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Floating Button on Scroll',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             title: Text('Floating Button Example'),
//             floating: true,
//             snap: true,
//             // You can customize other properties of the SliverAppBar as needed
//           ),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (BuildContext context, int index) {
//                 // Your scrollable content goes here
//                 return ListTile(
//                   title: Text('Item $index'),
//                 );
//               },
//               childCount: 50, // Adjust the number of items as needed
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Add your button click logic here
//           print('Floating Button Clicked!');
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
