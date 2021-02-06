
class Card{
  String _name;
  String _icon;
  String _theme;


  Card(this._name, this._icon, this._theme);

  Card fromMap(Map<String, String> map){
    this._name = map["name"];
    this._icon = map["icon"];
    this._theme = map["theme"];

    return this;
  }

  void setName(String newName){
    this._name = newName;
  }

  void setIcon(String newIcon){
    this._icon = newIcon;
  }

  void setTheme(String newTheme){
    this._theme = newTheme;
  }


  Map<String,String> getMap(){
    return {
      "name" : this._name,
      "icon" : this._icon,
      'theme' : this._theme
    };
  }

  String getName() => this._name;

  String getIcon() => this._icon;

  String getTheme() => this._theme;

}