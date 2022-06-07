import 'package:flutter/material.dart';
import 'package:metro/views/widgets/share/texts/styled_text.dart';

import '../../../../model/texts/text_in_model.dart';
import '../../../../services/colors.dart';
import '../../../../services/text/texts.dart';

class TextIn extends StatelessWidget {
  const TextIn({
    required this.textInput,
    this.rightIcon,
    this.leftIcon,
    this.enableColor = border,
    this.errorColor = border,
    this.focusColor = mainColor,
    this.placeColor = black,
    this.placeHolderText,
    this.textColor = black,
    this.enable = true,
    this.isPrice = false,
    this.borderRadius,
    this.inputType = TextInputType.text,
    this.textAction = TextInputAction.done,
    this.headerText,
    this.onTap,
    this.onChanged,
    this.minLines = 1,
    this.submit,
    this.maxLines = 1,
    this.maxLength,
    this.color = Colors.transparent,
    this.disableColor = border,
    this.bottomPadding,
    this.nextTextIn,
    this.obscureText = false,
    this.align = TextAlign.start,
    Key? key,
  }) : super(key: key);
  final TextInModel textInput;
  final Color color;
  final Color enableColor;
  final Color disableColor;
  final Color focusColor;
  final Color errorColor;
  final String? placeHolderText;
  final Color placeColor;
  final Color textColor;
  final Widget? rightIcon;
  final Widget? leftIcon;
  final bool enable;
  final bool isPrice;
  final TextInputType inputType;
  final TextInputAction textAction;
  final String? headerText;
  final Function? onTap;
  final void Function(TextInModel)? onChanged;
  final Function(TextInModel)? submit;
  final int maxLines;
  final int minLines;
  final int? maxLength;
  final BorderRadius? borderRadius;
  final double? bottomPadding;
  final TextInModel? nextTextIn;
  final TextAlign align;
  final bool obscureText;

  Widget errorContainer() {
    return SizedBox(
      height: bottomPadding ?? 5,
      child: textInput.error != ""
          ? Padding(
              padding: const EdgeInsetsDirectional.only(top: 6),
              child: StyledTextShow(textInput.error, color: border, size: font14),
            )
          : Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        headerText != null
            ? Container(
                alignment: Alignment.topRight,
                width: width,
                margin: const EdgeInsetsDirectional.only(bottom: 12),
                child: StyledTextShow(
                  headerText ?? "",
                  color: black,
                  size: font12,
                  fontWeight: "black",
                ))
            : Container(),
        Container(
          width: width,
          height: minLines > 1 ? null : 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: borderRadius, color: enable ? color : disableColor),
          child: TextField(
            onChanged: (text) {
              if (onChanged != null) {
                onChanged!(textInput);
              }
            },
            textAlign: align,
            controller: textInput.textController,
            focusNode: textInput.focus,
            style: textStyle(
              font16,
              enable ? textColor : border,
              height: 1.4,
            ),
            enabled: enable,
            cursorColor: focusColor,
            keyboardType: inputType,
            textInputAction: textAction,
            obscureText: obscureText,
            onSubmitted: (text) {
              if (nextTextIn != null) {
                FocusScope.of(context).requestFocus(nextTextIn?.focus);
              }
              if (submit != null) {
                submit!(textInput);
              }
            },
            minLines: minLines,
            maxLines: maxLines,
            decoration: InputDecoration(
                counterText: '',
                contentPadding: EdgeInsetsDirectional.only(start: 10, end: 10, ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2, color: focusColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2, color: textInput.error != "" ? errorColor : enableColor)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2, color: textInput.error != "" ? errorColor : enableColor)),
                hintText: placeHolderText,
                hintStyle: textStyle(font14, placeColor, fontWeight: FontWeight.w700, height: 1.0),
                prefixIcon: rightIcon != null
                    ? Container(
                        padding: EdgeInsetsDirectional.only(start: 12, end: 8),
                        child: rightIcon,
                      )
                    : null,
                suffixIcon: leftIcon),
            maxLength: maxLength,
          ),
        ),
        errorContainer()
      ],
    );
  }
}
