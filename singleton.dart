// implementation of singleton
class Me {
  static final Me _singleton = Me._internal();
  static final String _name = "Thet Myoe Khaing";

  factory Me() {
    return _singleton;
  }

  static String get name => _name;

  @override
  String toString() => "Hello, my name is $name.";

  Me._internal();
}

// not singleton
class AnotherMe {
  static final String name = "zzz";
  @override
  String toString() => "Hello my name is $name";
}

void main() {
  // same
  Me tyler = Me();
  Me anotherTyler = Me();

  var samenessCheck = identical(tyler, anotherTyler)
      ? "We are both the same ${Me.name}."
      : "We are NOT the same. I mean, just look at us.";
  print(samenessCheck);
  print(tyler.hashCode);
  print(anotherTyler.hashCode);

  print("---------------------------------------------------");

  // not same
  AnotherMe one = AnotherMe();
  AnotherMe two = AnotherMe();
  var samenessCheck2 = identical(one, two)
      ? "We are both the same ${AnotherMe.name}."
      : "We are NOT the same. I mean, just look at us.";
  print(samenessCheck2);
  print(one.hashCode);
  print(two.hashCode);
}
