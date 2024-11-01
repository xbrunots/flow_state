extension SingletonExtension<T> on T {
  static final Map<Type, dynamic> _instances = {};

  T get singleton {
    if (_instances[T] == null) {
      _instances[T] = this;
    }
    return _instances[T];
  }
}

extension SingletonExtensionWithParams<T> on T {
  static final Map<Type, dynamic> _instances = {};
  static T getInstance<T>(T Function() create) {
    return _instances[T] ??= create();
  }
}
