import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List data = [];
  int _value = 1;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    final res = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    setState(() {
      data = jsonDecode(res.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: DropdownButton(
          items: data.map((e) {
            return DropdownMenuItem(child: Text(e["username"]), value: e["id"],);
          }).toList(),
          onChanged: (v) {
            setState(() {
              _value = v as int;
            });
          },
        ),
      ),
    );
  }
}



