import 'package:e_commerce_dash_board_app/Core/Navigate/navigate.dart';
import 'package:e_commerce_dash_board_app/Core/Services/Bloc_observes_service/my_Bloc_observe.dart';
import 'package:e_commerce_dash_board_app/Core/Services/service_locator/sevice_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'firebase_options.dart';

const supabaseUrl = 'https://gojriwndlyerhgloekom.supabase.co';
const supabaseKey = String.fromEnvironment('SUPABASE_KEY');
Future<void> main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

  setup();
  Bloc.observer = MyBlocObserver();

 // await Hive.initFlutter();
 // Hive.registerAdapter(UserModelAdapter());
 // await Hive.openBox<UserModel>(KUserBox);

  runApp(const EzBuy());
}
final supabase = Supabase.instance.client;


class EzBuy extends StatelessWidget {
  const EzBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: Navigate().goRouter,
     
    );
  }
}
