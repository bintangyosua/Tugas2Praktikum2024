# Tugas Pertemuan 2

Nama : Panky Bintang Pradana Yosua <br>
NIM : H1D022077 <br>
Shift Baru: Shift F

## 1. Memulai Aplikasi.

Langkah memulai aplikasi dimulai dengan menjalankan `runApp` pada fungsi `main()`. `runApp` menggunakan `MyApp` sebagai widget utama. Widget utama memanggil widget `FormData`.

```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple),
      title: "Aplikasi Flutter Pertama",
      home: const FormData(),
    );
  }
}
```

## 2. Menampilkan Stateful Widget Form

Hal ini dilakukan dengam membuat class `FormData` berupa `StatefulWidget`. Class ini akan digunakan untuk class FormDataState berupa widget State yang akan menampilkan Form.

Pada langkah ini, dibuat `_namaController`, `_nimiController`, dan `_tahunController` berupa `TextEditingController` sebagai controller untuk mengontrol nilai dari `nama`, `nim`, dan `tahun`.

```dart
class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  FormDataState createState() => FormDataState();
}

class FormDataState extends State<FormData> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Input Data",
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo[600],
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _textboxNama(),
            const SizedBox(height: 10),
            _textboxNIM(),
            const SizedBox(height: 10),
            _textboxTahun(),
            const SizedBox(height: 10),
            _tombolSimpan()
          ],
        ),
      ),
    );
  }

  _textboxNama() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama"),
      controller: _namaController,
    );
  }

  _textboxNIM() {
    return TextField(
      decoration: const InputDecoration(labelText: "NIM"),
      controller: _nimController,
    );
  }

  _textboxTahun() {
    return TextField(
      decoration: const InputDecoration(labelText: "Tahun Lahir"),
      controller: _tahunController,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        String nama = _namaController.text;
        String nim = _nimController.text;
        int tahun = int.parse(_tahunController.text);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                TampilData(nama: nama, nim: nim, tahun: tahun)));
      },
      child: const Text(
        'Simpan',
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(50),
          backgroundColor: Colors.indigo[600],
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)))),
    );
  }
}
```

## 3. Mengisi Form

Mengisi Form dilakukan dengan mengisi form yang ada pada kode berikut:

```dart
body: Container(
  margin: const EdgeInsets.all(10),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      _textboxNama(),
      const SizedBox(height: 10),
      _textboxNIM(),
      const SizedBox(height: 10),
      _textboxTahun(),
      const SizedBox(height: 10),
      _tombolSimpan()
      ],
    ),
  ),
```

Masing-masing field menggunakan controller-nya masing-masing. Field `_textboxNama`, `_textboxNIM`, dan `_textboxTahun` akan merender widget di bawah. Input field menggunakan `InputDecoration` sebagai form.

```dart
_textboxNama() {
  return TextField(
    decoration: const InputDecoration(labelText: "Nama"),
    controller: _namaController,
  );
}

_textboxNIM() {
  return TextField(
    decoration: const InputDecoration(labelText: "NIM"),
    controller: _nimController,
  );
}

_textboxTahun() {
  return TextField(
    decoration: const InputDecoration(labelText: "Tahun Lahir"),
    controller: _tahunController,
  );
}
```

## 4. Klik Simpan

Setelah semua field pada form terisi, langkah selanjutnya adalah mengirim data (Simpan data) dengan tombol bertuliskan `Simpan`. Tombol simpan dirender pada kode di bawah:

```dart
_tombolSimpan() {
  return ElevatedButton(
    onPressed: () {
      String nama = _namaController.text;
      String nim = _nimController.text;
      int tahun = int.parse(_tahunController.text);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              TampilData(nama: nama, nim: nim, tahun: tahun)));
    },
    child: const Text(
      'Simpan',
      style: TextStyle(color: Colors.white),
    ),
    style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(50),
        backgroundColor: Colors.indigo[600],
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)))),
  );
}
```

Hal yang terjadi di sini adalah, ketika tombol submit diklik akan membuat variable `nama`, `nim`, dan `tahun`, dimana tahun merupakan perbedaan antara tahun sekarang dengan tahun yang dimasukkan (sekarang - tahun) sehingga menjadi umur. Setelah itu, merender TampilData dengan parameter `nama`, `nim`, dan `tahun`.

## 5. Menampilkan Hasil Pengisian Form

Class `TampilData` digunakan untuk merender halaman tampil data. state `nama`, `nim`, dan `tahun` digunakan untuk menyimpan nilai `nama`, `nim`, dan `tahun` yang dikirim dari tombol `Simpan`.

```dart
class TampilData extends StatelessWidget {
  final String nama;
  final String nim;
  final int tahun;

  const TampilData({
    Key? key,
    required this.nama,
    required this.nim,
    required this.tahun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int umur = DateTime.now().year - tahun;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perkenalan"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Text("Nama saya $nama, NIM $nim, dan umur saya adalah $umur tahun"),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(nama),
              subtitle: const Text('Nama'),
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: Text(nim),
              subtitle: const Text('NIM'),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: Text('$umur tahun'),
              subtitle: const Text('Umur'),
            )
          ],
        ),
      ),
    );
  }
}
```

Hasil pengisian form ditampilkan dalam bentuk `ListTile` dengan icon dan keterangannya masing-masing. Hal ini dilakukan dengan merendernya sebagai children berupa list.

```dart
body: Container(
  margin: const EdgeInsets.all(10),
  child: Column(
    children: [
      // Text("Nama saya $nama, NIM $nim, dan umur saya adalah $umur tahun"),
      ListTile(
        leading: const Icon(Icons.person),
        title: Text(nama),
        subtitle: const Text('Nama'),
      ),
      ListTile(
        leading: const Icon(Icons.school),
        title: Text(nim),
        subtitle: const Text('NIM'),
      ),
      ListTile(
        leading: const Icon(Icons.calendar_month),
        title: Text('$umur tahun'),
        subtitle: const Text('Umur'),
      )
    ],
  ),
),
```

## Kesimpulan

Flutter menggunakan `InputDecoration` untuk membuat form. Form disimpan dalam bentuk state dan widget harus berupa `Stateful Widget`. Masing-masing field membutuhkan state controller berupa `TextEditingController` untuk mengisi value dari field. Aksi yang diinginkan dapat dilakukan ketika tombol diklik.

## Screenshot

![Lampiran Form](/assets/images/input.png)
![Lampiran Hasil](/assets/images/output.png)
