import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/kriteria.dart';

class KriteriaController extends GetxController {
  var kriteriaList = <Kriteria>[].obs;
  var isLoading = false.obs;
  var pesanError = ''.obs;

  // IP dari laravel yang dijalankan dengan: php artisan serve
  // Dijalankan dengan flutter run (Chrome / Windows):
  //final String apiUrl = 'http://127.0.0.1:8000/api/kriteria';
  //final String apiUrl = 'http://mobile2410020167.test/api/kriteria';

  // untuk emulator android studio gunakan IP dibawah ini
  final String apiUrl = 'http://10.0.2.2:8000/api/kriteria';

  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  @override
  void onInit() {
    super.onInit();
    tangkapDataKriteria(); // Memanggil fetch data saat controller diinisialisasi
  }

  // GET semua kriteria (beserta sub kriteria)
  Future<void> tangkapDataKriteria() async {
    isLoading.value = true;
    pesanError.value = '';
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        kriteriaList.value =
            data.map((item) => Kriteria.fromJson(item)).toList();
      } else {
        pesanError.value =
            'Gagal ambil data kriteria (status ${response.statusCode})';
      }
    } catch (e) {
      pesanError.value =
          'Tidak bisa terhubung ke server. Pastikan php artisan serve sudah berjalan.\n$e';
    } finally {
      isLoading.value = false;
    }
  }

  // POST tambah kriteria -> Laravel membalas 201
  Future<void> addKriteria(Kriteria kriteria) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: _headers,
      body: json.encode(kriteria.toJson()),
    );

    if (response.statusCode == 201) {
      kriteriaList.add(Kriteria.fromJson(json.decode(response.body)));
    } else {
      throw Exception('Gagal simpan data kriteria');
    }
  }

  // PUT ubah kriteria -> Laravel membalas 200
  Future<void> updateKriteria(int id, Kriteria kriteria) async {
    final response = await http.put(
      Uri.parse('$apiUrl/$id'),
      headers: _headers,
      body: json.encode(kriteria.toJson()),
    );

    if (response.statusCode == 200) {
      final index = kriteriaList.indexWhere((k) => k.id == id);
      if (index != -1) {
        // data balasan PUT tidak memuat sub kriteria, jadi dipertahankan
        final lama = kriteriaList[index];
        final baru = Kriteria.fromJson(json.decode(response.body));
        kriteriaList[index] = Kriteria(
          id: baru.id,
          namaKriteria: baru.namaKriteria,
          prioritas: baru.prioritas,
          subKriterias: lama.subKriterias,
        );
      }
    } else {
      throw Exception('Gagal ubah data kriteria');
    }
  }

  // DELETE hapus kriteria -> Laravel membalas 204
  Future<void> hapusKriteria(int id) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/$id'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 204) {
      kriteriaList.removeWhere((k) => k.id == id);
    } else {
      throw Exception('Gagal hapus data kriteria');
    }
  }
}
