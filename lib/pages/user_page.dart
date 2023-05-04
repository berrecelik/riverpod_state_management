import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_state_management/pages/counter.dart';
import 'package:riverpod_state_management/pages/detail_user.dart';
import 'package:riverpod_state_management/provider/data_provider.dart';

import '../models/user_model.dart';

class UserPage extends ConsumerWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Center(
            child: Text("Users", style: GoogleFonts.philosopher(fontSize: 30))),
      ),
      body: _data.when(
          data: (_data) {
            List<User> userList = _data.map((e) => e).toList();
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            DetailUser(user: userList[index])));
                              },
                              child: Card(
                                color: Colors.green[200],
                                elevation: 6,
                                margin: EdgeInsets.symmetric(vertical: 15),
                                child: ListTile(
                                  title: Text(
                                    userList[index].firstName!,
                                    style:
                                        GoogleFonts.philosopher(fontSize: 20),
                                  ),
                                  subtitle: Text(
                                    userList[index].lastName!,
                                    style:
                                        GoogleFonts.philosopher(fontSize: 20),
                                  ),
                                  trailing: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          userList[index].avatar!)),
                                ),
                              ),
                            );
                          })),
                ],
              ),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
