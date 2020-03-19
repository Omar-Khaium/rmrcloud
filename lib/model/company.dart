class Company {
  String _text;
  String _value;
  bool _selected;
  Null _color;
  Null _image;

  Company({String text, String value, bool selected, Null color, Null image}) {
    this._text = text;
    this._value = value;
    this._selected = selected;
    this._color = color;
    this._image = image;
  }

  String get text => _text;
  set text(String text) => _text = text;
  String get value => _value;
  set value(String value) => _value = value;
  bool get selected => _selected;
  set selected(bool selected) => _selected = selected;
  Null get color => _color;
  set color(Null color) => _color = color;
  Null get image => _image;
  set image(Null image) => _image = image;

  Company.fromJson(Map<String, dynamic> json) {
    _text = json['text'];
    _value = json['value'];
    _selected = json['selected'];
    _color = json['color'];
    _image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this._text;
    data['value'] = this._value;
    data['selected'] = this._selected;
    data['color'] = this._color;
    data['image'] = this._image;
    return data;
  }
}