enum LanguageType { ENGLISH, MYANMAR }

const String MYANMAR = "mm";
const String ENGLISH = "en";

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.MYANMAR:
        return MYANMAR;
    }
  }
}

enum ThemeType {LIGHT,DARK}

const String LIGHT = "light";
const String DARK = "dark";

extension ThemeTypeExtension on ThemeType{
  String getValue(){
    switch(this){
      case ThemeType.LIGHT:
        return LIGHT;
      case ThemeType.DARK:
        return DARK;
    }
  }
}
