import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class ProfileScreens extends StatefulWidget{
  const ProfileScreens({super.key});

  @override
  State<ProfileScreens> createState() => _ProfileScreenState();
}



class _ProfileScreenState extends State<ProfileScreens>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200, width: double.infinity,color: Colors.deepPurpleAccent,
          ),
          Column(
            children: [
              // TODO : 2. Buat Bagian ProfileHeader yang berisi gambar profil
              // TODO : 3. Buat Bagian ProfileInfo yang berisi info profil
              // TODO : 4. Buat ProfileActions yang berisi TextButton sign in/ sign out
            ],
          )
        ],
      ),
    );
  }
}