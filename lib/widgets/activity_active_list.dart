import 'package:chronosync/model/activity.dart';
import 'package:chronosync/model/activity_database.dart';
import 'package:chronosync/pages/deadline_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ActiveActivityList extends StatefulWidget {
  const ActiveActivityList({super.key});

  @override
  State<ActiveActivityList> createState() => _ActiveActivityListState();
}

class _ActiveActivityListState extends State<ActiveActivityList> {

  void readActivities(){
    context.watch<ActivityDatabase>().fetchActivity();
  }

  @override
  void didChangeDependencies() {
    readActivities();
    super.didChangeDependencies();

  }

  @override
  Widget build(BuildContext context) {

    final activityDatabase = context.watch<ActivityDatabase>();
    List<Activity> currentActivity = activityDatabase.currentActivity;

    if(currentActivity.isEmpty){
      return const Center(
        child: Text('NO DATA'),
      );
    }
    else {
      return ListView.separated(
          itemBuilder: (BuildContext context, int index){
            final activity = currentActivity[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx)=>
                          DeadlineDetails(
                            title: activity.title!,
                            details: activity.details!,
                            date: activity.date!,
                            category: activity.category!,
                          ),
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      child: Image(
                        image: AssetImage('assets/images/Celebrations.png'),
                      ),
                    ),
                    title: Text(activity.title!,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      ),),
                    subtitle: Text(DateFormat.yMMMd().format(activity.date!).toString(),
                      style: const TextStyle(
                          fontSize: 16
                      ),),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index){
            return const SizedBox(height: 5);
          },
          itemCount: currentActivity.length);
    }
  }
}


