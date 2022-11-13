import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalapp/utility/firestore/user_service.dart';

class TaskService {
  savaTaskData(
    String name,
    String phone,
    List<Timestamp> date,
    String city,
    String area,
  ) async {
    final userData = await UserService().getUserData();
    // FirebaseFirestore.instance
    //     .collection(userDocumentData['org'])
    //     .doc('data')
    //     .collection('tasks')
    //     .add(
    //   {
    //     "name": name,
    //     "phone": phone,
    //     "date": date,
    //     "city": city,
    //     "area": area,
    //   },
    // );
  }
}
