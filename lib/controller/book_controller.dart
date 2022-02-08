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

  Future<void> getBooks() async {
    var querySnapshot = await booksRef.get();
    var booksList = querySnapshot.docs
        .map(
          (doc) => doc.data(),
        )
        .toList();
    books.clear();
    books.addAll(booksList);
    print(books.length);
  }

  @override
  void onInit() async {
    await getBooks();
    super.onInit();
  }
}
