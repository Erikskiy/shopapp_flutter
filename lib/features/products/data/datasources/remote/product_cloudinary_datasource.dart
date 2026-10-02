import 'dart:io';
import 'package:cloudinary/cloudinary.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProductCloudinaryDatasource {
  final Cloudinary cloudinary = Cloudinary.unsignedConfig(
    cloudName: dotenv.env["CLOUDINARY_CLOUD_NAME"]!,
  );

  Future<String> uploadProductImage(File image) async {
    final response = await cloudinary.unsignedUpload(
      file: image.path,
      uploadPreset: dotenv.env["CLOUDINARY_PRODUCT_PRESET"]!,
      resourceType: CloudinaryResourceType.image,
    );

    if (!response.isSuccessful) {
      throw Exception(response.error);
    }

    return response.secureUrl!;
  }
}