import 'package:cloud_firestore/cloud_firestore.dart';

class SchoolDao {
  static final String FS_NAME = "Name";
  static final String FS_PLACE = "Ort";
  static final String FS_CANTON = "Kanton";

  static final String DB_SCHOOL = "Schulen";

  static final SchoolDao _instance = new SchoolDao._internal();

  factory SchoolDao(){
    return _instance;
  }

  SchoolDao._internal();


  Future<void> saveSampleSchool() async {
    return Firestore.instance.collection(DB_SCHOOL).document()
        .setData({
      FS_NAME: 'Schule',
      FS_PLACE: 'Hünibach',
      FS_CANTON: 'Bern'
    });
  }

  Future<void> saveSchool(String name, String place, String canton) async {
    return Firestore.instance.collection(DB_SCHOOL).document()
        .setData({
      FS_NAME: name,
      FS_PLACE: place,
      FS_CANTON: canton
    });
  }
}