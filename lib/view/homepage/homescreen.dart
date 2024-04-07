// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:total_x_test/controller/homescreencontroller.dart';

class Homescreeen extends StatefulWidget {
  const Homescreeen({super.key});

  @override
  State<Homescreeen> createState() => _HomescreeenState();
}

class _HomescreeenState extends State<Homescreeen> {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("employee");
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        shape: CircleBorder(side: BorderSide(width: 2)),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.white,
            context: context,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add a New User",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                      height: 140,
                      width: double.infinity,
                      child: Image.asset("assets/images/addusericon.png")),
                  Text("Name"),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2)))),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Age"),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      controller: ageController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2)))),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  const Color.fromARGB(255, 210, 206, 206))),
                          onPressed: () {},
                          child: Text("Cancel")),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  const Color.fromARGB(255, 210, 206, 206))),
                          onPressed: () {
                            collectionReference.add({
                              "name": nameController.text,
                              "age": ageController.text
                            });
                          },
                          child: Text("Save"))
                    ],
                  )
                ],
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 203, 200, 200),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: Colors.white,
            ),
            Text(
              "Nilambur",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 238, 227, 227),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 5, color: Colors.black),
                        borderRadius: BorderRadius.circular(20)),
                    disabledBorder:
                        OutlineInputBorder(borderSide: BorderSide(width: 1)),
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search by Names"),
              ),
            ),
          ),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: StreamBuilder(
                    stream: collectionReference.snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text("Loading");
                      } else {
                        return ListView.separated(
                            itemBuilder: (context, index) {
                              final QueryDocumentSnapshot<Object?>
                                  employeesnap = snapshot.data!.docs[index];

                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "assets/images/userimage1.png"),
                                  ),
                                  title: Text(
                                    employeesnap["name"],
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  subtitle: Text(
                                    "age : ${employeesnap["age"]}",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 10,
                                ),
                            itemCount: snapshot.data!.docs.length);
                      }
                    },
                  )))
        ],
      ),
    );
  }
}
