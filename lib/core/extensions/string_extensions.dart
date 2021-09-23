extension NullableStringIsEmptyOrNullExtension on String? {
  /// Returns `true` if the String is either null or empty.
  bool get isEmptyOrNull => this?.isEmpty ?? true;
}

extension NullableStringIsEmptyOrNotNullExtension on String? {
  bool get isEmptyOrNotNull => !isEmptyOrNull;
}

extension StringExtension on String {
  ///Returns first letter of the string as Caps eg -> Flutter
  String firstLetterUpperCase() => length > 1
      ? "${this[0].toUpperCase()}${substring(1).toLowerCase()}"
      : this;

  /// Return a bool if the string is null or empty
  bool get isEmpty => trimLeft().isEmpty;

  /// Uses regex to check if the provided string is a valid email address or not
  bool validateEmail() => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);

  /// Check if String is Right to Left Language
  bool isRtlLanguage() {
    final _rtlLocaleRegex = RegExp(
        r'^(ar|dv|he|iw|fa|nqo|ps|sd|ug|ur|yi|.*[-_]'
        r'(Arab|Hebr|Thaa|Nkoo|Tfng))(?!.*[-_](Latn|Cyrl)($|-|_))'
        r'($|-|_)',
        caseSensitive: false);

    final bool _rtlCheck = _rtlLocaleRegex.hasMatch(this);

    return _rtlCheck;
  }

  /// Returns the string if it is not `null`, or the empty string otherwise
  String get orEmpty => this;

// if the string is empty perform an action
  String ifEmpty(Function action) => isEmpty ? action() : this;

  /// Returns a String without white space at all
  String removeAllWhiteSpace() => replaceAll(RegExp(r"\s+\b|\b\s"), "");

  /// Returns true if s is neither null, empty nor is solely made of whitespace characters.
  bool get isNotBlank => trim().isNotEmpty;

  ///Capitalize all words inside a string
  String allWordsCapitilize() {
    return toLowerCase().split(' ').map((word) {
      final String leftText =
          (word.length > 1) ? word.substring(1, word.length) : '';
      return word[0].toUpperCase() + leftText;
    }).join(' ');
  }

  String prepend(String other) => other + this;

  bool isNumber() {
    final isMatch = RegExp("[1-9]").hasMatch(this);
    return isMatch;
  }

  bool isLetter() {
    final isMatch = RegExp("[A-Za-z]").hasMatch(this);
    return isMatch;
  }

  bool isSymbol() {
    const String pattern =
        "[`~!@#\$%^&*()_\-+=<>?:\"{}|,.//\/;'\\[\]·~！@#￥%……&*（）——\-+={}|《》？：“”【】、；‘’，。、]";
    for (int i = 0; i < length; i++) {
      if (pattern.contains(this[i])) {
        return true;
      }
    }
    return false;
  }
}
