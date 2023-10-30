import 'dart:io';

// Kelas abstrak yang mewakili entitas lapangan
abstract class Lapangan {
  String jenisLapangan;
  int hargaSewa;

  Lapangan(this.jenisLapangan, this.hargaSewa);

  // Method abstrak untuk menampilkan informasi lapangan
  void tampilkanInfo();
}


// Kelas Lapangan Outdoor
class LapanganOutdoor extends Lapangan {
  LapanganOutdoor(String jenisLapangan, int hargaSewa)
      : super(jenisLapangan, hargaSewa);

  @override
  void tampilkanInfo() {
    print("Jenis Lapangan: $jenisLapangan");
    print("Harga Sewa per Jam: Rp $hargaSewa");
    print('');
  }
}

// Kelas Lapangan Tennis
class LapanganTennis extends Lapangan {
  LapanganTennis(String jenisLapangan, int hargaSewa)
      : super(jenisLapangan, hargaSewa);

  @override
  void tampilkanInfo() {
    print("Jenis Lapangan: $jenisLapangan");
    print("Harga Sewa per Jam: Rp $hargaSewa");
    print('='*40);
    print('');
  }
}

// untuk clear screen
// void clearConsole() {
//   if (Platform.isWindows) {
//     // Untuk Windows
//     Process.run('cls', []);
//   } else {
//     // Untuk sistem operasi lain
//     print('\x1B[2J\x1B[0;0H');
//   }
// }


// Kelas Sewa yang mengimplementasikan inheritance
class Sewa {
  Lapangan lapangan;
  int jamSewa;

  Sewa(this.lapangan, this.jamSewa);

  // Method untuk menghitung total biaya sewa
  int hitungBiayaSewa() {
    return lapangan.hargaSewa * jamSewa;
  }
}

// Kelas Operator
class Operator {
  List<Lapangan> daftarLapangan = [];

  // Method untuk menambahkan lapangan
  void tambahLapangan(Lapangan lapangan) {
    daftarLapangan.add(lapangan);
  }

  // Method untuk menampilkan daftar lapangan
  void tampilkanDaftarLapangan() {
    for (var i = 0; i < daftarLapangan.length; i++) {
      print("Lapangan ke-${i + 1}:");
      daftarLapangan[i].tampilkanInfo();
    }
  }
}

// Kelas Pelanggan yang menggunakan encapsulation
class Pelanggan {
  String nama;
  String noTelp;
  Sewa sewa;

  Pelanggan(this.nama, this.noTelp, this.sewa);

  // Method untuk menampilkan informasi pelanggan dan total biaya
  void tampilkanInfo() {
    print("Nama Pelanggan: $nama");
    print("No. Telepon: $noTelp");
    sewa.lapangan.tampilkanInfo();
    print("Jam Sewa: ${sewa.jamSewa} jam");
    print("Total Biaya Sewa: ${sewa.hitungBiayaSewa()}");
  }
}

void main() {
    print('='*40);
    print('   RESERVASI LAPANGAN');
    print('='*40);
  var operator = Operator();

  // Menambahkan lapangan
  operator.tambahLapangan(LapanganOutdoor("Lapangan Futsal", 100000));
  operator.tambahLapangan(LapanganTennis("Lapangan Tennis", 150000));

  // Menampilkan daftar lapangan
  operator.tampilkanDaftarLapangan();

  // Meminta input dari pengguna
  stdout.write("Masukkan nama Anda: ");
  var namaPelanggan = stdin.readLineSync()!;
  stdout.write("Masukkan no. telepon Anda: ");
  var noTelpPelanggan = stdin.readLineSync()!;
  stdout.write("Pilih nomor lapangan (1/2): ");
  var nomorLapangan = int.parse(stdin.readLineSync()!);
  stdout.write("Berapa jam Anda ingin menyewa lapangan: ");
  var jamSewa = int.parse(stdin.readLineSync()!);
  // clearConsole();


  // Membuat objek Pelanggan dan Sewa
  var lapanganTerpilih = operator.daftarLapangan[nomorLapangan - 1];
  var sewa = Sewa(lapanganTerpilih, jamSewa);
  var pelanggan = Pelanggan(namaPelanggan, noTelpPelanggan, sewa);

  // Menampilkan informasi pelanggan dan total biaya
  pelanggan.tampilkanInfo();
}



