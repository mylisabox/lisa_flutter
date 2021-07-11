// ignore: prefer_generic_function_type_aliases
typedef S ItemCreator<S>();

class Lazy<T> {
  late T instance;
  final ItemCreator<T> creator;

  Lazy(this.creator);

  T get get {
    return instance ??= creator();
  }
}
