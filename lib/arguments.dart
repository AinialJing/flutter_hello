class Arguments {
  String _name = "";
  int _age = 0;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get age => _age;

  set age(int value) {
    _age = value;
  }

  @override
  String toString() {
    return 'Arguments{_name: $_name, _age: $_age}';
  }
}
