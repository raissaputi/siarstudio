# _siarstudio_ 🖼️

Proyek Flutter __PBP__

Puti Raissa/2206830391/PBP-E

### Arsip Tugas
<details>
<summary>Tugas 7</summary>

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
</details>

<details>
<summary>Tugas 8</summary>

## Tugas 8

### Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

🔹 __Navigator.push()__ menambahkan _route_ baru ditambahkan ke dalam _stack_, sehingga _stack_ akan berisi _route_ sebelumnya dan _route_ yang baru ditambahkan.

```
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const StudioFormPage(),
  )
);
```
🔹 __Navigator.pushReplacement()__ akan menggantikan _route_ sebelumnya dalam _stack_ dengan _route_ baru yang ditentukan.

```
Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => MyHomePage(),
  )
);
```

### Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

Berikut adalah beberapa _widget layout_ yang tersedia di Flutter:

- `Align` : Widget yang mengatur posisi child di dalam dirinya dan opsional mengatur ukuran widget berdasarkan ukuran child.

- `Center` : Blok alignment yang menempatkan child di tengah-tengah dirinya.

- `Container` : Widget yang menggabungkan widget painting, positioning, dan sizing yang umum.

- `Expanded` : Widget yang memperluas child dari Row, Column, atau Flex.

- `Padding` : Widget yang memasukkan child-nya dengan padding yang diberikan.

- `Column` : Widget yang mengatur daftar child widget secara vertikal.

- `GridView` : Daftar grid terdiri dari pola sel yang diatur dalam layout vertikal dan horizontal.

- `ListView` : Daftar scrollable dan linear dari widget.

- `Row` : Widget yang mengatur daftar child widget secara horizontal.

- `Stack` : Menumpuk beberapa child dengan cara yang sederhana

- `Table` : Menampilkan child widget dalam baris dan kolom.

### Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

Pada tugas ini saya menggunakan `TextFormField` karena dapat memvalidasi input  sebelum menyimpan datanya. `TextFormField` juga memungkinkan untuk menampilkan pesan kesalahan jika input pengguna tidak valid.

### Bagaimana penerapan clean architecture pada aplikasi Flutter?

_Clean Architecture_ adalah sebuah konsep arsitektur yang memisahkan kode menjadi beberapa lapisan yang berbeda untuk memudahkan pengembangan, pemeliharaan, dan pengujian aplikasi. Pada umumnya, arsitektur ini terdiri dari tiga layer utama: domain, data, dan presentation.

- _Domain layer_ berisi bisnis logika dan aturan aplikasi. Lapisan ini tidak bergantung pada lapisan lainnya, sehingga dapat digunakan kembali pada aplikasi lain.
- _Data layer_ bertanggung jawab untuk mengambil dan menyimpan data dari berbagai sumber, seperti database, API, atau penyimpanan lokal. Lapisan ini juga bertanggung jawab untuk memetakan data ke dalam model domain.
- _Presentation layer_ adalah lapisan yang berhubungan langsung dengan pengguna. Lapisan ini bertanggung jawab untuk menampilkan data ke pengguna dan menerima input dari pengguna. Pada proyek ini terdapat di folder _screens_.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

__Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru.__

Halaman formulir dapat dilihat pada file `studio_form.dart`. Pada halaman ini saya menggunakan widget `Form` yang menggunakan `TextFormField` untuk masing-masing input. Tiap elemen input validator sehingga tipe data input sesuai dan tidak ada input kosong. Terakhir saya tambahkan tombol save seperti berikut

```
child: ElevatedButton(
  style: ButtonStyle(
    backgroundColor:
        MaterialStateProperty.all(Colors.purple.shade900),
  ),
  onPressed: () {
    // Menunjukkan pop-up -> checklist 3
  },
  child: const Text(
    "Save",
    style: TextStyle(color: Colors.white),
  ),
),
```

<br>

__Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.__

Sebelum itu saya memindahkan elemen _card_ pada file terpisah yaitu `studio_card.dart`. Pada file ini saya tambahkan kode berikut

```
onTap: () {
  // Memunculkan SnackBar ketika diklik
  ...

  if (item.name == "Tambah Item") {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const StudioFormPage(),
      )
    );
  }
},
```

Sehingga saat card ditekan pengguna akan diarahkan ke halaman form.

<br>

__Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.__

Pada potongan kode di poin checklist pertama ditambahkan kode berikut

```
onPressed: () {
  if (_formKey.currentState!.validate()) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Item berhasil tersimpan'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text('Nama: $_name'),
                Text('Jumlah: $_amount'),
                Text('Deskripsi: $_description'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  _formKey.currentState!.reset();
  }
},
```

Jika input pengguna valid, maka akan muncul pop-up yang berisi data yang baru saja di-input.

<br>

__Membuat sebuah drawer pada aplikasi.__

Pertama saya buat drawer seperti berikut.

```
import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(),
          ListTile(),
        ],
      ),
    );
  }
}
```

Lalu ditambahkan header yang berisi keterangan aplikasi

```
decoration: BoxDecoration(
  color: Color.fromRGBO(74, 20, 140, 1),
),
child: Column(
  children: [
    Text(
      'SiarStudio',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    Padding(padding: EdgeInsets.all(16)),
    Text("Keep track of your Studio here!",
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
    ),
  ],
),
```

Dan routing untuk halaman utama dan halaman formulir.

