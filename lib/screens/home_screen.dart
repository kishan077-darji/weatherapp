import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    print("This is init state");
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print("set state called");
  }

  @override
  void dispose() {
    super.dispose();
    print("Widget distroyed");
  }

  @override
  Widget build(BuildContext context) {
    Map? info = ModalRoute.of(context)!.settings.arguments as Map?;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              // color: Colors.black54,
              gradient: LinearGradient(colors: [
            Colors.blue[300]!,
            Colors.blue[800]!,
          ])),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search any city here",
                            hintStyle: TextStyle(fontWeight: FontWeight.w700)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.search,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
