### Mini Project 1

## "Aplikasi Pencatatan Barang Preloved"

###### Nama: Adella Putri

###### NIM: 2409116006

###### Kelas: A, Sistem Informasi 2024

<img width="3780" height="1890" alt="fix pab (1)" src="https://github.com/user-attachments/assets/8be7f876-2014-422c-a655-00ab4133bbd3" />

# All About PreLove Notes:

**PreLove Notes** merupakan rancangan aplikasi mobile yang digunakan untuk membantu pengguna dalam mencatat dan mengelola barang preloved (barang bekas layak jual) secara terstruktur dan efisien.

Aplikasi ini dibuat sebagai solusi sederhana bagi individu yang sering menjual kembali barang pribadi seperti pakaian, tas, sepatu, atau aksesoris, namun belum memiliki sistem pencatatan yang rapi. Melalui PreLove Notes, pengguna dapat menyimpan informasi penting terkait barang seperti nama, harga jual, kondisi, kategori, serta status ketersediaan barang.

Secara umum, PreLove Notes berfungsi sebagai aplikasi manajemen data barang preloved berbasis CRUD (Create, Read, Update, Delete). Aplikasi ini dirancang dengan tampilan yang sederhana, serta alur penggunaan yang mudah dipahami oleh pengguna awam sekalipun.

# Struktur File dan Peran Masing-Masing File

<details>
<summary> Click Here </summary>

Aplikasi PreLove Notes dikembangkan menggunakan struktur **multi-file** untuk memisahkan logika dan tampilan agar kode lebih terorganisir dan mudah dipahami.

Struktur utama project terdiri dari tiga file Dart utama:

- _main.dart_
- _home_page.dart_
- _form_page.dart_

Berikut penjelasan masing-masing file:

---

## 1. _main.dart_

File ini merupakan _entry point_ (titik awal) dari aplikasi.

Di dalam file ini terdapat:

- Fungsi main() yang menjalankan aplikasi menggunakan `runApp(). `
- _Class MyApp_ yang membungkus aplikasi dengan MaterialApp.
- Pengaturan halaman awal (_home_) yang diarahkan ke HomePage.

Peran utama `main.dart` adalah:

- Menginisialisasi aplikasi Flutter.
- Menentukan halaman pertama yang akan ditampilkan.
- Mengatur konfigurasi dasar aplikasi.

File ini tidak berisi logika CRUD, tetapi hanya berfungsi sebagai penghubung awal aplikasi.

---

## 2. _home_page.dart_

File ini berisi tampilan dan logika utama aplikasi (_HomePage_).

HomePage menggunakan _StatefulWidget_ karena:

- Data barang dapat berubah (tambah, edit, hapus, ubah status).
- Tampilan harus diperbarui secara dinamis menggunakan setState().

Fungsi utama file ini:

- Menyimpan seluruh data barang dalam `List<Map<String, dynamic>>`.
- Menampilkan daftar barang menggunakan `ListView.builder`.
- Mengatur fitur filter kategori.
- Mengatur status _Available_ dan _SOLD_.
- Menangani fungsi _Create, Read, Update,_ dan _Delete_.
- Mengatur navigasi ke _FormPage_ menggunakan `Navigator.push()`.

Semua perubahan data diproses di file ini agar tampilan selalu sinkron dengan isi list.

`home_page.dart` saya gunakan sebagai pusat manajemen data aplikasi.

---

## 3. _form_page.dart_

File ini berisi halaman _FormPage_ yang digunakan untuk:

- Menambahkan barang baru (_Create_)
- Mengedit barang yang sudah ada (_Update_)

FormPage juga menggunakan _StatefulWidget_ karena:

- Menggunakan _TextEditingController_ untuk input.
- Memerlukan _state_ untuk dropdown dan gambar.
- Perlu menangani perubahan data sebelum dikirim kembali ke _HomePage_.

Fungsi utama file ini:

- Menampilkan form input (Nama, Harga, Kondisi, Kategori).
- Menangani upload foto menggunakan `image_picker`.
- Mengemas data dalam bentuk Map.
- Mengirim data kembali ke _HomePage_ melalui parameter _onSave_.
- Mengatur perbedaan mode **Tambah** dan **Edit**.

FormPage belum menyimpan data secara permanen, tetapi hanya mengirim data kembali ke _HomePage_ untuk dikelola.

