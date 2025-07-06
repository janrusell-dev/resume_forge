import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_builder/features/templates/model/templates.dart';
import 'package:resume_builder/features/templates/services/template_services.dart';


final templateServiceProvider = Provider((ref) => TemplateServices());
final selectedCategoryProvider = StateProvider<Category>((ref) => Category.all);
final templatesViewModelProvider = StateNotifierProvider<TemplatesViewModel, List<ResumeTemplate>>((ref){
  final service = ref.watch(templateServiceProvider);
  return TemplatesViewModel(service);
});

class TemplatesViewModel extends StateNotifier<List<ResumeTemplate>> {
  final TemplateServices _service;

  TemplatesViewModel(this._service) : super([]){
    loadTemplates(Category.all);
  }
  
  void loadTemplates(Category category){
    final templates = _service.getByCategory(category);
    state = templates;
  }
}
