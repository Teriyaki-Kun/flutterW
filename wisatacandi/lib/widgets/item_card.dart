import 'package:flutter/material.dart';
import 'package:wisatacandi/models/candi.dart';
import 'package:wisatacandi/screens/detail_screen.dart';

class ItemCard extends StatelessWidget {
  // TODO 1. Deklarasi Variabel Yang Akan Di Gunakan
  final Candi candi;
  const ItemCard({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    // TODO 6. Implementasi Routing ke Detail Screen
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(candi: candi))
        );
      },
      child: Card(
        // TODO 2. Tetapkan Parameter shape, margin , dan elevation dari Card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(4),
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded( 
              // TODO 7. Implementasi Hero Animation
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: 
                  // TODO 3. Buat Image Sebagai Anak Dari Column
                  Image.asset(
                    candi.imageAsset,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
              ),
            ),
            // TODO 4. Buat Text Sebagai Anak Dari 
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                candi.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // TODO 5. Buat Text Sebagai Anak Dari Column
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                candi.type,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}