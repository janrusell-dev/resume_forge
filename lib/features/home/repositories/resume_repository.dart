import 'package:resume_builder/features/home/model/resume.dart';
import 'package:resume_builder/features/home/services/resume_service.dart';

class ResumeRepository {
  final ResumeService _service;

  ResumeRepository(this._service);

  Future<List<Resume>> getAll() => _service.fetchResumes();
  Future<void> add(Resume resume) => _service.addResume(resume);
  Future<void> delete(int index) => _service.deleteResume(index);
}