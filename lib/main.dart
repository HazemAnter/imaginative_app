import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imaginative_news_app/layout/cubit/states.dart';
import 'package:imaginative_news_app/layout/layout.dart';
import 'package:imaginative_news_app/screens/create_screens/create_page_screen/create_page_screen_cubit/create_page_screen_cubit.dart';
import 'package:imaginative_news_app/screens/details_screens/details_Screens_cubit/details_Screens_cubit.dart';
import 'package:imaginative_news_app/shared/network/dio_helper.dart';
import 'package:imaginative_news_app/shared/style/themes.dart';
import 'layout/cubit/cubit.dart';
import 'shared/bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (BuildContext context)=>MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => CreatePageScreenCubit()),
        BlocProvider(create: (context) => DetailsScreensCubit()),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            home: LayoutScreen(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
