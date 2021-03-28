import 'package:flutter_test/flutter_test.dart';

import 'package:todos/main.dart';

void main() {
  testWidgets('AppBar render a title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    expect(find.text('TodosApp'), findsOneWidget);
  });
}
