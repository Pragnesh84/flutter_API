import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:rest_api/models/UserModel.dart';

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {

  List<UserModel> userList = [];
  Future<List<UserModel>> getUseApi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    }else{
      return userList;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User API"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getUseApi(),
                  builder: (context ,AsyncSnapshot<List<UserModel>> snapshot){
                    if(!snapshot.hasData){
                      return CircularProgressIndicator();
                    }
                    else{
                      return ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (context , index){
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Column(
                                  children: [
                                   ReuseRow(title: 'Name', value: snapshot.data![index].name.toString()),
                                   ReuseRow(title: 'UserName', value: snapshot.data![index].username.toString()),
                                   ReuseRow(title: 'Email', value: snapshot.data![index].email.toString()),
                                   ReuseRow(title: 'Address', value: snapshot.data![index].address!.city.toString()),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  })
          ),
        ],
      ),
    );
  }
}

class ReuseRow extends StatelessWidget {
  String title , value;
  ReuseRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
