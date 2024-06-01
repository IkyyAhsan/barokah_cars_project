import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BaroShowData extends StatefulWidget {
  const BaroShowData({super.key});

  @override
  State<BaroShowData> createState() => _BaroShowDataState();
}

class _BaroShowDataState extends State<BaroShowData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("cars").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              var carDocs = snapshot.data!.docs;
              return ListView.builder(
                itemCount: carDocs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text("${index + 1}"),
                    ),
                    title: Text("${carDocs[index]["Model"]}"),
                    subtitle: Text("${carDocs[index]["Merk"]}"),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Terjadi kesalahan: ${snapshot.error}"),
              );
            } else {
              return const Center(
                child: Text("Tidak ada data yang tersedia."),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
