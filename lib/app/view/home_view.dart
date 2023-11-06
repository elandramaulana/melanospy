import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:melanospy/app/view/detail.dart';
import 'package:melanospy/app/view/navbar.dart';
import 'package:melanospy/app/widgets/list_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('2476AE'),
        title: ListTile(
          title: const Text(
            'Dr. Elan',
            style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
          ),
          subtitle: const Text(
            'Spesialis Kulit',
            style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
          ),
          leading:
              CircleAvatar(child: Image.asset('assets/images/profile.png')),
        ),
      ),
      endDrawer: const Navbar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('images')
            .orderBy('tanggal_periksa', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final itemList = snapshot.data!.docs.map((document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return {
              'documentId': document.id,
              'image_url': data['image_url'] ?? '',
              'nama': data['nama'] ?? '',
              'jenis': data['type'] ?? '',
              'jam': data['jam'] ?? '',
              'tanggal_periksa': data['tanggal_periksa'] ?? '',
            };
          }).toList();

          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Riwayat Pemeriksaan',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: itemList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = itemList[index];
                      return ListCard(
                        onPressed: () {
                          Get.to(DetailView(documentId: item['documentId']));
                        },
                        title: item['nama'],
                        subtitle: item['jenis'],
                        tanggal: item['tanggal_periksa'].toString(),
                        image: item['image_url'],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
