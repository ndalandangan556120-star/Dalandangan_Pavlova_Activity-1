import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_app/main.dart';

void main() {
  testWidgets('Pavlova recipe page renders', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(240, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Strawberry Pavlova'), findsOneWidget);
    final imageFinder = find.byType(Image);
    final image = tester.widget<Image>(imageFinder);
    expect(
      image.image,
      isA<AssetImage>().having(
        (asset) => asset.assetName,
        'asset name',
        'assets/pavlova_photo.jpg',
      ),
    );
    final imageSize = tester.getSize(imageFinder);
    expect(imageSize.width, 240);
    expect(imageSize.height, closeTo(240 * 320 / 302, 0.1));
    expect(find.text('90 Reviews'), findsOneWidget);
    expect(find.text('25 min'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
