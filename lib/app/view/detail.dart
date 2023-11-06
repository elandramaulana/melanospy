import 'dart:async';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:hexcolor/hexcolor.dart';
import 'package:melanospy/app/providers/detail_controller.dart';
import 'package:melanospy/app/widgets/custom_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'edit_view.dart'; // Import halaman EditView
import 'package:pdf/pdf.dart';

class DetailView extends StatefulWidget {
  final String documentId;

  const DetailView({super.key, required this.documentId});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  final StreamController<Map<String, dynamic>> _streamController =
      StreamController<Map<String, dynamic>>();
  Stream<Map<String, dynamic>> get dataStream => _streamController.stream;

  final DetailController controller = Get.put(DetailController());

  @override
  void dispose() {
    _streamController
        .close(); // Pastikan untuk menutup StreamController saat tidak lagi digunakan
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final DetailController controller = Get.put(DetailController());
    controller.fetchData(widget
        .documentId); // Panggil fetchData dengan documentId yang diteruskan dari widget
  }

  Future<void> generatePDF(Map<String, dynamic> data) async {
    final pdf = pw.Document();

    // Add content to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Center(
                child: pw.Text('Hasil Pemeriksaan',
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 28)),
              ),
              pw.SizedBox(height: 10),
              // pw.Center(
              //   child: pw.Image(pw.MemoryImage(imageBytes)),
              // ),
              pw.SizedBox(height: 10),
              pw.Text('Nama Pasien',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 24)),
              pw.Text(controller.data['nama'],
                  style: const pw.TextStyle(fontSize: 20)),
              pw.SizedBox(height: 10),
              pw.Text('Alamat',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 24)),
              pw.Text(controller.data['alamat'],
                  style: const pw.TextStyle(fontSize: 20)),
              pw.SizedBox(height: 10),
              pw.Text('Jenis Kelamin',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 24)),
              pw.Text(controller.data['jenis_kelamin'],
                  style: const pw.TextStyle(fontSize: 20)),
              pw.SizedBox(height: 10),
              pw.Text('Tanggal Lahir',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 24)),
              pw.Text(controller.data['tgl_lahir'],
                  style: const pw.TextStyle(fontSize: 20)),
              pw.SizedBox(height: 10),
              pw.Text('Usia',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 24)),
              pw.Text(controller.data['usia'],
                  style: const pw.TextStyle(fontSize: 20)),
              pw.SizedBox(height: 10),
              pw.Text('Tanggl Periksa',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 24)),
              pw.Text(controller.data['tanggal_periksa'],
                  style: const pw.TextStyle(fontSize: 20)),
              pw.SizedBox(height: 10),
              pw.Text('Lokasi Lesi',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 24)),
              pw.Text(controller.data['lokasi'],
                  style: const pw.TextStyle(fontSize: 20)),
              pw.SizedBox(height: 10),
              pw.Text('Jenis',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 24)),
              pw.Text(controller.data['type'],
                  style: const pw.TextStyle(fontSize: 20)),
              pw.SizedBox(height: 10),
              pw.Text('Ukuran Lesi',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 24)),
              pw.Text(controller.data['ukuran'],
                  style: const pw.TextStyle(fontSize: 20)),
              pw.SizedBox(height: 10),
              pw.Text('Kedalaman',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 24)),
              pw.Text('null', style: const pw.TextStyle(fontSize: 20)),
              pw.SizedBox(height: 10),
              pw.Text('Kemungkinan Melanoma Sebesar',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 24)),
              pw.Text('${controller.data['persentase']} %',
                  style: const pw.TextStyle(fontSize: 20)),
              pw.SizedBox(height: 10),
              pw.Text('Kesimpulan',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 24)),
              pw.Text('null', style: const pw.TextStyle(fontSize: 20)),
            ],
          );
        },
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    if (directory != null) {
      final filePath = '${directory.path}/melanospy_result.pdf';

      final status = await Permission.storage.request();
      if (status.isGranted) {
        final pdfFile = File(filePath);
        await pdfFile.writeAsBytes(await pdf.save());
      } else {
        // Izin penyimpanan ditolak, beri tahu pengguna
        print('Izin penyimpanan ditolak');
      }
    } else {
      // Direktori penyimpanan eksternal tidak ditemukan
      print('Direktori penyimpanan eksternal tidak ditemukan');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('114773'),
      body: StreamBuilder<Map<String, dynamic>>(
        stream: controller.dataStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 100.0, left: 20, bottom: 70),
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
                            'Result',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Card(
                              child: Image.network(
                                  '${controller.data['image_url']}')),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Nama',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '${controller.data['nama']}',
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Alamat',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '${controller.data['alamat']}',
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Jenis Kelamin',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '${controller.data['jenis_kelamin']}',
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Tanggal Lahir',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '${controller.data['tgl_lahir']}',
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Usia',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '${controller.data['usia']}',
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Tanggal Periksa',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '${controller.data['tanggal_periksa']}',
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Lokasi',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '${controller.data['lokasi']}',
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Jenis',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '${controller.data['type']}',
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Ukuran',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '${controller.data['ukuran']}',
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Klasifikasi',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: double
                              .infinity, // Mengatur lebar Container sesuai lebar layar
                          margin: const EdgeInsets.all(
                              0.0), // Sesuaikan margin sesuai kebutuhan Anda
                          child: Card(
                            color: HexColor('114773'),
                            shadowColor: Colors.white,
                            elevation: 4.0, // Efek bayangan Card
                            child: Padding(
                                padding: const EdgeInsets.all(
                                    16.0), // Sesuaikan padding sesuai kebutuhan Anda
                                child: Column(
                                  children: [
                                    const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Kemungkinan Melanoma Sebesar ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '${controller.data['persentase']} %',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          textButton: "Edit",
                          onPressed: () {
                            Get.to(EditView(
                                data: controller.data,
                                documentId: widget.documentId));
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          textButton: "Generate PDF",
                          onPressed: () async {
                            await generatePDF(controller.data);
                          },
                        ),
                      ],
                    ),
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
