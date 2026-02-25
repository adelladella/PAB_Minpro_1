## Fitur Aplikasi dan Implementasi Teknis

Aplikasi PreLove Notes memiliki beberapa fitur utama yang terbagi ke dalam HomePage dan FormPage. Pada bagian ini tidak hanya dijelaskan fitur yang tersedia, tetapi juga bagaimana fitur tersebut diimplementasikan di dalam kode program.

---

## 🔹 1. HomePage

HomePage merupakan halaman utama aplikasi yang menampilkan seluruh data barang preloved yang telah diinput oleh pengguna.

Secara teknis, HomePage menggunakan StatefulWidget karena data yang ditampilkan bersifat dinamis dan dapat berubah (tambah, edit, hapus, ubah status).

Data barang disimpan dalam bentuk:

List<Map<String, dynamic>> items = [];

Setiap barang memiliki atribut:
- nama
- harga
- kondisi
- kategori
- imagePath
- isSold
- soldDate

Perubahan data dikontrol menggunakan setState() agar tampilan otomatis diperbarui.

---

### a. Nama Aplikasi

Pada bagian paling atas terdapat nama aplikasi “PreLove Notes” sebagai identitas utama.

Bagian ini dibuat menggunakan widget Row dan Text untuk menampilkan title secara konsisten pada bagian atas halaman.

---

### b. Welcome Section

Terdapat sapaan kepada pengguna berupa:

"Good Afternoon, Adella"

Nama "Adella" saat ini digunakan sebagai placeholder. Ke depannya bagian ini direncanakan akan terintegrasi dengan sistem login agar nama yang tampil menyesuaikan dengan user yang sedang menggunakan aplikasi.

Di bawahnya terdapat kalimat:

"Kelola barang preloved kamu hari ini ❤︎"

Bagian ini dibuat menggunakan Text dan Icon untuk memberikan kesan personal serta meningkatkan pengalaman pengguna.

---

### c. Fitur Filter Kategori

Di bawah bagian sapaan terdapat fitur filter berbentuk horizontal scroll.

Filter ini dibuat menggunakan:

ListView (scrollDirection: Axis.horizontal)

Kategori yang tersedia:
- Semua
- Tas
- Atasan
- Bawahan
- Sepatu
- Aksesoris

Secara teknis, filter bekerja dengan menyaring list menggunakan:

items.where((item) => item["kategori"] == selectedCategory)

Jika kategori "Semua" dipilih, seluruh data akan ditampilkan tanpa penyaringan.

Fitur ini dirancang agar aplikasi tetap terorganisir meskipun jumlah barang semakin banyak.

---

### d. Daftar Barang (Read)

Data barang ditampilkan menggunakan:

ListView.builder()

Widget ini memungkinkan daftar barang dibuat secara dinamis sesuai jumlah data dalam list.

Setiap card menampilkan:
- Foto barang (Image.file)
- Nama barang
- Harga jual (format Rupiah)
- Kondisi barang
- Status (Available / SOLD)

Harga diformat menggunakan package intl:

NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')

Sehingga input seperti 250000 akan otomatis tampil sebagai Rp 250.000.

---

### e. Status Available & SOLD

Setiap barang memiliki status:

- Available → Barang masih tersedia.
- SOLD → Barang sudah terjual.

Status ini dibuat interaktif menggunakan GestureDetector.  
Ketika card ditekan, fungsi toggleSold() akan dijalankan:

items[index]["isSold"] = !items[index]["isSold"];

Jika berubah menjadi SOLD, sistem otomatis menyimpan tanggal menggunakan DateTime.now().

Fitur ini tidak hanya mempercantik tampilan tetapi juga memiliki fungsi manajemen stok sederhana.

---

### f. Tombol Tambah (+)

Di bagian kanan bawah terdapat FloatingActionButton (+).

Ketika ditekan, aplikasi akan menjalankan:

Navigator.push()

untuk berpindah ke FormPage dalam mode tambah barang (Create).

---

### g. Icon Edit & Delete

Pada setiap card terdapat:

- Icon Pencil (Edit)  
  Mengarahkan ke FormPage dalam mode Edit.

- Icon Delete (Hapus)  
  Menghapus data menggunakan:

items.removeAt(index);

Mode Edit bekerja dengan mengirim data lama ke FormPage melalui parameter barangLama.

---

## 🔹 2. FormPage (Tambah & Edit Barang)

FormPage digunakan untuk menambahkan dan mengedit data barang.

FormPage juga menggunakan StatefulWidget karena memerlukan TextEditingController dan state dinamis.

---

### 1. Upload Foto

Fitur upload foto menggunakan package image_picker.

Gambar yang dipilih disimpan dalam bentuk path:

selectedImage?.path

Kemudian ditampilkan kembali di HomePage menggunakan Image.file().

Saat ini fitur ini masih dalam tahap pengembangan dasar dan dapat dikembangkan lebih lanjut menjadi sistem upload yang lebih kompleks.

---

### 2. Nama Barang

Input dilakukan menggunakan TextField dengan TextEditingController.

Controller ini memungkinkan:
- Mengambil input pengguna
- Mengisi ulang field saat mode edit

---

### 3. Harga Jual

Pengguna memasukkan angka tanpa titik atau koma.

Saat disimpan, data diformat menggunakan intl menjadi format Rupiah.

Contoh:
Input: 250000  
Output: Rp 250.000

---

### 4. Kondisi (Dropdown)

DropdownButton digunakan untuk memilih kondisi:

1. Bekas Ringan  
2. Bekas  
3. Like New  

Nilai yang dipilih disimpan dalam variabel kondisi.

---

### 5. Kategori (Dropdown)

DropdownButton juga digunakan untuk memilih kategori:

- Tas
- Atasan
- Bawahan
- Sepatu
- Aksesoris

Kategori ini terhubung langsung dengan fitur filter di HomePage.

Barang yang ditambahkan otomatis muncul dalam kategori yang sesuai.

---

### 6. Tombol Simpan (Create)

Saat tombol Simpan ditekan:

- Data dikemas dalam bentuk Map
- Dikirim kembali ke HomePage
- Ditambahkan ke list menggunakan items.add()
- Halaman kembali menggunakan Navigator.pop()

---

### 7. Mode Edit (Update)

Jika FormPage dibuka dalam mode edit:

- Field otomatis terisi data lama
- Judul berubah menjadi "Edit Barang"
- Tombol berubah menjadi "Update"

Saat Update ditekan:

items[index] = barangBaru;

Data lama diganti dan langsung diperbarui di HomePage.

---

## Implementasi CRUD

Aplikasi ini telah menerapkan konsep CRUD secara lengkap:

- Create → Menambahkan barang melalui FormPage
- Read → Menampilkan barang dengan ListView.builder
- Update → Mengedit data melalui mode Edit
- Delete → Menghapus barang dari list

Seluruh proses dikelola menggunakan StatefulWidget dan setState tanpa database eksternal.

---

## Multi Page Navigation

Navigasi antar halaman menggunakan:

Navigator.push()  
Navigator.pop()

Alur navigasi:

HomePage → FormPage (Tambah Barang)  
HomePage → FormPage (Edit Barang)  
FormPage → Kembali ke HomePage setelah Simpan/Update

---


