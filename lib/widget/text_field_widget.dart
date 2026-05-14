import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/core/theme/app_colors.dart';
import '/core/theme/app_decoration.dart';
import '/core/theme/app_text_styles.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.ctrl,
    required this.hintText,
    this.validator,
    this.validateMode,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.readOnly = false,
    this.enabled = true,
    this.isPassWord = false,
    this.showIcClear = true,
    this.contentPadding,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLength,
    this.textCapitalization = TextCapitalization.none,
    this.onTap,
    this.textInputAction,
  });

  final TextEditingController ctrl;
  final String hintText;
  final String? Function(String?)? validator;
  final AutovalidateMode? validateMode;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly, enabled, isPassWord, showIcClear;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon, prefixIcon;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final VoidCallback? onTap;
  final TextInputAction? textInputAction;

  /// [textCapitalization] TextCapitalization.characters
  // OUTPUT : FLUTTER CODE CAMP

  /// [textCapitalization] TextCapitalization.words
  // OUTPUT : Flutter Code Camp

  /// [textCapitalization] TextCapitalization.sentences
  // OUTPUT : Flutter code camp

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool obscureText = false;
  bool showIconClear = false;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassWord;
    showIconClear = widget.ctrl.text.isNotEmpty;
  }

  void clearText() {
    widget.ctrl.clear();
    showIconClear = false;
    setState(() {});
  }

  Widget? getSuffixIcon() {
    if (widget.isPassWord) {
      return InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          obscureText = !obscureText;
          setState(() {});
        },
        child: Icon(
          (obscureText)
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: Colors.black.withValues(alpha: 0.25),
        ),
      );
    }

    // Icon clear.
    if (widget.suffixIcon == null && showIconClear && widget.showIcClear) {
      return InkWell(
        onTap: clearText,
        splashColor: Colors.transparent,
        child: Icon(Icons.close, color: AppColors.grey3),
      );
    }

    return widget.suffixIcon;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.ctrl,
      validator: widget.validator,
      autovalidateMode: widget.validateMode,
      onChanged: (String val) {
        if (widget.onChanged != null) widget.onChanged!(val);
        showIconClear = val.isNotEmpty;
        setState(() {});
      },
      style: AppTextStyles.normalText(),
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      maxLength: widget.maxLength,
      textCapitalization: widget.textCapitalization,
      obscureText: obscureText,
      onTap: widget.onTap,
      autocorrect: false,
      enableSuggestions: false,
      textInputAction: widget.textInputAction,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        isDense: true,
        contentPadding: widget.contentPadding ?? EdgeInsets.all(13),
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: getSuffixIcon(),
        hintStyle: AppTextStyles.normalText(color: Colors.grey),
        errorStyle: AppTextStyles.smallText(
          color: AppColors.red2,
        ).copyWith(height: 1),
        errorMaxLines: 2,
        counter: SizedBox.shrink(),
        border: AppDecoration.inputBorder(),
        enabledBorder: AppDecoration.inputBorder(),
        focusedBorder: AppDecoration.inputBorder(color: Colors.blue),
        errorBorder: AppDecoration.inputBorder(color: Colors.redAccent),
        focusedErrorBorder: AppDecoration.inputBorder(color: Colors.redAccent),
      ),
    );
  }
}
