enum CustomSettingButtonType { dropdown, icon, theme }

enum CustomRadioButtonType { normal, square }

sealed class CustomRadioValue {
  const CustomRadioValue();
}

enum Languages implements CustomRadioValue { myanmar, english }

enum Themes implements CustomRadioValue { systemDefault, lightTheme, darkTheme }
