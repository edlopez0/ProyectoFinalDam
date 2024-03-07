

import '../FirestoreObjects/FbUsuario.dart';
import 'FirebaseAdmin.dart';
import 'GeolocatorAdmin.dart';
import 'HttpAdmin.dart';

//creacion  de  clase estatica
class DataHolder{

  static final DataHolder _dataHolder= DataHolder._internal();

  late String textoBar;

  late FbUsuario selectedUsuario;
  //descargas
  FirebaseAdmin firebaseAdmin=FirebaseAdmin();
  //geolocator
  GeolocatorAdmin geolocatorAdmin=GeolocatorAdmin();
  //FirebaseFirestore db = FirebaseFirestore.instance;
  //gestiona todas las apis
  HttpAdmin adminHttp=HttpAdmin();

  DataHolder._internal(){
    textoBar="data holder ";

    }


    factory DataHolder(){
    return _dataHolder;
    }



 void loadCacheFbPost(){


 }


 }
