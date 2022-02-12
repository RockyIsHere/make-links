// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({Key? key}) : super(key: key);

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController _textController = TextEditingController();

//     User? currentUser = FirebaseAuth.instance.currentUser;
//     final Stream<QuerySnapshot> _messages = FirebaseFirestore.instance
//         .collection('user')
//         .doc(currentUser!.uid)
//         .collection('messages')
//         .snapshots();

//     return Scaffold(
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _messages,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return const Text('Something went wrong');
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Text("Loading");
//           }

//           return GestureDetector(
//             onTap: () {},
//             child: Scaffold(
//               backgroundColor: const Color(0xff403b58),
//               appBar: AppBar(
//                 elevation: 0,
//                 toolbarHeight: MediaQuery.of(context).size.height * 0.1,
//                 backgroundColor: const Color(0xff403b58),
//                 leading: Padding(
//                   padding: const EdgeInsets.only(left: 3),
//                   child: IconButton(
//                     onPressed: () => Navigator.pop(context),
//                     icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//                   ),
//                 ),
//                 title: Row(
//                   children: const [
//                     // CircleAvatar(
//                     //   radius: 20,
//                     //   // backgroundImage: AssetImage("assets/images/energy/img_2.png"),
//                     //   backgroundImage:
//                     //       AssetImage("assets/icons/icons8-nurse-60.png"),
//                     // ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Text(
//                       'Chiron',
//                       style: TextStyle(color: Colors.white, fontSize: 22),
//                     ),
//                   ],
//                 ),
//               ),
//               body: Column(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       padding:const EdgeInsets.only(left: 10, right: 10, top: 20),
//                       decoration: BoxDecoration(
//                         border: Border.all(width: 0, color: Colors.white),
//                         color: Colors.white,
//                         borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(30),
//                             topRight: Radius.circular(30)),
//                       ),
//                       child: ListView.builder(
//                         physics: const BouncingScrollPhysics(),
//                         reverse: true,
//                         itemCount: snapshot.data!.docs.length,
//                         itemBuilder: (context, index) {
//                           return Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 8),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   // mainAxisAlignment: true
//                                   //     ? MainAxisAlignment.start
//                                   //     : MainAxisAlignment.end,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     // if (true)
//                                     //   const CircleAvatar(
//                                     //     radius: 15,
//                                     //     backgroundImage: AssetImage(
//                                     //         "assets/icons/icons8-nurse-60.png"),
//                                     //   ),
//                                     const SizedBox(
//                                       width: 5,
//                                     ),
//                                     Container(
//                                       padding:const EdgeInsets.all(10),
//                                       constraints: BoxConstraints(
//                                         maxWidth:
//                                             MediaQuery.of(context).size.width *
//                                                 0.6,
//                                       ),
//                                       decoration:BoxDecoration(
//                                               color: Colors.grey.shade200,
//                                               borderRadius:
//                                                   const BorderRadius.only(
//                                                 topLeft: Radius.circular(15),
//                                                 bottomRight:
//                                                     Radius.circular(15),
//                                               ),
//                                             ),
//                                       child: Text(
//                                         snapshot.data!.docs[index]['text'],
//                                         style:const TextStyle(fontSize: 14)
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 5,
//                                     ),
//                                     // if (!true)
//                                     //   const CircleAvatar(
//                                     //     radius: 15,
//                                     //     backgroundImage: AssetImage(
//                                     //         "assets/icons/profile.png"),
//                                     //   ),
//                                   ],
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:MainAxisAlignment.start
//                                   children: [
//                                     if (true)
//                                       const SizedBox(
//                                         width: 35,
//                                       ),
//                                     // Text(
//                                     //   _messages[index].time ?? "r",
//                                     //   style: const TextStyle(
//                                     //       color: Colors.black45,
//                                     //       fontSize: 11,
//                                     //       letterSpacing: 0.8),
//                                     // ),
//                                     if (!true)
//                                       const SizedBox(
//                                         width: 35,
//                                       ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   Container(
//                     color: Colors.white,
//                     height: 90,
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Container(
//                             height: 80,
//                             margin:
//                                 EdgeInsets.only(left: 20, top: 20, bottom: 20),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(30),
//                               color: Colors.grey.shade200,
//                             ),
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 18.0),
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                     child: TextField(
//                                       style: TextStyle(
//                                         color: Color(0xff403b58),
//                                       ),
//                                       controller: _textController,
//                                       decoration: const InputDecoration(
//                                         border: InputBorder.none,
//                                         hintText: "Type a message",
//                                         hintStyle: TextStyle(
//                                           color: Color(0xff403b58),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 20.0),
//                           child: IconButton(
//                             icon: Icon(
//                               Icons.add,
//                               color: Colors.black,
//                               size: 35,
//                             ),
//                             onPressed: () {
//                               if (_textController.text != "") {
//                                 FirebaseFirestore.instance
//                                     .collection('user')
//                                     .doc(currentUser.uid)
//                                     .collection('messages')
//                                     .add({
//                                   "text": _textController.text,
//                                 });
//                               }
//                               setState(() {
//                                 _textController.clear();
//                               });
//                               FocusScope.of(context).focusedChild;
//                             },
//                             iconSize: 5,
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );

//           // return ListView.builder(
//           //     itemCount: snapshot.data!.docs.length,
//           //     itemBuilder: (context, index) {
//           //       return Row(
//           //         children: [
//           //           Text(snapshot.data!.docs[index]['text']),
//           //           Text(snapshot.data!.docs[index]['text']),
//           //         ],
//           //       );
//           //     });
//         },
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   child: Icon(Icons.add),
//       //   onPressed: () {
//       //     FirebaseFirestore.instance
//       //         .collection('user')
//       //         .doc(currentUser!.uid)
//       //         .collection('messages')
//       //         .add({
//       //       "text": 'Firebase ki maa ki choot',
//       //     });
//       //   },
//       // ),
//     );
//   }
// }
