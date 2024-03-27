import 'package:chronosync/model/activity_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddDeadlines extends StatefulWidget {
  const AddDeadlines({super.key});

  @override
  State<AddDeadlines> createState() => _AddDeadlinesState();
}

class _AddDeadlinesState extends State<AddDeadlines> {
  late String category;
  DateTime? deadlineDate;
  // late String notificationDay;

  final deadlineNameController = TextEditingController();
  final deadlineDetailsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    category = '';
    // notificationDay = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Add an Activity',
          style: TextStyle(
              fontWeight: FontWeight.w700
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xffFF4E50),
                    Color(0xffF9D423)
                  ])
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: deadlineNameController,
                  maxLength: 25,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Name of the Activity',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          width: 3,
                          color: Colors.green
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                        width: 2,
                      )
                    )
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: deadlineDetailsController,
                  maxLength: 250,
                  maxLines: 8,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  minLines: 1,
                  decoration: InputDecoration(
                    labelText: 'Details',
                      hintText: 'Details about the Activity',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 3,
                            color: Colors.green
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 2,
                          )
                      )
                  ),
                ),
              ),
              const SizedBox(height: 10),
              DropdownMenu(
                dropdownMenuEntries: const [
                  DropdownMenuEntry(
                    value: 'Birthday',
                    label: 'Birthday',
                  ),
                  DropdownMenuEntry(
                    value: 'Cleaning',
                    label: 'Cleaning',
                  ),
                  DropdownMenuEntry(
                    value: 'Cooking',
                    label: 'Cooking',
                  ),
                  DropdownMenuEntry(
                    value: 'Date',
                    label: 'Date',
                  ),
                  DropdownMenuEntry(
                    value: 'Exams',
                    label: 'Exams',
                  ),
                  DropdownMenuEntry(
                    value: 'Financials',
                    label: 'Financials',
                  ),
                  DropdownMenuEntry(
                    value: 'Formal',
                    label: 'Formal Events',
                  ),
                  DropdownMenuEntry(
                    value: 'Gardening',
                    label: 'Gardening',
                  ),
                  DropdownMenuEntry(
                    value: 'Informal',
                    label: 'Informal Events',
                  ),
                  DropdownMenuEntry(
                    value: 'Job',
                    label: 'Job Activities',
                  ),
                  DropdownMenuEntry(
                    value: 'Projects',
                    label: 'Personal Projects',
                  ),
                  DropdownMenuEntry(
                    value: 'Servicing',
                    label: 'Servicing',
                  ),
                  DropdownMenuEntry(
                    value: 'Shopping',
                    label: 'Shopping',
                  ),
                  DropdownMenuEntry(
                    value: 'Travel',
                    label: 'Travel',
                  ),
                  DropdownMenuEntry(
                    value: 'Workout',
                    label: 'Workout',
                  ),
                ],
                inputDecorationTheme: const InputDecorationTheme(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        width: 2
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        width: 2
                    ),
                  ),
                ),
                label: const Text('Select the type of Activity'),
                helperText: 'Choose the Category the Activity falls under',
                width: MediaQuery.of(context).size.width * 0.9,
                onSelected: (String? selectedCategory){
                  if(selectedCategory !=null){
                    setState(() {
                      category = selectedCategory;
                    });
                  }
                  },
              ),
              const SizedBox(height: 15),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      const Text('Date of the Activity',
                        style: TextStyle(
                            //fontWeight: FontWeight.w400,
                            fontSize: 16
                        ),
                      ),
                      const SizedBox(width: 10),
                      TextButton.icon(
                        style: const ButtonStyle(
                            fixedSize: MaterialStatePropertyAll<Size>(Size(180, 50))
                        ),
                        onPressed: () async{
                          final pickedDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(
                              const Duration(days: 180),
                            ),
                          );
                          if(pickedDate != null && pickedDate != deadlineDate){
                            setState(() {
                              deadlineDate = pickedDate;
                            });
                          }
                        },
                        icon: const Icon(
                          Icons.calendar_month,
                          color: Colors.indigoAccent,
                        ),
                        label: Text(
                          deadlineDate == null
                              ? 'Calendar'
                              :DateFormat.yMMMd().format(deadlineDate!).toString(),
                          style: const TextStyle(
                              color: Colors.indigoAccent,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // const SizedBox(height: 35),
              // DropdownMenu(
              //     dropdownMenuEntries: const [
              //       DropdownMenuEntry(
              //           value: 'Same Day',
              //           label: 'Same Day of the Activity',
              //       ),
              //       DropdownMenuEntry(
              //         value: 'One Day Before',
              //         label: 'One Day Before the Date of the Activity',
              //       ),
              //       DropdownMenuEntry(
              //         value: 'Two Days Before',
              //         label: 'Two Days Before the Date of the Activity',
              //       ),
              //       DropdownMenuEntry(
              //         value: 'Three Days Before',
              //         label: 'Three Days Before the Date of the Activity',
              //       ),
              //       DropdownMenuEntry(
              //         value: 'One Week Before',
              //         label: 'One Week Before the Date of the Activity',
              //       ),
              //     ],
              //   inputDecorationTheme: const InputDecorationTheme(
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(10)),
              //       borderSide: BorderSide(
              //           width: 2
              //       ),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(10)),
              //       borderSide: BorderSide(
              //           width: 2
              //       ),
              //     ),
              //   ),
              //   label: const Text('Notification Date'),
              //   helperText: 'Receive an Alert on this Day',
              //   width: MediaQuery.of(context).size.width * 0.9,
              //   onSelected: (String? pickedDay){
              //     if(pickedDay !=null){
              //       setState(() {
              //         notificationDay = pickedDay;
              //       });
              //     }
              //   },
              // ),
              const SizedBox(height: 35),
              ElevatedButton.icon(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.lightGreenAccent),
                    foregroundColor: MaterialStatePropertyAll<Color>(Colors.black87),
                    fixedSize: MaterialStatePropertyAll<Size>(Size(175, 50))
                ),
                icon: const Icon(Icons.check_rounded),
                label: const Text('Add',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800
                  ),
                ),
                onPressed: (){
                  createActivity();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createActivity() async{
    final title = deadlineNameController.text;
    final details = deadlineDetailsController.text;

    if(title.isEmpty){
      return ;
    }
    if(details.isEmpty){
      return ;
    }
    if(category.isEmpty){
      return ;
    }
    if(deadlineDate == null){
      return ;
    }
    await context.read<ActivityDatabase>().addActivity(
        title,
        details,
        category,
        deadlineDate!,
    );

    deadlineNameController.clear();
    deadlineDetailsController.clear();
  }
}