---

</details>

# Fitur dan Penjelasan Lebih Lanjut Pada Tiap Page

<details>
<summary>Click Here</summary>

Aplikasi PreLove Notes memiliki beberapa fitur utama yang terbagi ke dalam _HomePage_ dan _FormPage_. Pada bagian ini tidak hanya dijelaskan fitur yang tersedia, tetapi juga bagaimana fitur tersebut diimplementasikan di dalam kode program.

---

## 1. HomePage

_HomePage_ merupakan halaman utama aplikasi yang menampilkan seluruh data barang preloved yang telah diinput oleh pengguna.

_HomePage_ menggunakan _StatefulWidget_ karena data yang ditampilkan bersifat dinamis dan dapat berubah (tambah, edit, hapus, ubah status).

Data barang disimpan dalam bentuk:

`List<Map<String, dynamic>> items = [];`

Setiap barang memiliki atribut:

- nama
- harga
- kondisi
- kategori
- imagePath
- isSold
- soldDate

Perubahan data dikontrol menggunakan `setState()` agar tampilan otomatis diperbarui.

---

### a. Nama Aplikasi

Pada bagian paling atas terdapat nama aplikasi **“PreLove Notes”** sebagai identitas utama.

<img width="357" height="41" alt="image" src="https://github.com/user-attachments/assets/67d273fc-7ddb-4ffb-b315-64ce58a1938f" />

Bagian ini dibuat menggunakan _widget Row_ dan _Text_ untuk menampilkan _title_ secara konsisten pada bagian atas halaman.

---

### b. Welcome Section

Terdapat sapaan kepada pengguna berupa:

<img width="358" height="36" alt="image" src="https://github.com/user-attachments/assets/28f55b53-6dd0-4e65-a113-249c7ab195de" />

Nama "Adella" saat ini digunakan sebagai placeholder. Ke depannya bagian ini direncanakan akan terintegrasi dengan sistem login agar nama yang tampil menyesuaikan dengan user yang sedang menggunakan aplikasi.

Di bawahnya terdapat kalimat:

<img width="357" height="28" alt="image" src="https://github.com/user-attachments/assets/a3d2d256-0b0d-4d59-a6c3-58a6d4749e6e" />

Bagian ini dibuat menggunakan Text dan Icon untuk memberikan kesan personal serta meningkatkan pengalaman pengguna.

---

### c. Fitur Filter Kategori

Di bawah bagian sapaan terdapat fitur filter berbentuk _horizontal scroll_.

<img width="357" height="50" alt="image" src="https://github.com/user-attachments/assets/4b250e83-5b6a-47c5-84ee-a59599370a97" />

Filter ini dibuat menggunakan:

`ListView (scrollDirection: Axis.horizontal)`

Kategori yang tersedia:

- Semua
- Tas
- Atasan
- Bawahan
- Sepatu
- Aksesoris

Fitur filter disini bekerja dengan menyaring list menggunakan:

`items.where((item) => item["kategori"] == selectedCategory)`

- Jika pengguna memilih salah satu kategori tertentu (misalnya Tas), maka hanya barang dengan kategori tersebut yang akan ditampilkan.

Sistem memeriksa nilai kategori yang dipilih dan menampilkan data sesuai dengan kategori tersebut menggunakan metode penyaringan pada list.

Fitur ini dirancang agar pengguna dapat melihat seluruh data terlebih dahulu, kemudian menyaring sesuai kebutuhan untuk mempermudah pengelolaan barang.

---

### d. Daftar Barang (Read)

Data barang ditampilkan menggunakan:

`ListView.builder()`

Widget ini memungkinkan daftar barang dibuat secara dinamis sesuai jumlah data dalam list.

Setiap card menampilkan:

