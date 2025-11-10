import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreens extends StatefulWidget{
  const ProfileScreens({super.key});

  @override
  State<ProfileScreens> createState() => _ProfileScreenState();
}



class _ProfileScreenState extends State<ProfileScreens>{
  
  bool isSignedIn = false;
  String fullName = '';
  String userName = '';
  int favoriteCandiCount = 0;

  // TODO 5. Implementasi Fungsi Sign In
  void signIn(){
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  void signOut(){
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200, width: double.infinity,color: Colors.deepPurpleAccent,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // TODO : 2. Buat Bagian ProfileHeader yang berisi gambar profil
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200 - 50),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurple, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('images/place_holder_image.png'),
                        ),
                        ),
                        if(isSignedIn)
                        IconButton(
                          onPressed: (){}, 
                          icon: Icon(Icons.camera_alt, color: Colors.deepPurple[100],),),
                      ],
                    ),
                  ),
                ),
                // TODO : 3. Buat Bagian ProfileInfo yang berisi info profil
                SizedBox(height: 20,),
                Divider(color: Colors.deepPurple[100],),
                SizedBox(height: 4,),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width/3,
                    child: Row(children: [
                      Icon(Icons.lock, color: Colors.amber,),
                      SizedBox(width: 8),
                      Text('Pengguna', style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold,
                    ),),
                    ],
                  ),),
                  Expanded(
                    child: Text(': $userName', style: TextStyle(
                      fontSize: 18),),),
                      if(isSignedIn) Icon(Icons.edit),
                  ],
                ),
                SizedBox(height: 2,),
                Divider(color: Colors.deepPurple[100],),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width/3,
                    child: Row(children: [
                      Icon(Icons.person, color: Colors.lightBlue,),
                      SizedBox(width: 8),
                      Text('Nama', style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold,
                    ),),
                    ],
                  ),),
                  Expanded(
                    child: Text(': $userName', style: TextStyle(
                      fontSize: 18),),),
                      if(isSignedIn) Icon(Icons.edit),
                  ]
                ),
                SizedBox(height: 2,),
                Divider(color: Colors.deepPurple[100],),
                SizedBox(height: 4,),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width/3,
                    child: Row(children: [
                      Icon(Icons.favorite, color: Colors.red,),
                      SizedBox(width: 8),
                      Text('Favorite', style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold,
                    ),),
                    ],
                  ),),
                  Expanded(
                    child: Text(': $userName', style: TextStyle(
                      fontSize: 18),),),
                      if(isSignedIn) Icon(Icons.edit),
                  ]
                ),
                SizedBox(height: 20,),
                Divider(color: Colors.deepPurple[100],),
                SizedBox(height: 4,),
                // TODO : 4. Buat ProfileActions yang berisi TextButton sign in/ sign out
                isSignedIn ? TextButton(onPressed: signOut, child: Text('Sign Out'))
                : TextButton(onPressed: signIn, child: Text('Sign In'))
              ],
            ),
          )
        ],
      ),
    );
  }
}