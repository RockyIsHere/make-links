import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'book.g.dart';

@JsonSerializable(explicitToJson: true)
class Book {
  String? id;
  String? type;
  String? name;
  String? publisher;
  DateTime? date;
  String? imgUrl;
  double? score;
  double? rating;
  String? content;
  double? height;

  @JsonKey(ignore: true)
  DocumentReference? reference;

  Book({
    this.id,
    this.type,
    this.name,
    this.publisher,
    this.date,
    this.imgUrl,
    this.score,
    this.rating,
    this.content,
    this.height,
    this.reference,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);

  static fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final book = Book.fromJson(snapshot.data() as Map<String, dynamic>);
    book.reference = snapshot.reference;
    book.id = snapshot.reference.id;
    return book;
  }
}

@JsonSerializable(explicitToJson: true)
class Rating {
  DateTime? date;
  double? rating;
  String? review;

  Rating({this.date, this.rating, this.review});

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
  Map<String, dynamic> toJson() => _$RatingToJson(this);
}

List<Book> books = [
  Book(
    type: 'Bangla choti golpo',
    name: 'সুপর্ণা বৌদি কে চুদলাম',
    publisher: 'Share Story',
    date: DateTime.now(),
    imgUrl: 'assets/images/book8.jpg',
    score: 4.7,
    rating: 893,
    content:
        'Hello বন্ধুরা,আমি আজ তোমাদের সবাই কে আমার জীবনের এক সত্যি ঘটনা বলবো।আমি আগে তোমাদের নিজের পরিচয় দিয়ে দিই,আমার নাম রকি ,বাড়ি আমার বারাসাতে,আমার বয়স ২৪ বছর । আমার Lund এর সাইজ ৬.৫ ইঞ্চ লম্বা ,২.৫ ইঞ্চ মোটা । যেকোনো ধরনের মেয়ের মনের সান্তনা মেটাতে পারে।দেরি না করে গল্প তে আসি বন্ধুরা ।এই ঘটনা টা ১ মাস আগেকার । আমি আমার বাড়ির পাশে সুপর্ণা বৌদির বাড়ি ,বৌদি দেখতে দারুন ,২৪ বয়সী মেয়ে ,দু হাত দিয়ে ধরা যায় এরকম বড় বড় দূধ।গেল অগ্রহায়ন মাসে বিয়ে হয়ে এসেছে । পাশের বাড়ির দাদার বয়স অনেক বেশি ৪২ বছর প্রায় , সরকারি চাকরি করে বলে এমন স্লিম ফিগার কচি মেয়ে কে পেয়েছে ,দাদা কর্মসূত্রে কলকাতা পুলিশ বেশির ভাগ সময় টা দিউটি তে থাকে । সুপর্ণা আর আমার বয়স একদম সেম ।এই থেকে আমাদের বন্ধুত্বও হয়ে যায় খুব সহজেই । বৌদির উপর আমার একটু অন্য রকম নজর ছিল ,বৌদি ওটা বুঝতেও পারে ,কিন্তু কিছু বলিনি বরং ওকেও ভালই লাগত ,দাদা যখন কাজে যেত ওই সময় প্রায় আমি গিয়ে বৌদির সাথে ইয়ার্কি করতাম ,মাঝে মাঝে হাত ধরা ধরি করতাম ,বৌদির নরম নরম গাল ধরতাম ,বৌদি  বেশ মজা পেত ,এর পর আমাদের সম্পর্ক টা আরো কাছাকাছি চলে আসে ,বৌদি আমাকে খুব চাইত আর আমিও বৌদি কে খুব চাইতে লেগেছিলাম । একদিন থাকতে না পেরে বৌদি কে জড়িয়ে ধরে কিস করলাম বৌদি ও আমাকে জড়িয়ে ধরলো আমাকে ছাড়তেই চাইছিল না ।একদিন বৃষ্টি পড়ছিল আমি বৌদির বাড়ি গেলাম,দাদা বাড়ীতে ছিল না ,দাদা বন্ধুদের সাঠে ঘুরতে গেছিলো ।বৌদি বাড়ীতে একা ছিল।দেখলাম বৌদি বসে বসে কি ভাবছে ...আমি: কি ভাবছো বৌদি ?বৌদি : তেমন কিছু না গোতারপর আমি বললাম : বলো না বউদি pls  বলোবৌদি বলল:তুমি প্রথমে দিব্বি দাও কাওকে বলবা নাআমি: আমি তো এমনি তে কাওকে তোমার কথা বলি নাবৌদিএমন কি হয়েছে গো ?বৌদি : তোমার দাদা আমাকে আদর করতে পারে না ।একটু তেই শেষ হয়ে যায়আমি: ও আচ্ছাসুপর্ণা : তুমি আমাকে এই সুখ দিতে পারবে ?আমি: কিন্তু বৌদি এটাতো খুব অন্যরকম হয়ে যাচ্ছে তাই না!বৌদি : তোমাকে এত ভালবাসি ,তোমাকে বলবো নয়তো অন্য কাওকে বলব নাকি?আমি :না না বৌদি ঠিক আছেবৌদি : আমাকে আজকেই আদর করো আমি থাকতে  পারছি নাআমি:আজকেই করতে হবে ?বৌদি : হা আজকেই , আজ তুমি যায় করো আজকে আমাকে নিজের করে নাও সোনা ,আমি আর থাকতে পারছি নাআমি: এই কথা শুনেই আমি বৌদি কে কাছে টেনে নিলাম একদম শক্ত করে জড়িয়ে ধরলাম ,কিস করতে লাগলাম দুজনইবৌদির ঠোঁট খুব নরম ছিল, গোলাপী গোলাপী ঠোঁট কি আর বলবো !এর পর আমরা চুমু খেতে লাগলাম গালে ,কপালে ,আমি বৌদির দুধ ও টিপতে শুরু করলাম,বৌদি নিজের হাত দিয়ে আমার মাথার উপর ধরে রেখেছিল১০-১৫ মিনিট পর আমরা আলাদা হলাম ।বৌদি আমাকে বললো আমি আর থাকতে পারছি না আমাকে নিজের করে নাওআমি আস্তে আস্তে বৌদির শাড়ি খুললাম,বৌদি  কাল রং এর সায়া পরে ছিল ,কাল সায়ার মধ্যে বৌদির সাদা কাপড় আ: কি বলবো দেখে আমার পুরো খাড়া হয়ে গেলোআমি এরপর প্যান্ট খুললামবৌদি আমার ওটা দেখে খুব খুশি হয়ে গেলোআমি বৌদি কে হাটুগেড়ে  বসলাম বৌদি কে বললাম চুসোবৌদি দেরি না করে একদম নিজের মত করে চুষতে শুরু করলো ,বলতে লাগলো আজকে এটা শুধু আমার ১০-১৫ মিনিট চুসানোর পর আমি বললাম বউদি আমার মাল পড়বেবৌদি: আমার মুখে ফেলে দাও সোনাআমি : দু হাত e বৌদির মাথা ধরে জোরে জোরে ৮-১০ মুখের মধ্যে ঠাপ মারলাম ,আমার মাল বেরিয়ে গেলবৌদি আমার মাল কে একদম আইস ক্রিম এর মত করে পুরো খেয়ে নিলআমি শান্ত হয়ে পড়লামবৌদি : আজ তো তুমি শুধু আমার এই বলে বৌদি আমাকে নিজের সায়ার মধ্যে মাথা ঢুকিয়ে দিলোবৌদির বুর থেকে ও: কি দারুন সেন্ট আসছিল,হালকা হালকা চুলগোলাপি রং এর বুর ,মনে হচ্ছে যেন সর্গআমি বৌদি কে বিছানায় শুয়িয়ে বৌদির বুর এ জিভ দিলাম ,বৌদি একদম আতকে উঠলো,৪-৫ বার জীভ দিয়ে চাটা দিতেই পুরো জল এ আমার মুখ ভিজে গেলোমনে হচ্ছে সর্গের অমৃত খাচ্ছি।বৌদি হাত দিয়ে আমার মাথা কে শক্ত করে নিজের বুর এ চেপে ধরল ,মুখে বলতে লাগলো চুস চুস ,আমাকে চুষে পুরো খেয়ে নাও সোনাবৌদির এই কথা শুনে আমি আরো জোড়ে জোড়ে চুষতে লাগলাম , বৌদির বুর এ আঙুল করতে করতে বৌদি একদম ঝেড়ে দিল ঝর্নার জল ।আমার মুখ পুরো ভিজে সান করে গেছে ।বৌদি: আমি পারছি না আমাকে চুদো আমাকে চুদোআমি বৌদি কে বিছানায় শুইয়ে পা ফাঁক করলামআমার ওটা তে থুতু দিয়ে বৌদির বুর এর রেখে ঘুসলাম বৌদি বলল আর কত অপেক্ষা সোনা চুদো না আমায় চুদোআমি : ধীরে ধীরে শুধু আগাল টা ঢুকালাম ,ভিতর টা এতো গরম কি বলবো আমার একদম ৬.৫ ইঞ্চ টা আস্তে আস্তে বৌদির বুর এ ভরে দিলাম ।বৌদি থাকতে না পেরে আমাকে জড়িয়ে ধরে পা আরো ফাঁক করলোআমি আস্তে আস্তে ধাক্কা মারতে লাগলাবৌদির যান একদম বেরিয়ে গেল, বৌদি অনেক সময় পর সেক্স করছে ,বৌদি আমাকে বললো সোনা একটু বাইরে বের করো না হলে আমি মরে যাবোআমি: না সোনা এটা আর বাইরে আসবে না বলে আমি ধাক্কা মারতে শুরু করলামকিছুক্ষণ ব্যাথা হওয়ার পর বৌদির ব্যাথা এবার মজা তে পেয়েছে বৌদি এবার নিজেই হালকা হালকা লাফিয়ে আমার সাথ দিচ্ছে আমার স্পীড আরো জোড়ে হয়ে গেলোবৌদির দূদু একদম লাফাচ্ছে দেখেতে সেই লাগছে ,আমি থাপ্পড় মারতে লাগলাম দুধে।বৌদি : প্লিজ রকি আমাকে জোরে চুদো আমাকে জোরে চোদো ,আমাকে চুঁদে পাগল করে দাওএরপর আমি বৌদি কে ডগি স্টাইলে চুদলাম ,বৌদি ২ বার জল বার করে দিলছে ,তবুও বলছে আজকে আমাকে চুঁদে চুঁদে শেষ করে দাও সোনা ।এরপর বৌদি কে দেওয়াল এ দার করিয়ে পেছন থেকে চুদলাম।বৌদির উঠিয়ে নিজের উপর বসিয়ে চুদলাম ।এর পর আবার বিছানায় শুইয়ে ২৫-৩০ মিনিট চুদার  পর আমি বৌদিকে বললাম বউদি আমার মাল বেরোবে ,বৌদি বলল আমার ভিতরে ফেলে দাও সোনা ,আমি জোড়ে জোড়ে ঠাপ মেরে আমার সব মাল বৌদির বুর এ বার করে দিলামবৌদি আমার উপর শুয়ে থাকলো আমিও বৌদি কে জড়িয়ে ধরে শুয়ে থাকলাম , এরপর বৌদি কে নিজের হাত এ সারি পরিয়ে দিলাম বৌদি আমাকে ড্রেস পরিয়ে দিল আমাকে কিস করলো ,দিয়ে আমি বাড়ি ফিরে এলাম ।',
    height: 380.0,
  ),
  Book(
    type: 'history',
    name: 'Dark world',
    publisher: 'The INk',
    date: DateTime.now(),
    imgUrl: 'assets/images/book1.jpeg',
    score: 4.7,
    rating: 893,
    content:
        'I failed the first quarter of a class in school, so I made a fake report card. I did this every quarter that year. I forgot that they mail home the und year cards, and my mom got it before I could intercept',
    height: 290.0,
  ),
  Book(
    type: 'history',
    name: 'Dark world',
    publisher: 'The INk',
    date: DateTime.now(),
    imgUrl: 'assets/images/book7.jpg',
    score: 4.7,
    rating: 893,
    content:
        'I failed the first quarter of a class in school, so I made a fake report card. I did this every quarter that year. I forgot that they mail home the und year cards, and my mom got it before I could intercept',
    height: 290.0,
  ),
  Book(
    type: 'history',
    name: 'Dark world',
    publisher: 'The INk',
    date: DateTime.now(),
    imgUrl: 'assets/images/book2.jpeg',
    score: 4.7,
    rating: 893,
    content:
        'I failed the first quarter of a class in school, so I made a fake report card. I did this every quarter that year. I forgot that they mail home the und year cards, and my mom got it before I could intercept',
    height: 220.0,
  ),
  Book(
    type: 'history',
    name: 'Dark world',
    publisher: 'The INk',
    date: DateTime.now(),
    imgUrl: 'assets/images/book3.jpeg',
    score: 4.7,
    rating: 893,
    content:
        'I failed the first quarter of a class in school, so I made a fake report card. I did this every quarter that year. I forgot that they mail home the und year cards, and my mom got it before I could intercept',
    height: 280.0,
  ),
  Book(
    type: 'history',
    name: 'Dark world',
    publisher: 'The INk',
    date: DateTime.now(),
    imgUrl: 'assets/images/book4.jpeg',
    score: 4.7,
    rating: 893,
    content:
        'I failed the first quarter of a class in school, so I made a fake report card. I did this every quarter that year. I forgot that they mail home the und year cards, and my mom got it before I could intercept',
    height: 270.0,
  ),
  Book(
    type: 'history',
    name: 'Dark world',
    publisher: 'The INk',
    date: DateTime.now(),
    imgUrl: 'assets/images/book5.jpeg',
    score: 4.7,
    rating: 893,
    content:
        'I failed the first quarter of a class in school, so I made a fake report card. I did this every quarter that year. I forgot that they mail home the und year cards, and my mom got it before I could intercept',
    height: 290.0,
  ),
  Book(
    type: 'history',
    name: 'Dark world',
    publisher: 'The INk',
    date: DateTime.now(),
    imgUrl: 'assets/images/book5.jpeg',
    score: 4.7,
    rating: 893,
    content:
        'I failed the first quarter of a class in school, so I made a fake report card. I did this every quarter that year. I forgot that they mail home the und year cards, and my mom got it before I could intercept',
    height: 290.0,
  ),
];
