// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:se7ety/components/cards/doctor_card.dart';
// import 'package:se7ety/core/services/firebase/firestore_services.dart';
// import 'package:se7ety/features/auth/models/doctor_model.dart';

// //* Firestore CRUD operations: Collection => list of docs => doc (id, data())
// //! Get
// // 1) specific document => collection.doc(id).get()
// // 2) list of documents :
// // - get all docs (Future) => collection.get()
// // - get all docs (Stream) => collection.snapshots()
// // - sorted docs => collection.orderBy('field', descending: true/false).get()
// // - filtered docs => collection.where('field', isEqualTo/lessThan/greaterThan: value).get()
// // - search docs => collection.orderBy('field').startAt(['ali']).endAt(['value\uf8ff']).get()
// // - paginated docs => collection.orderBy('field').limit(n).get()
// // - combined queries => collection.where(...).orderBy(...).limit(n).get()

// //! Set
// //  add new document with auto id => collection.doc(id/null).set(data) // random or specific id
// // add new document with custom id => collection.add(data) // auto increment id

// //! Update
// //  update existing document => collection.doc(id).update(data)

// //! Delete
// //  delete document => collection.doc(id).delete()

// class TopRatedList extends StatefulWidget {
//   const TopRatedList({super.key});

//   @override
//   State<TopRatedList> createState() => _TopRatedListState();
// }

// class _TopRatedListState extends State<TopRatedList> {
//   @override
//   Widget build(BuildContext context) {
//     // return FutureBuilder(
//       // future: FirestoreServices.sortDoctorsByRating(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (!snapshot.hasData) {
//           return const Center(
//             child: CircularProgressIndicator(value: .9, color: Colors.black12),
//           );
//         } else {
//           return ListView.builder(
//             physics: const NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemCount: snapshot.data?.docs.length, // all doctors in firebase
//             itemBuilder: (context, index) {
//               DoctorModel doctor = DoctorModel.fromJson(
//                 snapshot.data?.docs[index].data() as Map<String, dynamic>,
//               );

//               // return DoctorCard(doctor: doctor);
//             },
//           );
//         }
//       },
//     );
//   }
// }
