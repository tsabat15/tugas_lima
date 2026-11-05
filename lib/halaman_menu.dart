import 'package:material_ui/material_ui.dart';

import 'kartu_menu.dart';

/// Data satu menu. Kedai ini fiktif; harga hanya contoh.
class Menu {
  const Menu(this.nama, this.harga, this.kategori);

  final String nama;
  final int harga;
  final String kategori;
}

const List<Menu> daftarMenu = [
  Menu('Soto Medan Daging', 28000, 'Makanan'),
  Menu('Lontong Medan', 18000, 'Makanan'),
  Menu('Mie Sop Medan', 20000, 'Makanan'),
  Menu('Es Timun Serut', 12000, 'Minuman'),
  Menu('Kopi Sidikalang', 15000, 'Minuman'),
];

/// Stateless: isi halaman tidak berubah. Perubahan hanya terjadi di dalam
/// TombolFavorit, sehingga halaman ini tidak perlu dibangun ulang.
class HalamanMenu extends StatelessWidget {
  const HalamanMenu({super.key});

  void _beriTahu(BuildContext context, String pesan) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(pesan)));
  }

  @override
  Widget build(BuildContext context) {
    final teks = Theme.of(context).textTheme;
    final skema = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Kedai Soto Kesawan')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/kedai.png',
              height: 160,
              fit: BoxFit.cover,
              semanticLabel: 'Gambar semangkuk soto',
            ),
          ),
          const SizedBox(height: 16),
          Text('Kedai Soto Kesawan', style: teks.headlineSmall),
          const SizedBox(height: 4),
          Text(
            'Soto Medan berkuah santan dan aneka hidangan khas Medan, '
            'dimasak setiap pagi.',
            style: teks.bodyMedium?.copyWith(color: skema.onSurfaceVariant),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              FilledButton.icon(
                onPressed: () =>
                    _beriTahu(context, 'Membuka pesanan (simulasi)'),
                icon: const Icon(Icons.shopping_bag_outlined),
                label: const Text('Pesan'),
              ),
              OutlinedButton.icon(
                onPressed: () =>
                    _beriTahu(context, 'Membuka peta lokasi (simulasi)'),
                icon: const Icon(Icons.map_outlined),
                label: const Text('Lokasi'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.place_outlined),
                  title: Text('Jl. Contoh No. 10, Kesawan, Medan'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.schedule),
                  title: Text('Buka setiap hari'),
                  subtitle: Text('07.00–21.00 WIB'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.phone_outlined),
                  title: Text('0812-0000-0000 (contoh)'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text('Daftar Menu', style: teks.titleLarge),
          const SizedBox(height: 8),
          for (final m in daftarMenu)
            KartuMenu(nama: m.nama, harga: m.harga, kategori: m.kategori),
        ],
      ),
    );
  }
}
