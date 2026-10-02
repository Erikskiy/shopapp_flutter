import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopapp/features/products/data/models/product_model.dart';
import 'package:shopapp/features/products/domain/entities/product_entity.dart';

class ProductFirebaseDatasource {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> add_product(ProductEntity product) async{
    final userId = firebaseAuth.currentUser?.uid;

    if (userId == null) {
      throw Exception("User is not authenticated");
    }

    await firebaseFirestore.collection("products").add({
      "name": product.name,
      "ownerId": userId,
      "category": product.category,
      "description": product.description,
      "imageUrl": product.imageUrl,
      "price": product.price,
      "sizes": product.sizes,
    });
  }

  Future<List<ProductEntity>> getMyProducts() async {
    final String userId = firebaseAuth.currentUser!.uid;

    final snapshot = await firebaseFirestore
        .collection("products")
        .where("ownerId", isEqualTo: userId)
        .get();

    return snapshot.docs.map((doc) {
      return ProductModel.fromJson(doc.data());
    }).toList();
  }
}