import 'package:chronosync/model/activity.dart';
import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class ActivityDatabase extends ChangeNotifier {
  static late Isar isar;

  // I N I T I A L I Z E  D A T A B A S E
  static Future<void> initialize() async{
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [ActivitySchema],
      directory: dir.path,
    );
  }

  final List<Activity> currentActivity = [];


  // C R E A T E - A C T I V I T Y
  Future<void> addActivity(String activityTitle, String activityDetails, String activityCategory, DateTime activityDate) async{

    // Creating a new Activity Object with relevant details
    final newActivity = Activity()
      ..title = activityTitle
      ..details = activityDetails
      ..category = activityCategory
      ..date = activityDate;

    // Writing to the Database
    await isar.writeTxn(() => isar.activitys.put(newActivity));

    // Read all the Activities
    fetchActivity();
  }

  // R E A D - A C T I V I T Y
  Future<void> fetchActivity() async{
    List<Activity> fetchedActivity = await isar.activitys.where().findAll();
    fetchedActivity.sort((first, second) => first.date!.compareTo(second.date!));
    currentActivity.clear();
    currentActivity.addAll(fetchedActivity);
    notifyListeners();
  }

  // U P D A T E - A C T I V I T Y
  Future<void> updateActivity(int id, String newTitle, String newDetails, String newCategory, DateTime newDate) async{
    final existingActivity = await isar.activitys.get(id);

    if(existingActivity != null){
      existingActivity.title = newTitle;
      existingActivity.details = newDetails;
      existingActivity.category = newCategory;
      existingActivity.date = newDate;

      await isar.writeTxn(() => isar.activitys.put(existingActivity));
      await fetchActivity();
    }
  }

  // D E L E T E - A C T I V I T Y
  Future<void> deleteActivity(int id) async{
    await isar.writeTxn(() => isar.activitys.delete(id));
    await fetchActivity();
  }


}