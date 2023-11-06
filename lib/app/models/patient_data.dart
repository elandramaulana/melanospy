class PatientData {
  final String nama;
  final String alamat;
  final String jenisKelamin;
  final String usia;
  final String tglLahir;
  final String ukuran;
  final String lokasi;
  final String jam;
  final String type;
  final String fileName;
  final double distanceCm;
  final String tanggalPeriksa;
  final String imageUrl;

  PatientData({
    required this.nama,
    required this.alamat,
    required this.jenisKelamin,
    required this.usia,
    required this.tglLahir,
    required this.ukuran,
    required this.lokasi,
    required this.jam,
    required this.type,
    required this.fileName,
    required this.distanceCm,
    required this.tanggalPeriksa,
    required this.imageUrl,
  });

  factory PatientData.fromMap(Map<String, dynamic> data) {
    return PatientData(
      nama: data['nama'] ?? 'null',
      alamat: data['alamat'] ?? 'null',
      jenisKelamin: data['jenis_kelamin'] ?? 'null',
      usia: data['usia'] ?? 'null',
      tglLahir: data['tgl_lahir'] ?? 'null',
      ukuran: data['ukuran'] ?? 'null',
      lokasi: data['lokasi'] ?? 'null',
      jam: data['jam'] ?? 'null',
      type: data['type'] ?? 'null',
      fileName: data['file_name'] ?? 'null',
      distanceCm: data['distance_cm'] ?? 0.0,
      tanggalPeriksa: data['tanggal_periksa'] ?? 'null',
      imageUrl: data['image_url'] ?? 'null',
    );
  }
}
