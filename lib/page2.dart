import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:persistent_tab_bars/reusable_row.dart';
import 'package:persistent_tab_bars/use_model.dart';

import 'constans.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2>
    with AutomaticKeepAliveClientMixin<Page2> {

  @override
  bool get wantKeepAlive => true;

  List<UserModel> userList = [];

  Future<List<UserModel>> getUserApi() async {
    final response = await http.get(Uri.parse(Constants.localhost));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        print(i['name']);
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ReusbaleRow(
                                    title: 'Name',
                                    value:
                                        snapshot.data![index].name.toString()),
                                ReusbaleRow(
                                    title: 'username',
                                    value: snapshot.data![index].username
                                        .toString()),
                                ReusbaleRow(
                                    title: 'email',
                                    value:
                                        snapshot.data![index].email.toString()),
                                ReusbaleRow(
                                    title: 'Address',
                                    value: snapshot
                                        .data![index].address!.geo!.lat
                                        .toString())
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
