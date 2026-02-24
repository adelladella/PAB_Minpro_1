import 'package:flutter/material.dart';
import 'form_page.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = "Semua";

  final List<Map<String, dynamic>> items = [];
  String formatRupiah(String angka) {
    int value = int.tryParse(angka) ?? 0;

    final formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return formatCurrency.format(value);
  }

  void tambahBarang(Map<String, dynamic> barang) {
    setState(() {
      items.add(barang);
    });
  }

  void updateBarang(int index, Map<String, dynamic> barangBaru) {
    setState(() {
      items[index] = barangBaru;
    });
  }

  void hapusBarang(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  void toggleSold(int index) {
    setState(() {
      items[index]["isSold"] = !items[index]["isSold"];

      if (items[index]["isSold"]) {
        final now = DateTime.now();
        items[index]["soldDate"] = "${now.day}-${now.month}-${now.year}";
      } else {
        items[index]["soldDate"] = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List filteredItems = selectedCategory == "Semua"
        ? items
        : items.where((item) => item["kategori"] == selectedCategory).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5E6D3),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // TOP BAR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.menu, color: Color(0xFF5C4033)),
                  Text(
                    "PreLove Notes",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5C4033),
                    ),
                  ),
                  Icon(Icons.notifications_none, color: Color(0xFF5C4033)),
                ],
              ),

              const SizedBox(height: 25),

              // GREETING
              const Text(
                "Welcome, Adella ✦",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5C4033),
                ),
              ),

              const SizedBox(height: 8),

              Row(
                children: const [
                  Text(
                    "Kelola barang preloved kamu hari ini ",
                    style: TextStyle(fontSize: 14, color: Color(0xFF8B6B4F)),
                  ),
                  Icon(Icons.favorite, size: 16, color: Color(0xFF8B6B4F)),
                ],
              ),

              const SizedBox(height: 20),

              // CATEGORY SCROLL
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    categoryChip("Semua"),
                    categoryChip("Tas"),
                    categoryChip("Atasan"),
                    categoryChip("Bawahan"),
                    categoryChip("Sepatu"),
                    categoryChip("Aksesoris"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // LIST BARANG
              Expanded(
                child: ListView.builder(
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    int realIndex = items.indexOf(item);

                    return GestureDetector(
                      onTap: () => toggleSold(realIndex),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.brown.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // IMAGE
                            item["imagePath"] != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.file(
                                      File(item["imagePath"]),
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE6D5C3),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Icon(Icons.image),
                                  ),

                            const SizedBox(width: 12),

                            // DETAIL
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item["nama"],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  Text(formatRupiah(item["harga"])),

                                  Text("Kondisi: ${item["kondisi"]}"),

                                  const SizedBox(height: 6),

                                  item["isSold"] == true
                                      ? Row(
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 4,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF8B6B4F),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: const Text(
                                                "SOLD",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              item["soldDate"] ?? "",
                                              style: const TextStyle(
                                                fontSize: 11,
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFE6D5C3),
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: const Text(
                                            "Available",
                                            style: TextStyle(fontSize: 11),
                                          ),
                                        ),
                                ],
                              ),
                            ),

                            // ACTION BUTTON
                            Column(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit, size: 18),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FormPage(
                                          barangLama: item,
                                          onSave: (barangBaru) {
                                            updateBarang(realIndex, barangBaru);
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, size: 18),
                                  onPressed: () => hapusBarang(realIndex),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF8B6B4F),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormPage(onSave: tambahBarang),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget categoryChip(String text) {
    bool isSelected = selectedCategory == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = text;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF8B6B4F) : const Color(0xFFE6D5C3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF5C4033),
            ),
          ),
        ),
      ),
    );
  }
}
