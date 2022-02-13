import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:make_links/model/book.dart';

class BookController extends GetxController {
  final booksRef =
      FirebaseFirestore.instance.collection('books').withConverter<Book>(
            fromFirestore: (snapshot, _) => Book.fromSnapshot(snapshot),
            toFirestore: (book, _) => book.toJson(),
          );

  final books = <Book>[].obs;
  final ratingVal = 0.0.obs;

  Future<void> getBooks() async {
    var querySnapshot = await booksRef.get();
    var booksList = querySnapshot.docs
        .map(
          (doc) => doc.data(),
        )
        .toList();
    books.clear();
    books.addAll(booksList);
  }

  Future<void> submitRating(
      {required String bookId, required String review}) async {
    var rating =
        Rating(date: DateTime.now(), rating: ratingVal.value, review: review);
    FirebaseFirestore.instance
        .collection('books')
        .doc(bookId)
        .collection('ratings')
        .add(rating.toJson());
  }

  @override
  void onInit() async {
    await getBooks();
    super.onInit();
  }
}
