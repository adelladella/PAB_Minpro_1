### Mini Project 1 
## "Aplikasi Pencatatan Barang Preloved"

###### Nama: Adella Putri
###### NIM: 2409116006
###### Kelas: A, Sistem Informasi 2024


<img width="3780" height="1890" alt="fix pab (1)" src="https://github.com/user-attachments/assets/f74cc5a8-387d-4a65-9203-a8125c91579c" />

# All About PreLove Notes:

**PreLove Notes** merupakan rancangan aplikasi mobile yang digunakan untuk membantu pengguna dalam mencatat dan mengelola barang preloved (barang bekas layak jual) secara terstruktur dan efisien.

Aplikasi ini dibuat sebagai solusi sederhana bagi individu yang sering menjual kembali barang pribadi seperti pakaian, tas, sepatu, atau aksesoris, namun belum memiliki sistem pencatatan yang rapi. Melalui PreLove Notes, pengguna dapat menyimpan informasi penting terkait barang seperti nama, harga jual, kondisi, kategori, serta status ketersediaan barang.

Secara umum, PreLove Notes berfungsi sebagai aplikasi manajemen data barang preloved berbasis CRUD (Create, Read, Update, Delete). Aplikasi ini dirancang dengan tampilan yang sederhana, serta alur penggunaan yang mudah dipahami oleh pengguna awam sekalipun.


 # Struktur File dan Peran Masing-Masing File
<details>
<summary> Click Here </summary>

Aplikasi PreLove Notes dikembangkan menggunakan struktur **multi-file** untuk memisahkan logika dan tampilan agar kode lebih terorganisir dan mudah dipahami.

Struktur utama project terdiri dari tiga file Dart utama:

- *main.dart*
- *home_page.dart*
- *form_page.dart*

Berikut penjelasan masing-masing file:

---

## 1. *main.dart*

File ini merupakan *entry point* (titik awal) dari aplikasi.

Di dalam file ini terdapat:

- Fungsi main() yang menjalankan aplikasi menggunakan ```runApp(). ```
- *Class MyApp* yang membungkus aplikasi dengan MaterialApp.
- Pengaturan halaman awal (*home*) yang diarahkan ke HomePage.

Peran utama ```main.dart``` adalah:

- Menginisialisasi aplikasi Flutter.
- Menentukan halaman pertama yang akan ditampilkan.
- Mengatur konfigurasi dasar aplikasi.

File ini tidak berisi logika CRUD, tetapi hanya berfungsi sebagai penghubung awal aplikasi.

---

## 2. *home_page.dart*

File ini berisi tampilan dan logika utama aplikasi (*HomePage*).

HomePage menggunakan *StatefulWidget* karena:

- Data barang dapat berubah (tambah, edit, hapus, ubah status).
- Tampilan harus diperbarui secara dinamis menggunakan setState().

Fungsi utama file ini:

- Menyimpan seluruh data barang dalam ```List<Map<String, dynamic>>```.
- Menampilkan daftar barang menggunakan ```ListView.builder```.
- Mengatur fitur filter kategori.
- Mengatur status *Available* dan *SOLD*.
- Menangani fungsi *Create, Read, Update,* dan *Delete*.
- Mengatur navigasi ke *FormPage* menggunakan ```Navigator.push()```.

Semua perubahan data diproses di file ini agar tampilan selalu sinkron dengan isi list.

```home_page.dart``` saya gunakan sebagai pusat manajemen data aplikasi.

---

## 3. *form_page.dart*

File ini berisi halaman *FormPage* yang digunakan untuk:

- Menambahkan barang baru (*Create*)
- Mengedit barang yang sudah ada (*Update*)

FormPage juga menggunakan *StatefulWidget* karena:

- Menggunakan *TextEditingController* untuk input.
- Memerlukan *state* untuk dropdown dan gambar.
- Perlu menangani perubahan data sebelum dikirim kembali ke *HomePage*.

Fungsi utama file ini:

- Menampilkan form input (Nama, Harga, Kondisi, Kategori).
- Menangani upload foto menggunakan ```image_picker```.
- Mengemas data dalam bentuk Map.
- Mengirim data kembali ke *HomePage* melalui parameter *onSave*.
- Mengatur perbedaan mode **Tambah** dan **Edit**.

