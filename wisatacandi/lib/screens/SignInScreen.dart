// Import library gestures untuk menangani gesture seperti tap
import 'package:flutter/gestures.dart';
// Import library material untuk menggunakan widget Material Design
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Import SignUpScreen untuk navigasi
import 'package:wisatacandi/screens/signup_screen.dart';

// Kelas SigninScreen yang merupakan StatefulWidget karena memiliki state yang berubah
class SigninScreen extends StatefulWidget {
  // Constructor dengan optional parameter key
  SigninScreen({super.key});

  @override
  // Method untuk membuat state dari widget ini
  State<SigninScreen> createState() => _SigninScreenState();
}

// State class untuk SigninScreen yang mengelola state widget
class _SigninScreenState extends State<SigninScreen> {
  // TODO: 1. Deklarasikan variabel
  // Controller untuk mengelola input username
  final TextEditingController _usernameController = TextEditingController();

  // Controller untuk mengelola input password
  final TextEditingController _passwordController = TextEditingController();

  // Variabel untuk menyimpan pesan error
  String _errorText = '';

  // Variabel untuk menandai apakah user sudah sign in
  bool _isSignedIn = false;

  // Variabel untuk mengontrol visibilitas password (true = disembunyikan)
  bool _obscurePassword = true;

  void _signIn() async {
    // Implementasi logika sign in di sini
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String savedUsername = prefs.getString('username') ?? '';
    final String savedPassword = prefs.getString('password') ?? '';
    final String enteredUsername = _usernameController.text.trim();
    final String enteredPassword = _passwordController.text.trim();

    if (enteredUsername.isEmpty || enteredPassword.isEmpty) {
      setState(() {
        _errorText = 'Nama Pengguna dan Kata Sandi harus diisi.';
      });
      return;
    }

    if (savedUsername.isEmpty || savedPassword.isEmpty) {
      setState(() {
        _errorText = 'Akun tidak ditemukan. Silakan daftar terlebih dahulu.';
      });
      return;
    }

    if (enteredUsername == savedUsername && enteredPassword == savedPassword) {
      setState(() {
        _isSignedIn = true;
        _errorText = '';
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Tunggu hingga frame saat ini selesai
        Navigator.of(
          context,
        ).popUntil((route) => route.isFirst); // Kembali ke halaman utama
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(
          context,
          '/',
        ); // Navigasi ke halaman utama
      });
    } else {
      setState(() {
        _errorText = 'Nama Pengguna atau Kata Sandi salah.';
      });
    }
  }

  @override
  // Method build untuk membangun tampilan widget
  Widget build(BuildContext context) {
    // Scaffold adalah struktur dasar halaman dengan AppBar dan Body
    return Scaffold(
      // TODO : 2  Pasang Appbar
      // AppBar di bagian atas halaman
      appBar: AppBar(
        // Judul AppBar
        title: const Text("Sign In"),
        // Menempatkan judul di tengah
        // centerTitle: true,
        // Warna latar belakang AppBar
        backgroundColor: Colors.deepPurple,
      ),
      // TODO : 3  Pasang Body
      // Body adalah konten utama halaman
      body: Center(
        // SingleChildScrollView agar konten bisa di-scroll jika melebihi layar
        child: SingleChildScrollView(
          // Padding memberikan jarak di sekitar konten
          child: Padding(
            // Jarak 16 pixel dari semua sisi
            padding: const EdgeInsets.all(16.0),
            // Form widget untuk mengelompokkan input fields
            child: Form(
              // Column untuk menyusun widget secara vertikal
              child: Column(
                // TODO : 4 atur mainAxisAlignment dan crossAxisAlignment
                // Konten berada di tengah secara vertikal
                mainAxisAlignment: MainAxisAlignment.center,
                // Konten berada di tengah secara horizontal
                crossAxisAlignment: CrossAxisAlignment.center,
                // Array children berisi widget-widget yang akan ditampilkan
                children: [
                  // TODO : 5 Pasang Text FormField untuk Username
                  // TextFormField untuk input username
                  TextFormField(
                    // Menghubungkan controller untuk mengambil dan mengatur nilai
                    controller: _usernameController,
                    // Dekorasi tampilan input field
                    decoration: InputDecoration(
                      // Label yang muncul di atas field
                      labelText: "Nama Pengguna",
                      // Border outline di sekitar field
                      border: OutlineInputBorder(),
                    ),
                  ),
                  // TODO : 6 Pasang Text FormField untuk Password
                  // SizedBox untuk memberikan jarak vertikal 16 pixel
                  SizedBox(height: 16),
                  // TextFormField untuk input password
                  TextFormField(
                    // Menghubungkan controller untuk mengambil dan mengatur nilai
                    controller: _passwordController,
                    // Dekorasi tampilan input field
                    decoration: InputDecoration(
                      // Label yang muncul di atas field
                      labelText: "Kata Sandi",
                      // Menampilkan pesan error jika ada
                      errorText: _errorText.isNotEmpty ? _errorText : null,
                      // Border outline di sekitar field
                      border: OutlineInputBorder(),
                      // Icon di sebelah kanan field untuk toggle visibility password
                      suffixIcon: IconButton(
                        // Fungsi yang dipanggil saat tombol ditekan
                        onPressed: () {
                          // setState untuk memperbarui UI
                          setState(() {
                            // Toggle nilai _obscurePassword (true/false)
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        // Icon yang ditampilkan berdasarkan state _obscurePassword
                        icon: Icon(
                          // Jika password tersembunyi, tampilkan icon visibility_off
                          _obscurePassword
                              ? Icons.visibility_off
                              // Jika password terlihat, tampilkan icon visibility
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    // Menyembunyikan atau menampilkan teks password
                    obscureText: _obscurePassword,
                  ),
                  // TODO : 7 Pasang Button Sign In
                  // SizedBox untuk memberikan jarak vertikal 16 pixel
                  SizedBox(height: 16),
                  // ElevatedButton untuk tombol Sign In
                  ElevatedButton(
                    // Fungsi yang dipanggil saat tombol ditekan (masih kosong)
                    onPressed: () {
                      _signIn();
                    },
                    // Teks yang ditampilkan di tombol
                    child: const Text("Sign In"),
                  ),
                  SizedBox(height: 16),
                  // TODO : 8 Pasang Button Sign Up
                  // TextButton yang di-comment out (tidak digunakan)
                  // TextButton(
                  //   onPressed: () {},
                  //   child: const Text("Belum punya akun? Sign Up"),
                  // ),
                  // RichText untuk membuat teks dengan style berbeda
                  RichText(
                    // TextSpan adalah bagian teks dengan style tertentu
                    text: TextSpan(
                      // Teks pertama: "Belum punya akun? "
                      text: "Belum punya akun? ",
                      // Style untuk teks pertama (warna hitam)
                      style: TextStyle(color: Colors.black),
                      // Array children berisi TextSpan lainnya
                      children: [
                        // TextSpan untuk teks "Sign Up" yang bisa diklik
                        TextSpan(
                          // Teks yang ditampilkan
                          text: "Sign Up",
                          // Style dengan warna biru dan garis bawah
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          // Recognizer untuk menangani gesture tap
                          recognizer: TapGestureRecognizer()
                            // Callback saat teks di-tap
                            ..onTap = () {
                              // Navigasi ke halaman Sign Up
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ),
                              );
                              // Navigator.pushNamed(context, '/signup');
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}