```
ListTile(
  leading: const Icon(Icons.home_outlined),
  title: const Text('Halaman Utama'),
  // Bagian redirection ke MyHomePage
  onTap: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomePage(),
      )
    );
  },
),
ListTile(
  leading: const Icon(Icons.add_circle),
  title: const Text('Tambah Item'),
  // Bagian redirection ke StudioFormPage
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const StudioFormPage(),
      )
    );
  },
),
```
</details>


## Tugas 9

### Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

🔹 Ya, data JSON dapat diambil membuat model terlebih dahulu, yaitu dengan membuat dynamic map dari JSON dan mengakses nilainya seperti dictionary. Namun, hal tersebut bukan penggunaan yg baik karena kegunaan model itu untuk membuat representasi objek dari suatu data JSON sehingga penyimpanan data lebih rapi dan aman.

### Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

CookieRequest adalah kelas yang digunakan untuk mengirim permintaan HTTP dengan cookie. Dalam aplikasi Flutter, CookieRequest digunakan untuk mengirim permintaan HTTP dengan cookie ke server. Dalam beberapa kasus, seperti saat menggunakan autentikasi berbasis cookie, CookieRequest sangat berguna. CookieRequest dibagikan ke semua komponen di aplikasi flutter supaya status login konosisten di setiap halaman.

### Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.

Untuk mengambil data dari JSON dan menampilkannya pada Flutter, dilalui beberapa langkah berikut:

1. Mengirim permintaan HTTP ke server menggunakan `http.get()` dengan URL yang sesuai.

2. Mendapatkan respons dari server dalam bentuk JSON.

3. Melakukan decode respons menjadi bentuk JSON menggunakan `jsonDecode()`.

4. Melakukan konversi data JSON menjadi objek yang sesuai.

5. Menampilkan data yang diambil pada aplikasi Flutter.

```
Future<List<Item>> fetchItem() async {
  var url = Uri.parse(
    'https://puti-raissa-tugas.pbp.cs.ui.ac.id/json/');
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object Item
  List<Item> list_item = [];
  for (var d in data) {
    if (d != null) {
      list_item.add(Item.fromJson(d));
    }
  }
  return list_item;
}
```

Fungsi `fetchItem()` melakukan hal-hal tersebut. Pertama, mengirim permintaan HTTP ke server menggunakan URL yang sesuai. Kemudian, didapatkan respons dari server dalam bentuk JSON. Setelah itu, dilakukan decode respons menjadi bentuk JSON menggunakan `jsonDecode()`. Selanjutnya, dilakukan konversi data JSON menjadi objek `Item` menggunakan `Item.fromJson()`. Akhirnya, direturn list objek `Item` yang telah diambil dari server.

### Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

__1. Input Akun di Flutter:__

Pengguna memasukkan username dan password.

```
String username = _usernameController.text;
String password = _passwordController.text;
```
__2. Permintaan Autentikasi ke Django:__

Flutter mengirim permintaan autentikasi ke Django.

```
final response = await request.login("https://puti-raissa-tugas.pbp.cs.ui.ac.id/auth/login/", {
  'username': username,
  'password': password,
});
```
__3. Autentikasi oleh Django:__

Django memeriksa kredensial dan memberikan respons berhasil atau gagal.

```
def login_view(request):
    user = authenticate(request, username=request.POST['username'], password=request.POST['password'])
    return JsonResponse({'message': 'Login berhasil', 'username': user.username} if user else {'message': 'Login gagal'})
```

__4. Navigasi dan Tampilan Menu di Flutter:__

Jika berhasil, Flutter navigasi ke halaman beranda dan menampilkan pesan selamat datang.

```
if (request.loggedIn) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$message Selamat datang, $uname.")));
} else {
  // Tampilkan dialog jika login gagal
  showDialog(/*...*/);
``````

### Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.

Di luar widget yang dipakai pada tugas sebelumnya saya memakai:

1. __`BuildContext`__: Handle ke lokasi widget dalam pohon widget.

2. __`Provider`__: Widget untuk mengelola state.

3. __`CookieRequest`__: Kelas kustom untuk membuat permintaan HTTP dengan cookie.

4. __`TextEditingController`__: Pengontrol untuk bidang teks yang dapat diedit.

5. __`MaterialPageRoute`__: Rute halaman modal yang menggantikan seluruh layar dengan halaman baru.

6. __`ScaffoldMessenger`__: Pesan untuk menampilkan snack bar.

7. __`AlertDialog`__: Dialog dengan judul, konten, dan tindakan.

8. __`TextButton`__: Tombol teks yang digunakan dalam tindakan `AlertDialog`.


### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

🔹 Menambahkan dependensi yang diperlukan dalam proyek Flutter (provider, pbp_django_auth, http)

🔹 Menyediakan library CookieRequest ke semua widget anak menggunakan Provider pada file menu.dart

1. Buat file login.dart di direktori screens.
2. Implementasikan tampilan formulir login sesuai kebutuhan.
3. Mengarahkan ke main.dart

🔹 Buat file list_item.dart di direktori screens. File ini bertanggung jawab untuk menampilkan list semua Item yang diambil dari server.

🔹 Modifikasi file studio_form.dart di direktori screens agar dapat mengubah input menjadi format JSON dan mengirimkannya ke server.

🔹 Buat file detail_item.dart di direktori screens. File ini akan menampilkan semua informasi Item dengan detail.

🔹 Modifikasi menu.dart di direktori screens agar tombol logout dapat membuat pengguna keluar dari aplikasi dan kembali ke halaman login.gunakan Provider untuk mengelola status login.

🔹 Semua perubahan ini membentuk struktur dasar aplikasi Flutter yang mencakup halaman login, tampilan daftar item, formulir item, dan tampilan detail item, serta kemampuan untuk logout.