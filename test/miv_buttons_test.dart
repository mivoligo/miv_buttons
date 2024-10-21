import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miv_buttons/miv_buttons.dart';
import 'package:miv_buttons/src/defaults.dart';

void main() {
  testWidgets(
    'Button defaults',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: Button(
              onClick: () {},
              child: const Text('button'),
            ),
          ),
        ),
      );

      final buttonFinder = find.byType(Button);

      Button button = tester.widget(buttonFinder);

      expect(button.elevation, kElevation);
      expect(button.pressedElevation, kPressedElevation);
      expect(button.color, kColor);
      expect(button.horizontalPadding, null);
      expect(button.verticalPadding, null);
      expect(button.borderRadius, null);
      expect(button.semanticLabel, null);
      expect(button.excludeSemantics, null);
    },
  );

  testWidgets(
    'Button.icon defaults',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: Button.icon(onClick: () {}, icon: Icons.add),
          ),
        ),
      );

      final buttonFinder = find.byType(Button);
      Button button = tester.widget(buttonFinder);

      expect(button.color, kColor);

      final iconFinder = find.byIcon(Icons.add);
      Icon icon = tester.widget(iconFinder);

      expect(icon.icon, Icons.add);
      expect(icon.color, kForegroundColor);
      expect(icon.size, kIconSize);
    },
  );

  testWidgets(
    'Button.label defaults',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: Button.label(onClick: () {}, label: 'button'),
          ),
        ),
      );

      final buttonFinder = find.byType(Button);
      Button button = tester.widget(buttonFinder);

      expect(button.color, kColor);

      final labelFinder = find.text('button');
      Text label = tester.widget(labelFinder);

      expect(label.style?.color, kForegroundColor);
    },
  );

  testWidgets(
    'Button.iconLabel defaults',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: Button.iconLabel(
              onClick: () {},
              icon: Icons.add,
              label: 'button',
            ),
          ),
        ),
      );

      final buttonFinder = find.byType(Button);
      Button button = tester.widget(buttonFinder);

      expect(button.color, kColor);

      final childFinder = find.byType(Flex);
      Flex child = tester.widget(childFinder);

      expect(child.direction, Axis.horizontal);
      expect(child.children.length, 3);

      final firstChild = child.children.first;
      final secondChild = child.children[1];
      final thirdChild = child.children.last;

      expect(firstChild, isA<Icon>());
      expect(secondChild, isA<SizedBox>());
      expect(thirdChild, isA<Text>());

      expect((firstChild as Icon).color, kForegroundColor);
      expect(firstChild.size, kIconSize);
      expect(firstChild.icon, Icons.add);

      expect((secondChild as SizedBox).width, kLabelIconGap);

      expect((thirdChild as Text).style?.color, kForegroundColor);
      expect(thirdChild.data, 'button');
    },
  );

  testWidgets(
    'Button.labelIcon defaults',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: Button.labelIcon(
              onClick: () {},
              icon: Icons.add,
              label: 'button',
            ),
          ),
        ),
      );

      final buttonFinder = find.byType(Button);
      Button button = tester.widget(buttonFinder);

      expect(button.color, kColor);

      final childFinder = find.byType(Flex);
      Flex child = tester.widget(childFinder);

      expect(child.direction, Axis.horizontal);
      expect(child.children.length, 3);

      final firstChild = child.children.first;
      final secondChild = child.children[1];
      final thirdChild = child.children.last;

      expect(firstChild, isA<Text>());
      expect(secondChild, isA<SizedBox>());
      expect(thirdChild, isA<Icon>());

      expect((firstChild as Text).style?.color, kForegroundColor);
      expect(firstChild.data, 'button');

      expect((secondChild as SizedBox).width, kLabelIconGap);

      expect((thirdChild as Icon).color, kForegroundColor);
      expect(thirdChild.icon, Icons.add);
      expect(thirdChild.size, kIconSize);
    },
  );

  testWidgets(
    'Button callbacks',
    (WidgetTester tester) async {
      bool didTapButton = false;
      bool didLongPressButton = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: Button(
              onClick: () {
                didTapButton = true;
              },
              onLongPress: () {
                didLongPressButton = true;
              },
              child: const Text('button'),
            ),
          ),
        ),
      );

      final buttonFinder = find.byType(Button);

      expect(didTapButton, isFalse);
      await tester.tap(buttonFinder);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(didTapButton, isTrue);

      expect(didLongPressButton, isFalse);
      await tester.longPress(buttonFinder);
      expect(didLongPressButton, isTrue);
    },
  );

  testWidgets(
    'Button.icon sets correct properties',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: Button.icon(
              onClick: () {},
              icon: Icons.remove,
              color: Colors.white,
              iconSize: 24,
              elevation: 8,
              pressedElevation: 0,
              iconColor: Colors.black,
              verticalPadding: 20,
              horizontalPadding: 20,
              borderRadius: 10,
            ),
          ),
        ),
      );

      final buttonFinder = find.byType(Button);

      Button button = tester.widget(buttonFinder);

      expect(button.color, Colors.white);
      expect(button.borderRadius, 10);
      expect(button.horizontalPadding, 20);
      expect(button.verticalPadding, 20);
      expect(button.elevation, 8);
      expect(button.pressedElevation, 0);

      final icon = button.child as Icon;

      expect(icon.color, Colors.black);
      expect(icon.size, 24);
      expect(icon.icon, Icons.remove);
    },
  );

  testWidgets(
    'Button.label sets correct properties',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: Button.label(
              label: 'button',
              onClick: () {},
              color: Colors.white,
              elevation: 8,
              pressedElevation: 0,
              labelColor: Colors.black,
              verticalPadding: 20,
              horizontalPadding: 20,
              borderRadius: 10,
            ),
          ),
        ),
      );

      final buttonFinder = find.byType(Button);

      Button button = tester.widget(buttonFinder);

      expect(button.color, Colors.white);
      expect(button.borderRadius, 10);
      expect(button.horizontalPadding, 20);
      expect(button.verticalPadding, 20);
      expect(button.elevation, 8);
      expect(button.pressedElevation, 0);

      final label = button.child as Text;

      expect(label.style?.color, Colors.black);
      expect(label.data, 'button');
    },
  );

  testWidgets(
    'Button.iconLabel sets correct properties',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: Button.iconLabel(
              label: 'button',
              onClick: () {},
              icon: Icons.remove,
              color: Colors.white,
              foregroundColor: Colors.black,
              iconSize: 24,
              gap: 10,
              isHorizontal: false,
              elevation: 8,
              pressedElevation: 0,
              verticalPadding: 20,
              horizontalPadding: 20,
              borderRadius: 10,
            ),
          ),
        ),
      );

      final buttonFinder = find.byType(Button);

      Button button = tester.widget(buttonFinder);

      expect(button.color, Colors.white);
      expect(button.borderRadius, 10);
      expect(button.horizontalPadding, 20);
      expect(button.verticalPadding, 20);
      expect(button.elevation, 8);
      expect(button.pressedElevation, 0);

      final child = button.child as Flex;

      expect(child.direction, Axis.vertical);

      final icon = child.children.first as Icon;

      expect(icon.color, Colors.black);
      expect(icon.size, 24);
      expect(icon.icon, Icons.remove);

      final gap = child.children[1] as SizedBox;

      expect(gap.height, 10);

      final label = child.children.last as Text;

      expect(label.style?.color, Colors.black);
      expect(label.data, 'button');
    },
  );

  testWidgets(
    'Button.labelIcon sets correct properties',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: Button.labelIcon(
              label: 'button',
              onClick: () {},
              icon: Icons.remove,
              color: Colors.white,
              foregroundColor: Colors.black,
              iconSize: 24,
              gap: 10,
              isHorizontal: false,
              elevation: 8,
              pressedElevation: 0,
              verticalPadding: 20,
              horizontalPadding: 20,
              borderRadius: 10,
            ),
          ),
        ),
      );

      final buttonFinder = find.byType(Button);

      Button button = tester.widget(buttonFinder);

      expect(button.color, Colors.white);
      expect(button.borderRadius, 10);
      expect(button.horizontalPadding, 20);
      expect(button.verticalPadding, 20);
      expect(button.elevation, 8);
      expect(button.pressedElevation, 0);

      final child = button.child as Flex;

      expect(child.direction, Axis.vertical);

      final label = child.children.first as Text;

      expect(label.style?.color, Colors.black);
      expect(label.data, 'button');

      final gap = child.children[1] as SizedBox;

      expect(gap.height, 10);

      final icon = child.children.last as Icon;

      expect(icon.color, Colors.black);
      expect(icon.size, 24);
      expect(icon.icon, Icons.remove);
    },
  );
}
