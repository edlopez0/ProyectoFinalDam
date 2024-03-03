import 'package:flutter/material.dart';


import 'LivePlan.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  LivePlan livePlan=const LivePlan();
  runApp(livePlan);
}
