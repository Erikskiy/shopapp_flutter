import 'dart:io';
import 'package:cloudinary/cloudinary.dart';

class AccountCloudinaryDatasource {
  final Cloudinary cloudinary = Cloudinary.unsignedConfig(
    cloudName: "irijodtd",
  );

  Future<String> uploadAvatar(File image) async {
    final response = await cloudinary.unsignedUpload(
      file: image.path,
      uploadPreset: "shopapp",
      resourceType: CloudinaryResourceType.image,
    );

    if (!response.isSuccessful) {
      throw Exception(response.error);
    }

    return response.secureUrl!;
  }
}