import 'package:resume_builder/features/templates/model/templates.dart';
import 'package:resume_builder/features/templates/views/professional/celeste_template.dart';

class TemplateServices {

  List<ResumeTemplate> getByCategory (Category category){
    if (category == Category.all) return _templates;
    return _templates.where((t) => t.category == category).toList();
  }

  final List<ResumeTemplate> _templates = [
    ResumeTemplate(name: 'Celeste', 
    previewImagePath: 'assets/images/online_cv.png', 
    category: Category.professional, 
    builder: (data) => CelesteTemplate(data)),
    ResumeTemplate(name: 'Aurora',
     previewImagePath: 'assets/images/download.png', 
    category: Category.professional,
     builder: (data) => CelesteTemplate(data)),
     ResumeTemplate(name: 'Bianca',
    previewImagePath: 'assets/images/download.png',
    category: Category.minimalist, 
    builder: (data) => CelesteTemplate(data)),
    ResumeTemplate(name: 'Estella',
    previewImagePath: 'assets/images/resume.png',
    category: Category.simple, 
    builder: (data) => CelesteTemplate(data))
  ];

}