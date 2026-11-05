import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:pm_tugas_05/kartu_menu.dart';

void main() {
  testWidgets('Ikon favorit berubah setelah ditekan', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: KartuMenu(
            nama: 'Soto Medan',
            harga: 28000,
            kategori: 'Makanan',
          ),
        ),
      ),
    );

    expect(find.text('Rp28.000'), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsNothing);

    await tester.tap(find.byType(IconButton));
    await tester.pump();

    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.text('Soto Medan ditandai favorit'), findsOneWidget);
  });
}
