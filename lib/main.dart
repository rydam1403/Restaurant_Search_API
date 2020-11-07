import 'package:flutter/material.dart';
import 'SearchPage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'api.dart';

void main() async{
  await DotEnv().load('.env');

  final api = ZomatoApi(DotEnv().env['ZOMATO_API_KEY']);
  await api.loadCategories();


  runApp(
      MultiProvider(
        providers: [
          Provider(create: (context) => api),
          Provider(create: (context) => AppState()),
        ],
        child: RestaurantSearchApp(),
      ),
  );
}

class RestaurantSearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      home: SearchPage(),
    );
  }
}