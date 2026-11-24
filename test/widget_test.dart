import 'package:flutter_test/flutter_test.dart';
import 'package:our_project/main.dart';

void main() {
  testWidgets('FreshCut login screen test',
          (WidgetTester tester) async {

        await tester.pumpWidget(const FreshCutApp());

        expect(find.text('Welcome Back'), findsOneWidget);
        expect(find.text('Log In'), findsOneWidget);

      });
}