- Foto barang (_Image.file_)
- Nama barang
- Harga jual (format Rupiah)
- Kondisi barang
- Status (**_Available_**/**_SOLD_**)

<img width="357" height="146" alt="image" src="https://github.com/user-attachments/assets/ba0584d7-22c1-4013-85c3-7946991a9a77" />

Harga diformat menggunakan package intl:

`NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')`

Sehingga input seperti 250000 akan otomatis tampil sebagai Rp 250.000.

---

### e. Status Available & SOLD

Setiap barang memiliki status:

- _Available_ = Barang masih tersedia.

<img width="357" height="146" alt="image" src="https://github.com/user-attachments/assets/5030a77c-2285-4e41-b19a-20230b8de70c" />

- _SOLD_ = Barang sudah terjual.

<img width="357" height="150" alt="image" src="https://github.com/user-attachments/assets/7adced2e-0ebc-49fe-abd6-a84890605c86" />

Status ini dibuat interaktif menggunakan _GestureDetector_.  
Ketika card ditekan, fungsi `toggleSold()` akan dijalankan:

`items[index]["isSold"] = !items[index]["isSold"];`

Jika berubah menjadi _SOLD_, sistem otomatis menyimpan tanggal menggunakan `DateTime.now()`.

<img width="359" height="51" alt="image" src="https://github.com/user-attachments/assets/7dc090cb-fc8f-436d-9f82-95889b0e118b" />

Fitur ini tidak hanya mempercantik tampilan tetapi juga memiliki fungsi manajemen stok sederhana.

---

### f. Tombol Tambah (+)

Di bagian kanan bawah terdapat `FloatingActionButton (+).`

<img width="434" height="101" alt="image" src="https://github.com/user-attachments/assets/c9acca80-ee50-4fe0-99a0-97a75d1d5c75" />

Ketika ditekan, aplikasi akan menjalankan:

`Navigator.push()`

untuk berpindah ke FormPage dalam mode tambah barang (_Create_).

---

### g. Icon Edit & Delete

Pada setiap card terdapat:

- Icon Pencil (Edit)  
  Mengarahkan ke FormPage dalam mode Edit.

<img width="133" height="57" alt="image" src="https://github.com/user-attachments/assets/bde3abe0-42e2-4920-879a-a13909cb28a2" />

- Icon Delete (Hapus)  
  Menghapus data menggunakan:

<img width="115" height="60" alt="image" src="https://github.com/user-attachments/assets/e75e72ff-d8d7-4957-a601-8607cb5877c2" />

`items.removeAt(index);`

Mode Edit bekerja dengan mengirim data lama ke _FormPage_ melalui parameter _barangLama_.

---

## 🔹 2. FormPage (Tambah & Edit Barang)

_FormPage_ digunakan untuk menambahkan dan mengedit data barang.

_FormPage_ juga menggunakan StatefulWidget karena memerlukan TextEditingController dan state dinamis.

---

### 1. Upload Foto

Fitur upload foto menggunakan package `image_picker`.

Gambar yang dipilih disimpan dalam bentuk _path_:

`selectedImage?.path`

Kemudian ditampilkan kembali di HomePage menggunakan _Image.file()_.

Namun, saat ini fitur ini masih dalam tahap pengembangan dan belum dapat digunakan lebih lanjut.

---

### 2. Nama Barang

Input dilakukan menggunakan _TextField_ dengan `TextEditingController`.

_Controller_ ini memungkinkan:

- Mengambil input pengguna
- Mengisi ulang field saat mode edit

---

### 3. Harga Jual

Pengguna memasukkan angka tanpa titik atau koma.

Saat disimpan, data diformat menggunakan _intl_ menjadi format Rupiah.

Contoh:

```
Input: 250000
Output: Rp 250.000
```

---

### 4. Kondisi / Grade Barang (Dropdown)

DropdownButton digunakan untuk memilih grade atau tingkat kondisi barang.

Dalam aplikasi ini, istilah kondisi disesuaikan dengan standar profesional yang umum digunakan dalam dunia jual beli preloved, yaitu sistem grading.

Pilihan yang tersedia pada dropdown:

1. **Grade A (Mint)**
   Barang dalam kondisi sangat baik, terlihat seperti baru, dan tidak memiliki kekurangan atau minus sama sekali.

2. **Grade B (VGC – Very Good Condition)**
   Barang memiliki tanda pemakaian yang wajar, namun masih berfungsi dengan baik dan tetap layak digunakan.

3. **Grade C (Fair)**
   Barang memiliki kekurangan seperti lecet atau noda, namun masih dapat digunakan. Biasanya harga jual lebih terjangkau dibanding grade yang lebih tinggi.

Pada implementasi kode, yang ditampilkan di dropdown adalah:

<img width="358" height="181" alt="image" src="https://github.com/user-attachments/assets/eaa4a3d8-f681-4857-af75-0e575c7a298a" />

- Grade A (Mint)
- Grade B (VGC)
- Grade C (Fair)

Nilai yang dipilih akan disimpan dalam variabel kondisi dan ditampilkan kembali pada HomePage sebagai bagian dari informasi detail barang.

Penggunaan sistem grading ini bertujuan agar aplikasi terlihat lebih profesional dan sesuai dengan praktik umum dalam manajemen barang preloved.

---

### 5. Kategori (Dropdown)

_DropdownButton_ juga digunakan untuk memilih kategori:

<img width="358" height="256" alt="image" src="https://github.com/user-attachments/assets/93912dc3-df3f-4aaf-897f-bd7ecdef6673" />

- Tas
- Atasan
- Bawahan
- Sepatu
- Aksesoris

Kategori ini terhubung langsung dengan fitur filter di _HomePage_.

Barang yang ditambahkan otomatis muncul dalam kategori yang sesuai.

---

### 6. Tombol Simpan (Create)

Saat tombol Simpan ditekan:

<img width="356" height="61" alt="image" src="https://github.com/user-attachments/assets/fb28015b-0d24-4d2b-992b-1a6ad894ed78" />

- Data dikemas dalam bentuk Map
- Dikirim kembali ke HomePage
- Ditambahkan ke list menggunakan `items.add()`
- Halaman kembali menggunakan `Navigator.pop()`

---

### 7. Mode Edit (Update)

Jika _FormPage_ dibuka dalam mode edit:

<img height="500" alt="iPhone-13-PRO-localhost (6)" src="https://github.com/user-attachments/assets/c60b9177-bd85-4164-a913-af2011f98e1d" />

- Field otomatis terisi data lama
- Judul berubah menjadi "Edit Barang"
- Tombol berubah menjadi "Update"

Saat Update ditekan:

`items[index] = barangBaru;`

Data lama diganti dan langsung diperbarui di _HomePage_.

---

## Implementasi CRUD

Aplikasi ini telah menerapkan konsep CRUD secara lengkap:

- Create untuk Menambahkan barang melalui FormPage
- Read untuk Menampilkan barang dengan ListView.builder
- Update untuk Mengedit data melalui mode Edit
- Delete untuk Menghapus barang dari list

Seluruh proses dikelola menggunakan _StatefulWidget_ dan _setState_ tanpa database eksternal.

---

## Multi Page Navigation

Navigasi antar halaman menggunakan:

```
Navigator.push()
Navigator.pop()
```

Alur navigasi:

HomePage → FormPage (Tambah Barang)  
HomePage → FormPage (Edit Barang)  
FormPage → Kembali ke HomePage setelah Simpan/Update

---

</details>

# Tampilan Keseluruhan Aplikasi dan Alur Penggunaan Aplikasi

<details>
<summary> Click Here </summary>

Berikut adalah alur penggunaan aplikasi PreLove Notes dari awal hingga akhir:

---

### 1. Tampilan Awal Aplikasi

Saat aplikasi pertama kali dibuka, pengguna akan langsung diarahkan ke HomePage.

Jika belum ada data yang ditambahkan, maka halaman akan terlihat kosong (belum ada daftar barang yang tampil).  
Namun seluruh elemen utama tetap terlihat, seperti:

- Nama aplikasi di bagian atas (PreLove Notes)
- Welcome section
- Kalimat sapaan
- Filter kategori
- Tombol tambah (+) di bagian kanan bawah

<img height="500" alt="iPhone-13-PRO-localhost" src="https://github.com/user-attachments/assets/e8ed20b0-3daa-4b88-8405-1196550f9b40" />

Hal ini menunjukkan bahwa aplikasi sudah siap digunakan untuk mulai menambahkan data.

---

### 2. Menambahkan Barang (Create)

Untuk menambahkan barang baru, pengguna menekan tombol (+) di kanan bawah.

<img width="434" height="101" alt="Screenshot 2026-02-26 144245" src="https://github.com/user-attachments/assets/93b8e158-588c-4056-b5b1-a8d3872d2a99" />

Setelah ditekan, aplikasi akan berpindah ke halaman FormPage untuk mengisi data barang.

---

### 3. Mengisi Data Barang

Di halaman FormPage, pengguna diminta mengisi beberapa data:

<img height="500" alt="iPhone-13-PRO-localhost (1)" src="https://github.com/user-attachments/assets/10f52d6a-c7bf-4b58-9546-df01223449d5" />

- Upload Foto (opsional / rancangan awal)
- Nama Barang
- Harga Jual
- Grade Barang (Grade A, B, atau C)
- Kategori (Tas, Atasan, Bawahan, Sepatu, Aksesoris)

Jika pengguna mencoba menekan tombol Simpan tanpa mengisi Nama Barang atau Harga Jual, maka sistem akan menampilkan notifikasi di bagian bawah layar (SnackBar) dengan pesan:

"Isi semua data dulu"

<img height="500" alt="iPhone-13-PRO-localhost (2)" src="https://github.com/user-attachments/assets/a7b83009-8f21-46ed-bbbc-8c46a831b9e4" />

Hal ini bertujuan untuk mencegah data kosong dan menjaga konsistensi informasi yang disimpan.

---

### 4. Menyimpan Data

Jika semua data sudah diisi dengan benar dan tombol Simpan ditekan:

<img height="500" alt="iPhone-13-PRO-localhost (3)" src="https://github.com/user-attachments/assets/c4a246f9-f0c2-4041-9685-3c2aa9ddc17e" />

- Data akan dikirim kembali ke HomePage
- Data ditambahkan ke dalam list barang
- Aplikasi otomatis kembali ke HomePage
- Barang langsung muncul dalam daftar

Harga akan otomatis diformat menjadi Rupiah (contoh: Rp 85.000).

<img height="500" alt="iPhone-13-PRO-localhost (4)" src="https://github.com/user-attachments/assets/26c9ca10-e540-4a32-8dab-5ed853cc0cf8" />

Status awal barang akan ditampilkan sebagai:
Available

---

### 5. Melihat dan Memfilter Data

Setelah data ditambahkan, pengguna dapat:

<img height="500" alt="iPhone-13-PRO-localhost (5)" src="https://github.com/user-attachments/assets/0728874f-6056-4644-9866-3b82418762f2" />

- Melihat seluruh data pada kategori "Semua"
- Memilih kategori tertentu untuk menyaring barang
- Data akan otomatis menyesuaikan berdasarkan kategori yang dipilih

Jika memilih "Semua", maka seluruh barang akan tampil tanpa penyaringan.

<img height="500" alt="iPhone-13-PRO-localhost (8)" src="https://github.com/user-attachments/assets/4727e6cb-dc86-4d73-a119-f9ff35753420" />

---

### 6. Mengubah Status Available / SOLD

Pengguna dapat menekan (tap) pada card barang.

Saat ditekan:
- Status akan berubah dari Available menjadi SOLD
- Sistem otomatis mencatat tanggal perubahan status
- Jika ditekan kembali, status akan kembali menjadi Available

Barang yang masih Available: 

<img height="500" alt="iPhone-13-PRO-localhost (4)" src="https://github.com/user-attachments/assets/07c93bc8-e06d-4fbe-9354-8b7cf105bc54" />

Barang yang sudah Sold: 

<img height="500" alt="iPhone-13-PRO-localhost (5)" src="https://github.com/user-attachments/assets/ab4f404d-9791-4572-bc95-979ecbff525b" />

Fitur ini memudahkan pengguna dalam mengelola barang yang sudah terjual.

---

### 7. Mengedit Data (Update)

Jika pengguna ingin mengubah data barang:

- Tekan icon pencil (edit) pada card
- FormPage akan terbuka dalam mode Edit
- Seluruh data sebelumnya otomatis terisi
- Tombol berubah dari "Simpan" menjadi "Update"
  
<img height="500" alt="iPhone-13-PRO-localhost (6)" src="https://github.com/user-attachments/assets/4f5ce95d-c6b7-4cdb-885d-cd8c3cd6a184" />

Setelah tombol Update ditekan:
- Data lama akan diperbarui
- Tampilan di HomePage langsung menyesuaikan perubahan

---

### 8. Menghapus Data (Delete)

Jika pengguna ingin menghapus barang:

- Tekan icon delete pada card
- Barang akan langsung terhapus dari daftar
- Tampilan diperbarui secara otomatis

---

### 9. Selesai Mengelola Data

Setelah proses tambah, edit, ubah status, atau hapus selesai, pengguna dapat terus mengelola barang sesuai kebutuhan.

Aplikasi akan selalu memperbarui tampilan secara langsung setiap kali terjadi perubahan data.

---

</details>