FormPage belum menyimpan data secara permanen, tetapi hanya mengirim data kembali ke *HomePage* untuk dikelola.

---

</details>





# Fitur dan Penjelasan Lebih Lanjut Pada Tiap Page
<details>
<summary>Click Here</summary>

Aplikasi PreLove Notes memiliki beberapa fitur utama yang terbagi ke dalam *HomePage* dan *FormPage*. Pada bagian ini tidak hanya dijelaskan fitur yang tersedia, tetapi juga bagaimana fitur tersebut diimplementasikan di dalam kode program.

---

## 1. HomePage

*HomePage* merupakan halaman utama aplikasi yang menampilkan seluruh data barang preloved yang telah diinput oleh pengguna.

*HomePage* menggunakan *StatefulWidget* karena data yang ditampilkan bersifat dinamis dan dapat berubah (tambah, edit, hapus, ubah status).

Data barang disimpan dalam bentuk:

```List<Map<String, dynamic>> items = [];```

Setiap barang memiliki atribut:
- nama
- harga
- kondisi
- kategori
- imagePath
- isSold
- soldDate

Perubahan data dikontrol menggunakan ```setState()``` agar tampilan otomatis diperbarui.

---

### a. Nama Aplikasi

Pada bagian paling atas terdapat nama aplikasi **“PreLove Notes”** sebagai identitas utama.

<img width="357" height="41" alt="image" src="https://github.com/user-attachments/assets/67d273fc-7ddb-4ffb-b315-64ce58a1938f" />

Bagian ini dibuat menggunakan *widget Row* dan *Text* untuk menampilkan *title* secara konsisten pada bagian atas halaman.

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

Di bawah bagian sapaan terdapat fitur filter berbentuk *horizontal scroll*.

<img width="357" height="50" alt="image" src="https://github.com/user-attachments/assets/4b250e83-5b6a-47c5-84ee-a59599370a97" />

Filter ini dibuat menggunakan:

```ListView (scrollDirection: Axis.horizontal)```

Kategori yang tersedia:
- Semua
- Tas
- Atasan
- Bawahan
- Sepatu
- Aksesoris

 Fitur filter disini bekerja dengan menyaring list menggunakan:

```items.where((item) => item["kategori"] == selectedCategory)```

- Jika pengguna memilih salah satu kategori tertentu (misalnya Tas), maka hanya barang dengan kategori tersebut yang akan ditampilkan.

Sistem memeriksa nilai kategori yang dipilih dan menampilkan data sesuai dengan kategori tersebut menggunakan metode penyaringan pada list.

Fitur ini dirancang agar pengguna dapat melihat seluruh data terlebih dahulu, kemudian menyaring sesuai kebutuhan untuk mempermudah pengelolaan barang.

---

### d. Daftar Barang (Read)

Data barang ditampilkan menggunakan:

```ListView.builder()```

Widget ini memungkinkan daftar barang dibuat secara dinamis sesuai jumlah data dalam list.

Setiap card menampilkan:
- Foto barang (*Image.file*)
- Nama barang
- Harga jual (format Rupiah)
- Kondisi barang
- Status (__*Available*__/__*SOLD*__)

<img width="357" height="146" alt="image" src="https://github.com/user-attachments/assets/ba0584d7-22c1-4013-85c3-7946991a9a77" />


Harga diformat menggunakan package intl:

```NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')```

Sehingga input seperti 250000 akan otomatis tampil sebagai Rp 250.000.

---

### e. Status Available & SOLD

Setiap barang memiliki status:

- *Available* = Barang masih tersedia.
  
<img width="357" height="146" alt="image" src="https://github.com/user-attachments/assets/5030a77c-2285-4e41-b19a-20230b8de70c" />

- *SOLD* = Barang sudah terjual.
  
<img width="357" height="150" alt="image" src="https://github.com/user-attachments/assets/7adced2e-0ebc-49fe-abd6-a84890605c86" />


Status ini dibuat interaktif menggunakan *GestureDetector*.  
Ketika card ditekan, fungsi ```toggleSold()``` akan dijalankan:

```items[index]["isSold"] = !items[index]["isSold"];```

Jika berubah menjadi *SOLD*, sistem otomatis menyimpan tanggal menggunakan ```DateTime.now()```.

<img width="359" height="51" alt="image" src="https://github.com/user-attachments/assets/7dc090cb-fc8f-436d-9f82-95889b0e118b" />

