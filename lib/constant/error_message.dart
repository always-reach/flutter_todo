class ErrorMessages {
  static const String required = 'この項目は必須です';
  static const String number = '数値を入力してください';

  static String maxLength(int length) {
    return '最大文字数は$length文字です';
  }

  static String max(int maxValue) {
    return '最大値は$maxValueです';
  }

  static String min(int minValue) {
    return '最小値は$minValueです';
  }
}
