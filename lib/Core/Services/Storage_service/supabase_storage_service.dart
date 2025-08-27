import 'dart:io';
import 'dart:typed_data';
import 'package:e_commerce_dash_board_app/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseStorageService {
  Future<void> createBucket() async {
    final String bucketId = await supabase.storage.createBucket('imagesBucket');
  }

  Future<Uint8List> uploadFile(
      {required String pathOfFolder, required File myFile}) async {
    String fileName = b.basename(myFile.path);
    String Extention = b.extension(myFile.path);

    final imageFile = File('$pathOfFolder/$fileName.$Extention');

    final String fullPath = await supabase.storage.from('imagesBucket').upload(
          '${myFile.path}',
          imageFile,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
        );

    final Uint8List file =
        await supabase.storage.from('imagesBucket').download('${myFile.path}');

    return file;
  }
}
