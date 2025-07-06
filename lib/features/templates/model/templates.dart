import 'package:flutter/widgets.dart';
import 'package:resume_builder/features/templates/model/resume_data.dart';

class ResumeTemplate {
  final String name;
   final String previewImagePath;
  final Category category;
  final Widget Function(ResumeData) builder;

  ResumeTemplate({
    required this.name,
    required this.previewImagePath,
    required this.category,
    required this.builder
  });
}


enum Category{
  all,
  professional,
  minimalist,
  simple
}

extension CategoryExtension on Category {
  String get label {
    switch (this) {
      case Category.professional:
        return "Professional";
      case Category.minimalist:
        return "Minimalist";
      case Category.simple:
        return "Simple";
      case Category.all:
        return ""; 
    }
  }
}