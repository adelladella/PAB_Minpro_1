import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class FormPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onSave;
  final Map<String, dynamic>? barangLama;

  const FormPage({super.key, required this.onSave, this.barangLama});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();

  String kondisi = "Bekas Ringan";
  String kategori = "Tas";

  File? selectedImage;
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();

    if (widget.barangLama != null) {
      namaController.text = widget.barangLama!["nama"];
      hargaController.text = widget.barangLama!["harga"];
      kondisi = widget.barangLama!["kondisi"];
      kategori = widget.barangLama!["kategori"];

      if (widget.barangLama!["imagePath"] != null) {
        selectedImage = File(widget.barangLama!["imagePath"]);
      }
    }
  }

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E6D3),

      appBar: AppBar(
        backgroundColor: const Color(0xFF8B6B4F),
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.barangLama == null ? "Tambah Barang" : "Edit Barang",
          style: const TextStyle(color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),

            // FOTO PREVIEW
            Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFE6D5C3),
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: selectedImage != null
                    ? Image.file(selectedImage!, fit: BoxFit.cover)
                    : const Center(
                        child: Icon(
                          Icons.image,
                          size: 40,
                          color: Color(0xFF5C4033),
                        ),
                      ),
              ),
            ),

            const SizedBox(height: 15),

            // UPLOAD BUTTON
            GestureDetector(
              onTap: pickImage,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6D5C3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.camera_alt, size: 16, color: Color(0xFF5C4033)),
                    SizedBox(width: 6),
                    Text(
                      "Upload Foto",
                      style: TextStyle(color: Color(0xFF5C4033)),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // NAMA BARANG
            buildLabel("Nama Barang"),
            const SizedBox(height: 6),
            buildTextField(namaController),

            const SizedBox(height: 20),

            // HARGA
            buildLabel("Harga Jual"),
            const SizedBox(height: 6),
            buildTextField(hargaController),

            const SizedBox(height: 20),

            // KONDISI
            buildLabel("Kondisi"),
            const SizedBox(height: 6),
            buildDropdown(
              value: kondisi,
              items: const ["Bekas Ringan", "Bekas", "Like New"],
              onChanged: (value) {
                setState(() {
                  kondisi = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            // KATEGORI
            buildLabel("Kategori"),
            const SizedBox(height: 6),
            buildDropdown(
              value: kategori,
              items: const ["Tas", "Atasan", "Bawahan", "Sepatu", "Aksesoris"],
              onChanged: (value) {
                setState(() {
                  kategori = value!;
                });
              },
            ),

            const SizedBox(height: 30),

            // BUTTON SIMPAN
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B6B4F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  if (namaController.text.isEmpty ||
                      hargaController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Isi semua data dulu")),
                    );
                    return;
                  }

                  final barang = {
                    "nama": namaController.text,
                    "harga": hargaController.text,
                    "kondisi": kondisi,
                    "kategori": kategori,
                    "isSold": widget.barangLama?["isSold"] ?? false,
                    "soldDate": widget.barangLama?["soldDate"],
                    "imagePath": selectedImage?.path,
                  };

                  widget.onSave(barang);
                  Navigator.pop(context);
                },
                child: Text(
                  widget.barangLama == null ? "Simpan" : "Update",
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Color(0xFF5C4033),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget buildDropdown({
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        underline: const SizedBox(),
        items: items
            .map((item) => DropdownMenuItem(value: item, child: Text(item)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
