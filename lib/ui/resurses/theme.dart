import 'package:flutter/material.dart';
import 'package:test_messager/ui/resurses/colors.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    primary: AppColors.primary,
    seedColor: Colors.deepPurple,
    surface: AppColors.back,
  ),
  scaffoldBackgroundColor: AppColors.back,
  appBarTheme: const AppBarTheme(
    surfaceTintColor: AppColors.back,
    backgroundColor: AppColors.back,
    shadowColor: AppColors.greyRaw,
  ),
  useMaterial3: true,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.greyRaw,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.greyRaw ,
        width: 1,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.greyRaw ,
        width: 1,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.greyRaw ,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.greyRaw ,
        width: 1,
      ),
    ),
    disabledBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.greyRaw ,
        width: 1,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.greyRaw ,
        width: 1,
      ),
    ),
    contentPadding: const EdgeInsets.all(12),
  ),
);
