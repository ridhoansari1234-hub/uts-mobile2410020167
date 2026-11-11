# UTS Web Service Laravel + Aplikasi Flutter – Database `mobile2410020167`

**Nama:** M. Ridho Ansari  
**NPM:** 2410020167  
**Referensi jurnal:** Aplikasi Pendukung Keputusan Pemilihan Bakal Calon Anggota Legislatif (Bacaleg) dengan Metode AHP (Industrial Engineering Journal Vol.5 No.2, 2016)  
**Alat:** VS Code, Laragon (PHP 8.1, MySQL 8), Laravel 10, Postman, Android Studio (emulator), Flutter  
**Acuan:** Modul Praktikum Pertemuan 1 – Pemrograman Flutter dengan Web API Laravel Dasar

## Tabel (One-to-Many)
| Tabel | Kolom |
|---|---|
| `kriterias` | id, nama_kriteria, prioritas, created_at, updated_at |
| `sub_kriterias` | id, **kriteria_id (FK → kriterias.id)**, nama_sub_kriteria, created_at, updated_at |

Satu kriteria (mis. Pendidikan) memiliki banyak sub kriteria. Menghapus kriteria ikut menghapus sub kriterianya (cascade).

## Struktur
- `app/Models/Kriteria.php`, `SubKriteria.php` – model + relasi `hasMany` / `belongsTo`
- `app/Http/Controllers/KriteriaController.php`, `SubKriteriaController.php` – CRUD (respons polos seperti modul)
- `routes/api.php` – `Route::apiResource('kriteria', ...)` dan `Route::apiResource('sub-kriteria', ...)`
- `database/migrations`, `database/seeders` – tabel dan data dari jurnal
- `database/sql/mobile2410020167.sql` – struktur + data (alternatif import)
- `postman/` – koleksi 10 request
- `appkriteria/` – aplikasi Flutter (models, controllers, views) yang membaca API ini
- `screenshot/` – bukti pengujian

## Menjalankan Web API
1. `composer install`
2. Salin `.env.example` menjadi `.env`, lalu `php artisan key:generate`
3. Buat database `mobile2410020167` (HeidiSQL), isi `.env`: `DB_DATABASE=mobile2410020167`, `DB_USERNAME=root`, `DB_PASSWORD=` kosong
4. `php artisan migrate --seed`
5. `php artisan serve` → `http://127.0.0.1:8000/api/kriteria` (atau `http://mobile2410020167.test/api/kriteria` via Laragon)

## Endpoint
Header: `Accept: application/json` (+ `Content-Type: application/json` untuk POST/PUT)

| Method | URL | Body (JSON) | Status |
|---|---|---|---|
| GET | /api/kriteria | – | 200 |
| POST | /api/kriteria | `{"nama_kriteria":"Disiplin","prioritas":7}` | 201 |
| GET | /api/kriteria/{id} | – | 200 |
| PUT | /api/kriteria/{id} | `{"nama_kriteria":"Disiplin Kerja","prioritas":7}` | 200 |
| DELETE | /api/kriteria/{id} | – | 204 |
| GET | /api/sub-kriteria | – | 200 |
| POST | /api/sub-kriteria | `{"kriteria_id":2,"nama_sub_kriteria":"S3 Luar Negeri"}` | 201 |
| GET | /api/sub-kriteria/{id} | – | 200 |
| PUT | /api/sub-kriteria/{id} | `{"nama_sub_kriteria":"S3 Dalam Negeri"}` | 200 |
| DELETE | /api/sub-kriteria/{id} | – | 204 |

Data tidak valid dibalas **422** (mis. `kriteria_id` yang tidak ada); data yang tidak ditemukan dibalas **404**.

## Aplikasi Flutter (`appkriteria`)
Emulator Android Studio memakai alamat `http://10.0.2.2:8000/api/kriteria` (jalankan `php artisan serve` dulu).
Langkah lengkap ada di `PANDUAN.md`.

## Bukti pengujian
Lihat folder `screenshot/` (Postman, HeidiSQL, dan emulator Android Studio).
