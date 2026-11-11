<?php

namespace Database\Seeders;

use App\Models\Kriteria;
use Illuminate\Database\Seeder;

class KriteriaSeeder extends Seeder
{
    public function run(): void
    {
        // Data diambil dari Tabel 2 & Gambar 3 jurnal
        $data = [
            ['Etika/Moral', 1, [
                'Ketaatan menjalankan ajaran agama',
                'Belum pernah di hukum karena pidana maupun perdata',
                'Tidak mengkonsumsi dan mengedarkan narkoba keteladanan',
            ]],
            ['Pendidikan', 2, ['SMU', 'DII/DIII', 'S1/D.IV', 'S2/SP1', 'S3/SP2']],
            ['Kepemimpinan/Pengalaman', 3, [
                'Tingkat Desa/Kecamatan',
                'Tingkat Kabupaten/Kota',
                'Tingkat Nasional',
                'Tingkat Regional International',
            ]],
            ['Integritas', 4, ['Jujur', 'Konsisten', 'Komitmen']],
            ['Kapabilitas', 5, [
                'Berpihak pada ekonomi rakyat',
                'Pergerakan anti korupsi',
                'Kinerja yang baik',
                'Mendukung reformasi',
            ]],
            ['Elektabilitas', 6, [
                'Kerja keras para elite dan kader partai',
                'Apresiasi permasalahan dalam lingkungan masyarakat',
                'Bersosialisasi',
            ]],
        ];

        foreach ($data as [$nama, $prioritas, $subs]) {
            $kriteria = Kriteria::create([
                'nama_kriteria' => $nama,
                'prioritas'     => $prioritas,
            ]);

            foreach ($subs as $sub) {
                $kriteria->subKriterias()->create(['nama_sub_kriteria' => $sub]);
            }
        }
    }
}
