import 'package:resume_builder/features/home/model/resume.dart';
import 'package:resume_builder/features/home/repositories/resume_repository.dart';
import 'package:resume_builder/features/home/services/resume_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final resumeServiceProvider = Provider((ref) => ResumeService());
final resumeRepoProvider = Provider((ref) => ResumeRepository(ref.read(resumeServiceProvider)));

final resumeViewModelProvider = StateNotifierProvider<ResumeViewModel, List<Resume>>(
    (ref) => ResumeViewModel(ref.read(resumeRepoProvider)));

class ResumeViewModel extends StateNotifier<List<Resume>>{
    final ResumeRepository _repository;
    
    ResumeViewModel(this._repository) : super([]){
        loadResumes();
    }

    Future<void> loadResumes() async {
        final data = await _repository.getAll();
        state = data;
    }

    Future<void> addResume(Resume resume) async {
        await _repository.add(resume);
        await loadResumes();
    }

    Future<void> deleteResumes(int index) async {
        await _repository.delete(index);
        await loadResumes();
    }
}

