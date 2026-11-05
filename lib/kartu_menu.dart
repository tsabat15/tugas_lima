import 'package:material_ui/material_ui.dart';

/// Stateless: tampilannya hanya bergantung pada parameter dari luar.
class KartuMenu extends StatelessWidget {
  const KartuMenu({
    super.key,
    required this.nama,
    required this.harga,
    required this.kategori,
  });

  final String nama;
  final int harga;
  final String kategori;

  String get _hargaRupiah {
    final pola = RegExp(r'\B(?=(\d{3})+(?!\d))');
    return 'Rp${harga.toString().replaceAllMapped(pola, (m) => '.')}';
  }

  @override
  Widget build(BuildContext context) {
    final teks = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nama, style: teks.titleMedium),
                  const SizedBox(height: 2),
                  Text(_hargaRupiah, style: teks.bodyMedium),
                  const SizedBox(height: 4),
                  Chip(
                    label: Text(kategori),
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
            ),
            TombolFavorit(namaMenu: nama),
          ],
        ),
      ),
    );
  }
}

/// Stateful kecil: status favorit hanya dipakai widget ini, jadi cukup setState
/// dan hanya tombol ini yang dibangun ulang saat ditekan.
class TombolFavorit extends StatefulWidget {
  const TombolFavorit({super.key, required this.namaMenu});

  final String namaMenu;

  @override
  State<TombolFavorit> createState() => _TombolFavoritState();
}

class _TombolFavoritState extends State<TombolFavorit> {
  bool _favorit = false;

  void _ubah() {
    setState(() => _favorit = !_favorit);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            _favorit
                ? '${widget.namaMenu} ditandai favorit'
                : '${widget.namaMenu} dihapus dari favorit',
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: _favorit ? 'Hapus dari favorit' : 'Tandai favorit',
      onPressed: _ubah,
      icon: Icon(_favorit ? Icons.favorite : Icons.favorite_border),
      color: _favorit ? Theme.of(context).colorScheme.primary : null,
    );
  }
}
