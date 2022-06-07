import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metro/views/widgets/share/texts/text_input.dart';

import '../../../model/texts/text_in_model.dart';
import '../../../services/colors.dart';
import '../../../services/settings.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({required this.searchText, required this.onChange, Key? key}) : super(key: key);
  final Function(TextInModel) onChange;
  final TextInModel searchText;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 53,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: searchBackground.withOpacity(0.19), borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 8),
            child: SvgPicture.asset(icon("search_normal")),
          ),
          Container(
            width: width - 96,
            child: TextIn(
              textInput: searchText,
              onChanged: onChange,
              enableColor: Colors.transparent,
              focusColor: Colors.transparent,
              placeHolderText: "ایستگاه مورد نظر را جستجو کنید",
            ),
          ),
        ],
      ),
    );
  }
}
