# _siarstudio_ 🖼️

Proyek Flutter __PBP__

Puti Raissa/2206830391/PBP-E

## Tugas 7

### Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

🔹 ___Stateless widget___ adalah _widget_ yang _state_-nya tidak dapat diubah setelah dibuat. Dengan kata lain, _widget_ ini bersifat _immutable_. Perubahan apapun pada variabel, ikon, tombol, atau pengambilan data tidak akan mengubah _state_ aplikasi.

🔹 ___Stateful widget___ adalah widget yang state-nya atau propertinya dapat diubah setelah dibuat. Widget ini dapat berubah dan mengalami beberapa perubahan selama _runtime_ atau bersifat _mutable_. Contohnya adalah `Text Fields, Checkbox, Radio buttons, etc.`

### Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

1. `MaterialApp`    : Menyediakan struktur dasar untuk tampilan aplikasi, seperti tema, home, dan lain-lain.
2. `Scaffold`       : Widget ini menyediakan struktur dasar untuk tampilan aplikasi, seperti AppBar, body, dan lain-lain.
3. `AppBar`         : Membuat AppBar/judul pada aplikasi.
4. `Text`           : Menampilkan teks beserta _style_ nya
5. `Column`         : Menampilkan children widget secara vertikal.
6. `SingleChildScrollView`: Membuat widget yang dapat discroll.
7. `Padding`        : Memberikan padding pada widget yang diinginkan.
8. `GridView.count` : Menampilkan widget dalam bentuk grid.
9. `Material`       : Membuat sebuah Material Design card.
10. `InkWell`        : Membuat area yang responsif terhadap sentuhan.
11. `Container`     : Membuat sebuah kotak yang dapat menampung widget lainnya.
12. `Icon`          : Menampilkan sebuah icon.
13. `SnackBar`      : Menampilkan pesan singkat yang muncul di bagian bawah layar.


### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

- __Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.__

    Sebelumnya saya pastikan terlebih dahulu bahwa flutter sudah terunduh dengan menjalankan perintah `flutter doctor`. Setelah itu saya siapkan direktori baru dan membuat aplikasi baru dengan menjalankan perintah

    ```
    flutter create siarstudio
    ```

    Sebelum lanjut mengembangkan aplikasi, saya merapikan struktur file dahulu.

    Saya buat file `menu.dart` pada direktori `siarstudio/lib` dan menambahkan potongan kode

    ```
    import 'package:flutter/material.dart';
    ```
    Pada `main.dart` saya menghapus kelas `MyHomePage` dan `_MyHomePageState` dan menambahkan

    ```
    import 'package:siarstudio/menu.dart';
    ```
    Kemudian saya tambahkan kelas `MyHomePage` pada `menu.dart` sebagai widget yang bersifat `stateless`

    ```
    class MyHomePage extends StatelessWidget {
        MyHomePage({Key? key}) : super(key: key);

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                ...
            );
        }
    }
    ```

- __Membuat tiga tombol sederhana dengan ikon dan teks__

    Saya akan membuat tombol dengan menggunakan card. Pertama saya definisikan tombol dalam suatu class

    ```
    class StudioItem {
        final String name;
        final IconData icon;
        final Color color;

        StudioItem(this.name, this.icon, this.color);
    }
    ```

    Kemudian pada class `MyHomePage` saya tambahkan list berisi objek tombol tersebut. Di bawah kode `MyHomePage({Key? key}) : super(key: key);` saya tambahkan

    ```
    final List<StudioItem> items = [
        StudioItem("Lihat Item", Icons.checklist, Colors.purple.shade900),
        StudioItem("Tambah Item", Icons.add_circle, Colors.blue.shade900),
        StudioItem("Logout", Icons.logout, Colors.pinkAccent.shade700),
    ];
    ```

    Lalu saya buat widget baru untuk membuat cards tersebut
    ```
    class StudioCard extends StatelessWidget {
    final StudioItem item;

    const StudioCard(this.item, {super.key}); // Constructor

    @override
    Widget build(BuildContext context) {
      return Material(
        color: item.color,
        child: InkWell(
            child: Container(
            // Container untuk menyimpan Icon dan Text
            padding: const EdgeInsets.all(8),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item.icon,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }
    ```

Untuk menampilkan card, saya buat halaman utama dengan menambahkan kode berikut

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SiarStudio',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      foregroundColor: Colors.white,
      backgroundColor: Colors.purple.shade900,
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Siar Shop', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((StudioItem item) {
                  // Iterasi untuk setiap item
                  return StudioCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );

- Memunculkan __Snackbar__

    Pada widget card yang sudah dibuat saya tambahkan potongan kode burikut di bawah kode `child: InkWell(`

    ```
    child: InkWell(
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
    },
    ```

