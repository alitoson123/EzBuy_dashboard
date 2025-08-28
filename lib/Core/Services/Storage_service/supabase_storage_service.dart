import 'dart:io';
import 'package:e_commerce_dash_board_app/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseStorageService {
  Future<void> createBucket() async {
    final String bucketId = await supabase.storage.createBucket('imagesBucket');
  }

  Future<String> uploadFile(
      {required String pathOfFolder, required File myFile}) async {
    String fileName = b.basename(myFile.path);
    String Extention = b.extension(myFile.path);

    final imagePath = '$pathOfFolder/$fileName.$Extention';

    final String imageUrl = await supabase.storage.from('imagesBucket').upload(
          imagePath,
          myFile,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
        );
    final String publicUrl =
        supabase.storage.from('imagesBucket').getPublicUrl(imagePath);
  
    return publicUrl;
  }
}
