import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as b;

class StarageService {
  final storageRef = FirebaseStorage.instance.ref();

  Future<String> UploadFile(
      {required String pathOfFolder, required File myFile}) async {
    String fileName = b.basename(myFile.path);
    String Extention = b.extension(myFile.path);

    final refOfFile = storageRef.child("$pathOfFolder/$fileName.$Extention");

    await refOfFile.putFile(myFile);

    String fileUrl = await refOfFile.getDownloadURL();

    return fileUrl;
  }
}
