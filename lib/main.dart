import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final url="https://jsonplaceholder.typicode.com/posts";
  final allPhoto=[];

  getData() async{


    final response=await Dio().get(url);
    for(var item in response.data){
      allPhoto.add(item);
    }


    // //get the response from the url
    // final response=await http.get(Uri.parse(url));
    // //decode into jsonFormat
    // var data=jsonDecode(response.body);
    // //assign the value on it
    // for(var item in data){
    //   allPhoto.add(item);
    // }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Dio Package"),
      ),
      body: allPhoto.length == 0 ? const Center(
        child: Text("Load Data First",style: TextStyle(
          fontSize: 20,
        ),),
      ):ListView.builder(
          itemBuilder: (context,index){
            return ListTile(
              leading: Text(allPhoto[index]['id'].toString()),
              title: Text(allPhoto[index]['title']),
            );
          },
          itemCount: allPhoto.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          getData();
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
