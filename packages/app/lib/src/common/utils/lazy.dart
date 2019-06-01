// ignore: prefer_generic_function_type_aliases
typedef S ItemCreator<S>();

class Lazy<T> {
  T instance;
  final ItemCreator<T> creator;

  Lazy(this.creator);

  T get get {
    return instance ??= creator();
  }
}
