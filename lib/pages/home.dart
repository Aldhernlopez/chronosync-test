import 'package:chronosync/pages/add_deadline.dart';
import 'package:chronosync/theme/theme_provider.dart';
import 'package:chronosync/widgets/activity_active_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Upcoming Activities',
        style: TextStyle(
          fontWeight: FontWeight.w800
        ),),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xff5f2c82),
                  Color(0xff49a09d)
                ]
            ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Center(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            children: [
              const SizedBox(
                height: 105,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color(0xff834d9b),
                          Color(0xffd04ed6)
                        ],
                    ),
                  ),
                    child: Text('Menu',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800
                    ),),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   child: TextButton(
              //       onPressed: (){},
              //       child: Align(
              //         alignment: Alignment.centerLeft,
              //         child: Text('All Activities',
              //         textAlign: TextAlign.start,
              //           style: TextStyle(
              //             fontSize: 18,
              //             fontWeight: FontWeight.w600,
              //             color: Theme.of(context).colorScheme.primary
              //           ),
              //         ),
              //       ),
              //   ),
              // ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Dark Mode',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),),
                  const SizedBox(width: 10),
                  Switch(
                    value: Provider.of<ThemeProvider>(context).isDarkMode,
                    onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
              child: ActiveActivityList(),
          ),
          const SizedBox(height: 10)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
          onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (ctx)=> const AddDeadlines(),
            ),
          );
          },
        child: const Icon(Icons.add),
      ),
    );
  }
}