Fitur ini tidak hanya mempercantik tampilan tetapi juga memiliki fungsi manajemen stok sederhana.

---

### f. Tombol Tambah (+)

Di bagian kanan bawah terdapat ```FloatingActionButton (+).```

<img width="434" height="101" alt="image" src="https://github.com/user-attachments/assets/c9acca80-ee50-4fe0-99a0-97a75d1d5c75" />

Ketika ditekan, aplikasi akan menjalankan:

```Navigator.push()```

untuk berpindah ke FormPage dalam mode tambah barang (*Create*).

---

### g. Icon Edit & Delete

Pada setiap card terdapat:

- Icon Pencil (Edit)  
  Mengarahkan ke FormPage dalam mode Edit.
  
<img width="133" height="57" alt="image" src="https://github.com/user-attachments/assets/bde3abe0-42e2-4920-879a-a13909cb28a2" />


- Icon Delete (Hapus)  
  Menghapus data menggunakan:
  
<img width="115" height="60" alt="image" src="https://github.com/user-attachments/assets/e75e72ff-d8d7-4957-a601-8607cb5877c2" />


```items.removeAt(index);```

Mode Edit bekerja dengan mengirim data lama ke *FormPage* melalui parameter *barangLama*.

---

## 🔹 2. FormPage (Tambah & Edit Barang)

*FormPage* digunakan untuk menambahkan dan mengedit data barang.

*FormPage* juga menggunakan StatefulWidget karena memerlukan TextEditingController dan state dinamis.

---

### 1. Upload Foto

Fitur upload foto menggunakan package ```image_picker```.

Gambar yang dipilih disimpan dalam bentuk *path*:

```selectedImage?.path```

Kemudian ditampilkan kembali di HomePage menggunakan *Image.file()*.

Namun, saat ini fitur ini masih dalam tahap pengembangan dan belum dapat digunakan lebih lanjut.

---

### 2. Nama Barang

Input dilakukan menggunakan *TextField* dengan ```TextEditingController```.

*Controller* ini memungkinkan:
- Mengambil input pengguna
- Mengisi ulang field saat mode edit

---

### 3. Harga Jual

Pengguna memasukkan angka tanpa titik atau koma.

Saat disimpan, data diformat menggunakan *intl* menjadi format Rupiah.

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

*DropdownButton* juga digunakan untuk memilih kategori:

<img width="358" height="256" alt="image" src="https://github.com/user-attachments/assets/93912dc3-df3f-4aaf-897f-bd7ecdef6673" />

- Tas
- Atasan
- Bawahan
- Sepatu
- Aksesoris

Kategori ini terhubung langsung dengan fitur filter di *HomePage*.

Barang yang ditambahkan otomatis muncul dalam kategori yang sesuai.

---

### 6. Tombol Simpan (Create)

Saat tombol Simpan ditekan:

<img width="356" height="61" alt="image" src="https://github.com/user-attachments/assets/fb28015b-0d24-4d2b-992b-1a6ad894ed78" />

- Data dikemas dalam bentuk Map
- Dikirim kembali ke HomePage
- Ditambahkan ke list menggunakan ```items.add()```
- Halaman kembali menggunakan ```Navigator.pop()```

---

### 7. Mode Edit (Update)

Jika *FormPage* dibuka dalam mode edit:

<img height="500" alt="iPhone-13-PRO-localhost (6)" src="https://github.com/user-attachments/assets/c60b9177-bd85-4164-a913-af2011f98e1d" />

- Field otomatis terisi data lama
- Judul berubah menjadi "Edit Barang"
- Tombol berubah menjadi "Update"

Saat Update ditekan:

```items[index] = barangBaru;```

Data lama diganti dan langsung diperbarui di *HomePage*.

---

## Implementasi CRUD

Aplikasi ini telah menerapkan konsep CRUD secara lengkap:

- Create untuk Menambahkan barang melalui FormPage
- Read untuk Menampilkan barang dengan ListView.builder
- Update untuk Mengedit data melalui mode Edit
- Delete untuk Menghapus barang dari list

Seluruh proses dikelola menggunakan *StatefulWidget* dan *setState* tanpa database eksternal.

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

# Tampilan Keseluruhan Aplikasi
<details>
<summary> Click Here </summary>


</details>
