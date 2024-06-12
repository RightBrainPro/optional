import 'package:optional/optional.dart';
import 'package:test/test.dart';


void main()
{
  group('Equality', () {
    test('Of values', () {
      final o1 = Optional('str1');
      final o2 = Optional('str1');
      final o3 = Optional('str');
      final o4 = Optional(1);
      expect(o1 == o2, isTrue);
      expect(o1.hashCode == o2.hashCode, isTrue);

      expect(o1 == o3, isFalse);
      expect(o1.hashCode == o3.hashCode, isFalse);

      expect(o1, isNot(equals(o4)));
      expect(o1.hashCode == o4.hashCode, isFalse);
    });

    test('Of null', () {
      final Optional<int> o1 = Optional();
      final Optional<int> o2 = Optional();
      final Optional<String> o3 = Optional();

      expect(o1, equals(o2));
      expect(o1.hashCode == o2.hashCode, isTrue);

      expect(o1, isNot(equals(o3)));
      expect(o1.hashCode == o3.hashCode, isFalse);
    });
  });
}
