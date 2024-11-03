// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/core/common/presentation/blocs/global_info_bloc/global_info_bloc.dart';
import 'package:flutter_learning/features/profile/presentation/custom_title_and_content_in_item.dart';
import 'package:flutter_learning/gen/assets.gen.dart';
import 'package:flutter_learning/l10n/generated/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/services/logger_service.dart';

class FlagOption extends StatelessWidget {
  final String flagValue;
  final String? selectedFlag;
  final String svgPicturePath;
  final void Function()? onTap;
  const FlagOption({
    Key? key,
    required this.flagValue,
    required this.selectedFlag,
    required this.svgPicturePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = flagValue == selectedFlag;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? Colors.white : Colors.grey,
              width: isSelected ? 2 : 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: SvgPicture.asset(
          svgPicturePath,
          width: 32,
          height: 32,
        ),
      ),
    );
  }
}

class SettingsContent extends StatefulWidget {
  const SettingsContent({
    super.key,
  });

  @override
  State<SettingsContent> createState() => _SettingsContentState();
}

class _SettingsContentState extends State<SettingsContent> {
  // String selectedLanguage = "Vietnamese";
  final supportedLocales = AppLocalizations.supportedLocales;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTitleAndContentInItem(
            title:
            AppLocalizations.of(context)!.language,
            content: BlocBuilder<GlobalInfoBloc, GlobalInfoState>(
              builder: (context, state) {
                final selectedLocale = state.currentLocale;
                final selectedLangCode = selectedLocale?.languageCode;
                printS("Selected locale: $selectedLocale");
                return Row(
                    children: supportedLocales
                        .map((locale) => Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 4),
                      child: FlagOption(
                        flagValue: locale.languageCode,
                        selectedFlag: selectedLangCode,
                        svgPicturePath: locale.iconPath,
                        onTap: () {
                          printS(
                              "Selected lang code: ${locale.languageCode}");
                          BlocProvider.of<GlobalInfoBloc>(context).add(
                              SetSavedLangCode(
                                  langCode: locale.languageCode));
                        },
                      ),
                    ))
                        .toList()
                  // [
                  //   FlagOption(
                  //     flagValue: "Vietnamese",
                  //     selectedFlag: selectedLanguage,
                  //     svgPicturePath: "assets/svg/vietnam-flag.svg",
                  //     onTap: () {
                  //       setState(() {
                  //         selectedLanguage = "Vietnamese";
                  //       });
                  //     },
                  //   ),
                  //   const SizedBox(
                  //     width: 8,
                  //   ),
                  //   FlagOption(
                  //     flagValue: "English",
                  //     selectedFlag: selectedLanguage,
                  //     svgPicturePath: "assets/svg/us-flag.svg",
                  //     onTap: () {
                  //       setState(() {
                  //         selectedLanguage = "English";
                  //       });
                  //     },
                  //   ),
                  // ],
                );
              },
            ))
      ],
    );
  }
}

extension LocaleExtension on Locale {
  String get iconPath {
    switch (languageCode) {
      case "en":
        return Assets.svg.usFlag;
      case "es":
        return Assets.svg.es;
      case "vi":
        return Assets.svg.vietnamFlag;
      default:
        return "";
    }
  }
}

