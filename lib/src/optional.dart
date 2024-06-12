/// A wrapper for optional value.
///
/// When some function receives named nullable argument, like that
/// ```dart
/// void foo({ String? name }) {}
/// ```
/// you can't there define if the user passes `null` value explicitly or
/// implicitly:
/// ```dart
/// foo(name: null); // explicitly forward a null value
/// foo();           // we don't want `foo` to use the `name` argument.
/// ```
/// In both cases `foo` will receive `null`.
///
/// To solve this problem, use [Optional] to wrap arguments:
/// ```dart
/// void foo({ Optional<String>? name });
/// ```
/// To tell 'foo' that we don't pass the `name` argument, just don't specify it:
/// ```dart
/// foo();
/// ```
/// So `foo` will receive `null` and will realize the optional `name` doesn't
/// come.
/// To tell `foo` that we want `name` to be `null`, just pass an empty
/// [Optional]:
/// ```dart
/// foo(name: Optional());
/// ```
/// So `foo` will receive something other than `null` and will realize the
/// optional `name` has some value (`null` in this case).
class Optional<T>
{
  T? get value => _value;

  bool get isEmpty => value == null;

  bool get isNotEmpty => value != null;

  Optional([ this._value ]);

  @override
  bool operator ==(final Object other) => other is Optional<T>
    && _value == other.value;

  @override
  int get hashCode => Object.hash(Optional, T, _value);

  final T? _value;
}
