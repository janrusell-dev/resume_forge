import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_builder/features/templates/model/templates.dart';
import 'package:resume_builder/features/templates/services/template_services.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final templateServiceProvider = Provider((ref) => TemplateServices());

final selectedCategoryProvider = StateProvider<Category>((ref) => Category.all);

final templatesViewModelProvider = StateNotifierProvider<TemplatesViewModel, AsyncValue<List<ResumeTemplate>>>((ref) => TemplatesViewModel(TemplateServices())
);

class TemplatesViewModel extends StateNotifier<AsyncValue<List<ResumeTemplate>>> {
  final TemplateServices _service;
  Category ? _currentCategory;
  TemplatesViewModel(this._service) : super(const AsyncValue.loading()){
    loadTemplates(Category.all);
  }
  
  void loadTemplates(Category category) async {
  
    if (_currentCategory == category) return;
    _currentCategory = category;
    state = const AsyncValue.loading();

    await Future.delayed(Duration(milliseconds: 300));

    try{
      final templates = _service.getByCategory(category);
      state = AsyncValue.data(templates);
    }
    catch (e, st){
      state = AsyncValue.error(e, st);
    }

  }
}
