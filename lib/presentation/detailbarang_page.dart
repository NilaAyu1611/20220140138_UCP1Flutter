import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ucp1flutter/presentation/home_page.dart';

class DetailbarangPage extends StatelessWidget {
  final String tanggal;
  final String jenisTransaksi;
  final String jenisBarang;
  final int jumlahBarang;
  final int hargaSatuan;
final String email;

  const DetailbarangPage({
    super.key,
    required this.tanggal,
    required this.jenisTransaksi,
    required this.jenisBarang,
    required this.jumlahBarang,
    required this.hargaSatuan,
    required this.email,
  });

  
  String formatRupiah(int number) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp. ',
      decimalDigits: 0,
    ).format(number);
  }

  Widget infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalHarga = jumlahBarang * hargaSatuan;

    return Scaffold(
      backgroundColor: const Color(0xFFFEF7F5),
      body: SafeArea(child: Column(
        children: [
            const SizedBox(height: 30),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.green.shade100,
                child: const Icon(
                  Icons.check_circle,
                  size: 50,
                  color: Color.fromARGB(255, 39, 186, 44),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Data Berhasil Disimpan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 30),

            infoRow('Tanggal', tanggal),
            const Divider(),
            infoRow('Jenis Transaksi', jenisTransaksi),
            const Divider(),
            infoRow('Jenis Barang', jenisBarang),
            const Divider(),
            infoRow('Jumlah Barang', '$jumlahBarang'),
            const Divider(),
            infoRow('Harga Satuan', formatRupiah(hargaSatuan)),
            const Divider(),
            infoRow('Total Harga', formatRupiah(totalHarga)),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage(email: email)),
                (route) => false,
              );
            },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 50, 88, 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Selesai',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(228, 237, 149, 1),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],

      )),
    );
  }
}