import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

class Converter {
  static T getEnumFromString<T>(Iterable<T> enumValues, String enumString) {
    return enumValues.firstWhere(
        (type) => type.toString().split(".").last == enumString,
        orElse: () => null);
  }

  static String getStringFromEnum(String enumString) {
    return enumString.split('.')[1];
  }

  static List<String> convertListDynamicToListString(List<dynamic> inputs) {
    if (inputs == null) return null;
    List<String> result = List<String>();
    for (String string in inputs) {
      result.add(string);
    }

    return result;
  }

  static String convertStringToMaskedString(
      {@required String value,
      @required String mask,
      String escapeCharacter = "x",
      bool onlyDigits}) {
    if (value == null || mask == null) return "";
    value = cleanText(value, onlyDigits: onlyDigits);
    int i = 0;
    int j = 0;
    String result = "";
    for (; i < value.length && j < mask.length; i++, j++) {
      if (mask[j] == escapeCharacter) {
        result = result + value[i];
        while (j + 1 < mask.length && mask[j + 1] != escapeCharacter) {
          ++j;
          result = result + mask[j];
        }
      } else {
        result = result + mask[j];
      }
    }
    return result;
  }

  static String convertStringToMultimaskedString(
      {@required String value,
      @required String maskDefault,
      @required String maskSecundary,
      @required Function changeMask,
      bool onlyDigits,
      String escapeCharacter = "x"}) {
    String mask;
    if (changeMask == null)
      mask = maskDefault;
    else
      mask = (changeMask(value)) ? maskSecundary : maskDefault;

    return convertStringToMaskedString(
        value: value,
        mask: mask,
        escapeCharacter: escapeCharacter,
        onlyDigits: onlyDigits);
  }

  static String cleanText(String text, {bool onlyDigits}) {
    text = text.replaceAll(".", "").replaceAll("-", "").replaceAll(" ", "");
    if (onlyDigits != null && onlyDigits) {
      for (int i = 0; i < text.length; i++) {
        if (int.tryParse(text[i]) == null) {
          text = text.replaceAll(text[i], "");
        }
      }
    }

    return text;
  }

  static double convertMlToL(double value) {
    if (value > 999) return value * 0.001;
    return value;
  }
}
