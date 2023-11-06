import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:melanospy/app/providers/detail_controller.dart';
import 'package:melanospy/app/view/home_view.dart';

import '../widgets/custom_button.dart';

class EditView extends StatelessWidget {
  final Map<String, dynamic> data;
  final String documentId;
  final DetailController _controller =
      Get.find(); // Menemukan kontroler yang ada

  EditView({super.key, required this.data, required this.documentId});

  @override
  Widget build(BuildContext context) {
    final TextEditingController namaController =
        TextEditingController(text: data['nama']);
    final TextEditingController alamatController =
        TextEditingController(text: data['alamat']);
    final TextEditingController jeniskelaminController =
        TextEditingController(text: data['jenis_kelamin']);
    final TextEditingController usiaController =
        TextEditingController(text: data['usia']);
    final TextEditingController datePeriksaController =
        TextEditingController(text: data['tanggal_periksa']);
    final TextEditingController tlgLahirController =
        TextEditingController(text: data['tgl_lahir']);
    final TextEditingController lokasiController =
        TextEditingController(text: data['lokasi']);
    final TextEditingController ukuranController =
        TextEditingController(text: data['ukuran']);
    final TextEditingController typeController =
        TextEditingController(text: data['type']);
    final TextEditingController klasifikasiController =
        TextEditingController(text: data['klasifikasi']);

    return Scaffold(
      backgroundColor: HexColor('114773'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0, left: 20, bottom: 70),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Container(
                    margin: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(5.0),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  label: const Text(
                    "Back",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Tambahkan Data Pasien',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: namaController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          labelText: 'Nama Lengkap',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)))),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: alamatController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          labelText: 'Alamat Lengkap',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)))),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: jeniskelaminController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          labelText: 'Jenis Kelamin',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)))),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: usiaController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          labelText: 'usia',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)))),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: tlgLahirController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          labelText: 'Tanggal Lahir',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)))),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: ukuranController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          labelText: 'Ukuran',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)))),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: lokasiController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          labelText: 'Lokasi',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)))),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: typeController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          labelText: 'Jenis',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)))),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: datePeriksaController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          labelText: 'Tanggal Periksa',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)))),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: klasifikasiController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          labelText: 'Klasifikasi',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)))),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomButton(
                      textButton: "Simpan Perubahan",
                      onPressed: () {
                        try {
                          final newData = {
                            'nama': namaController.text,
                            'alamat': alamatController.text,
                            'jenis_kelamin': jeniskelaminController.text,
                            'usia': usiaController.text,
                            'tgl_lahir': tlgLahirController.text,
                            'ukuran': ukuranController.text,
                            'lokasi': lokasiController.text,
                            'type': typeController.text,
                            'tanggal_periksa': datePeriksaController.text,
                            'persentase': klasifikasiController.text,
                          };

                          _controller.editData(documentId, newData);

                          Get.snackbar('Update Berhasil',
                              'Data Pasien telah berhasil di.',
                              snackPosition: SnackPosition.TOP);
                          Get.offAll(HomeView());
                        } catch (e) {
                          'Data gagal ditambahkan';
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
