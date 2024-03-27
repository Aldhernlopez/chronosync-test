import 'package:chronosync/pages/deadline_details.dart';
import 'package:flutter/material.dart';

class DeadlinesList extends StatelessWidget {
  const DeadlinesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                  ),
                  child: InkWell(
                    child: Expanded(
                      child: Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                radius: 50,
                              ),
                              const SizedBox(height: 20),
                              Text('Activity #${index + 1}',
                                  maxLines: 1,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                              ),
                              ),
                              Text('Due on #${index + 1}',
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (ctx) => DeadlineDetails(
                                  title: 'Deadline Title ${index + 1}',
                                  details: 'This is the sample details for the deadline. Assume this is really long. There probably is more words in this.',
                                  date: DateTime.now(),
                                  category: 'Test',
                              ),
                          )
                      );
                    },
                  ),
                );
                },
          childCount: 30,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
        ),
    );
  }
}
