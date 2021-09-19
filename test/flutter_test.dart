import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:siberia/siberia.dart';

import 'test_app.dart';

class TestScrollPosition extends ScrollPositionWithSingleContext {
  TestScrollPosition({
    required ScrollPhysics physics,
    required ScrollContext state,
    double initialPixels = 0.0,
    ScrollPosition? oldPosition,
  }) : super(
          physics: physics,
          context: state,
          initialPixels: initialPixels,
          oldPosition: oldPosition,
        );
}

class TestScrollController extends ScrollController {
  @override
  ScrollPosition createScrollPosition(
    ScrollPhysics physics,
    ScrollContext context,
    ScrollPosition? oldPosition,
  ) {
    return TestScrollPosition(
      physics: physics,
      state: context,
      initialPixels: initialScrollOffset,
      oldPosition: oldPosition,
    );
  }
}

void main() {
  final TestScrollController controller = TestScrollController();

  group('Material theme test cases', () {
    test('test .bold', () async {
      const textStyle = TextStyle();

      expect(textStyle, const TextStyle());
      expect(textStyle.bold, const TextStyle().bold);
      expect(textStyle.bold, const TextStyle(fontWeight: FontWeight.w700));
    });
  });

  group('Scroll controller test cases', () {
    testWidgets('Should test .hasReachTheEndOfScroll', (tester) async {
      await tester.pumpWidget(SingleChildScrollView(
        controller: controller,
        child: Container(height: 1000.0),
      ));

      final gesture = await tester
          .startGesture(const Offset(0, 300)); //Position of the scrollView

      await gesture.moveBy(const Offset(0, -500)); //How much to scroll by
      await tester.pump();

      expect(controller.hasReachTheEndOfScroll, true);
    });
  });

  group('Wiget test cases', () {
    late Widget mockedSizedBox;

    setUp(() {
      mockedSizedBox = const SizedBox(width: 200, height: 200);
    });

    group('Group test for Padding', () {
      testWidgets('Test of paddingAll', (WidgetTester tester) async {
        expect(find.byType(Padding), findsNothing);

        await tester.pumpWidget(mockedSizedBox.paddingAll(16));

        expect(find.byType(Padding), findsOneWidget);
      });

      testWidgets('Test of paddingOnly', (WidgetTester tester) async {
        expect(find.byType(Padding), findsNothing);

        await tester.pumpWidget(mockedSizedBox.paddingOnly(top: 16));

        expect(find.byType(Padding), findsOneWidget);
      });

      testWidgets('Test of paddingSymmetric', (WidgetTester tester) async {
        expect(find.byType(Padding), findsNothing);

        await tester.pumpWidget(mockedSizedBox.paddingSymmetric(vertical: 16));

        expect(find.byType(Padding), findsOneWidget);
      });

      testWidgets('Test of paddingZero', (WidgetTester tester) async {
        expect(find.byType(Padding), findsNothing);

        await tester.pumpWidget(mockedSizedBox.paddingZero);

        expect(find.byType(Padding), findsOneWidget);
      });
    });

    group('Group test for Margin', () {
      testWidgets('Test of marginAll', (WidgetTester tester) async {
        await tester.pumpWidget(mockedSizedBox.marginAll(16));

        expect(find.byType(SizedBox), findsOneWidget);
      });

      testWidgets('Test of marginOnly', (WidgetTester tester) async {
        await tester.pumpWidget(mockedSizedBox.marginOnly(top: 16));

        expect(find.byType(SizedBox), findsOneWidget);
      });

      testWidgets('Test of marginSymmetric', (WidgetTester tester) async {
        await tester.pumpWidget(mockedSizedBox.marginSymmetric(vertical: 16));

        expect(find.byType(SizedBox), findsOneWidget);
      });

      testWidgets('Test of marginZero', (WidgetTester tester) async {
        await tester.pumpWidget(mockedSizedBox.marginZero);

        expect(find.byType(SizedBox), findsOneWidget);
      });
    });

    group('Tests for Visibility', () {
      testWidgets('Test with visible = true', (WidgetTester tester) async {
        await tester.pumpWidget(mockedSizedBox.visibility(true));

        expect(find.byType(SizedBox), findsOneWidget);
      });

      testWidgets('Test with visible = false', (WidgetTester tester) async {
        await tester.pumpWidget(mockedSizedBox.visibility(false));

        expect(find.byType(SizedBox), findsOneWidget);
      });
    });

    group('Tests for Flexible', () {
      testWidgets('Test with only default values', (WidgetTester tester) async {
        await tester.pumpWidget(
            TestApp(Row(children: <Widget>[mockedSizedBox.flexible()])));

        expect(find.byType(SizedBox), findsOneWidget);
        expect(find.byType(Flexible), findsOneWidget);
      });

      testWidgets('Test with only flex value', (WidgetTester tester) async {
        await tester.pumpWidget(
            TestApp(Row(children: <Widget>[mockedSizedBox.flexible(flex: 1)])));

        expect(find.byType(SizedBox), findsOneWidget);
        expect(find.byType(Flexible), findsOneWidget);
      });

      testWidgets('Test with only fit value', (WidgetTester tester) async {
        await tester.pumpWidget(TestApp(Row(
            children: <Widget>[mockedSizedBox.flexible(fit: FlexFit.tight)])));

        expect(find.byType(SizedBox), findsOneWidget);
        expect(find.byType(Flexible), findsOneWidget);
      });

      testWidgets('Test with all values', (WidgetTester tester) async {
        await tester.pumpWidget(TestApp(Row(children: <Widget>[
          mockedSizedBox.flexible(flex: 1, fit: FlexFit.tight)
        ])));

        expect(find.byType(SizedBox), findsOneWidget);
        expect(find.byType(Flexible), findsOneWidget);
      });
    });

    group('Tests for Expanded', () {
      testWidgets('Test with all values', (WidgetTester tester) async {
        await tester.pumpWidget(
            TestApp(Row(children: <Widget>[mockedSizedBox.expanded(flex: 1)])));

        expect(find.byType(SizedBox), findsOneWidget);
        expect(find.byType(Expanded), findsOneWidget);
      });

      testWidgets('Test with default values', (WidgetTester tester) async {
        await tester.pumpWidget(
            TestApp(Row(children: <Widget>[mockedSizedBox.expanded()])));

        expect(find.byType(SizedBox), findsOneWidget);
        expect(find.byType(Expanded), findsOneWidget);
      });
    });

    group('Group of tests for align()', () {
      testWidgets('Test for align() with default param',
          (WidgetTester tester) async {
        await tester.pumpWidget(
            TestApp(Row(children: <Widget>[mockedSizedBox.withAlign()])));

        expect(find.byType(SizedBox), findsOneWidget);
        expect(find.byType(Align), findsOneWidget);
      });
      testWidgets('Test for align() with Alignment param',
          (WidgetTester tester) async {
        await tester.pumpWidget(TestApp(Row(children: <Widget>[
          mockedSizedBox.withAlign(alignment: Alignment.bottomLeft)
        ])));

        expect(find.byType(SizedBox), findsOneWidget);
        expect(find.byType(Align), findsOneWidget);
      });
    });
  });
}
