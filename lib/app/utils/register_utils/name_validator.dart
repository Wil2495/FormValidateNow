bool isValidName(String text) {
  // ignore: valid_regexps
  return RegExp(r"^[a-zA-ZñÑ]+$").hasMatch(text);
}
