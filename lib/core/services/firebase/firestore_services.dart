import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:se7ety/features/patient/booking/data/appointment_model.dart';

class FirestoreServices {
  static final CollectionReference _doctorCollection = FirebaseFirestore
      .instance
      .collection('doctor');
  static final CollectionReference _appointmentCollection = FirebaseFirestore
      .instance
      .collection('appointment');
  // static final CollectionReference _patientCollection = FirebaseFirestore
  //     .instance
  //     .collection('doctor');

  static Future<QuerySnapshot> sortDoctorsByRating() {
    return _doctorCollection
        .orderBy('rating', descending: true)
        .where("specialization", isNull: false)
        .get();
  }

  static Future<QuerySnapshot> filterDoctorsBySpecialization(
    String specialization,
  ) {
    return _doctorCollection
        .where("specialization", isEqualTo: specialization, isNull: false)
        .get();
  }

  static Future<QuerySnapshot> getDoctorsByName(String searchKey) {
    return _doctorCollection
        .orderBy('name')
        .where("specialization", isNull: false)
        .startAt([searchKey])
        .endAt(['$searchKey\uf8ff'])
        .get();
  }

  static Future<void> createAppointment(AppointmentModel appointment) {
    return _appointmentCollection.doc(appointment.id).set(appointment.toJson());
  }

  static Future<QuerySnapshot> getAppointmentsByPatientId() {
    String patientId = FirebaseAuth.instance.currentUser!.uid;
    return _appointmentCollection
        .where('patientID', isEqualTo: patientId)
        .get();
  }

  static Future<QuerySnapshot> getAppointmentsByDoctorId() {
    String patientId = FirebaseAuth.instance.currentUser!.uid;
    return _appointmentCollection.where('doctorID', isEqualTo: patientId).get();
  }

  static Future<void> deleteAppointment(String appointmentId) {
    return _appointmentCollection.doc(appointmentId).delete();
  }
}