import 'package:counter_with_integration_test/main.dart' as app;
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets(
      'tap on floating action button, verify counter',
      (tester) async {
        app.main();
        await tester.pumpAndSettle();
        await Future.delayed(const Duration(seconds: 1));
        expect(find.text('0'), findsOneWidget);
        await performIncrement(tester);
        expect(find.text('10'), findsOneWidget);
      },
    );
  });
}

Future<void> performIncrement(WidgetTester tester) async {
  final fab = find.byKey(const Key('increment'));
  for (var i = 0; i < 10; i++) {
    await tester.tap(fab);
    await tester.pumpAndSettle();
  }
}
