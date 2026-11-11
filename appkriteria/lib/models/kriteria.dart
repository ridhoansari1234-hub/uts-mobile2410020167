// Model sesuai tabel kriterias dan sub_kriterias (One-to-Many)
// Mengikuti pola models/mahasiswa.dart pada modul Praktikum Pertemuan 1.

class SubKriteria {
  final int? id;
  final int kriteriaId;
  final String namaSubKriteria;

  SubKriteria({
    this.id,
    required this.kriteriaId,
    required this.namaSubKriteria,
  });

  factory SubKriteria.fromJson(Map<String, dynamic> json) {
    return SubKriteria(
      id: json['id'],
      kriteriaId: json['kriteria_id'],
      namaSubKriteria: json['nama_sub_kriteria'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kriteria_id': kriteriaId,
      'nama_sub_kriteria': namaSubKriteria,
    };
  }
}

class Kriteria {
  final int? id;
  final String namaKriteria;
  final int prioritas;
  final List<SubKriteria> subKriterias;

  Kriteria({
    this.id,
    required this.namaKriteria,
    required this.prioritas,
    this.subKriterias = const [],
  });

  factory Kriteria.fromJson(Map<String, dynamic> json) {
    final subs = (json['sub_kriterias'] as List<dynamic>?) ?? [];
    return Kriteria(
      id: json['id'],
      namaKriteria: json['nama_kriteria'],
      prioritas: json['prioritas'],
      subKriterias: subs
          .map((e) => SubKriteria.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama_kriteria': namaKriteria,
      'prioritas': prioritas,
    };
  }
}
