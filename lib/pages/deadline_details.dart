import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DeadlineDetails extends StatelessWidget {
  final String title;
  final String details;
  final DateTime date;
  final String category;

  const DeadlineDetails({
    super.key,
    required this.title,
    required this.details,
    required this.date,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC0C0C0),
      appBar: AppBar(
        title: const Text('Details',
        style: TextStyle(
          fontWeight: FontWeight.w700
        ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xff5f2c82),
                    Color(0xff49a09d)
                  ])
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 75,
              ),
              const SizedBox(height: 15),
              Text(title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 26
              ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Details',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),),
                        const SizedBox(height: 10),
                        Text(details,
                        maxLines: 10,
                        style: const TextStyle(
                          fontSize: 16
                        ),)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Type of Activity',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),),
                        const SizedBox(height: 10),
                        Text(category,
                          style: const TextStyle(
                              fontSize: 16
                          ),)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Date of the Activity',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),),
                        const SizedBox(height: 10),
                        Text(DateFormat.yMMMd().format(date).toString(),
                          style: const TextStyle(
                              fontSize: 16
                          ),)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.orangeAccent),
                        foregroundColor: MaterialStatePropertyAll<Color>(Colors.black),
                        fixedSize: MaterialStatePropertyAll<Size>(Size(150, 50))
                    ),
                    onPressed: (){
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //       builder: (ctx) => EditActivity(
                      //           title: title,
                      //           details: details,
                      //           date: date,
                      //           category: category,
                      //       ),
                      //   ),
                      // );
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800
                    ),),
                  ),
                  const SizedBox(width: 25),
                  ElevatedButton.icon(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
                        foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                        fixedSize: MaterialStatePropertyAll<Size>(Size(150, 50))
                    ),
                    onPressed: (){},
                    icon: const Icon(Icons.delete_forever),
                    label: const Text('Delete',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
