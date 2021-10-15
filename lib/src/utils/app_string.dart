class StringUtils {
  static bool isNullOrEmpty(String value) {
    return value != "" || value.length > 0 ? true : false;
  }
}
