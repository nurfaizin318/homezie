
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:homzie/Binding/binding.dart';
import 'package:homzie/Service/dioInterceptor.dart';
import 'package:homzie/Theme/appTheme.dart';
import 'package:homzie/Utils/Extention/Storage/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alice/alice.dart';

import 'Routes/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox(StorageKey.Provider.value);

  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
 late Alice _alice;
  late Dio _dio;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


    // TODO: implement initState
  @override
  void initState() {
    super.initState();

    _alice = Alice(
      showNotification: true,
      showInspectorOnShake: true,
      maxCallsCount: 1000,
      navigatorKey: navigatorKey
    );
    _alice.setNavigatorKey(navigatorKey);
     _alice.showInspector();
    _dio = Dio(BaseOptions(
      followRedirects: false,
    ));
    _dio.interceptors.add(_alice.getDioInterceptor());
    _dio.interceptors.add(RequestInterceptor());
    
  }


  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      navigatorKey: _alice.getNavigatorKey(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/onboarding',
      initialBinding: OnBoardingBinding(),
      getPages: Routes.pages,
      theme: AppTheme.themeData,
    );
  }
}
