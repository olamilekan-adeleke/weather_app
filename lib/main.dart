import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/features/home/views/screen/home_page.dart';


import 'features/home/binding/home_bindging.dart';
import 'features/notiification/service/back_ground_worker_service.dart';

Future<void> main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await BackgroundWorkerService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (_, __, ___) {
        return GetMaterialApp(
          title: 'Weather App',
          theme: ThemeData(primarySwatch: Colors.blue),
          debugShowCheckedModeBanner: false,
          // home: const HomeScreen(),
          initialRoute: '/',
          getPages: pages(),
        );
      },
    );
  }
}


List<GetPage<dynamic>>? pages() {
  return <GetPage<dynamic>>[
    GetPage<Widget>(
      page: () => const HomeScreen(),
      name: '/',
      binding: HomeBindings(),
    ),
    
  ];
}
