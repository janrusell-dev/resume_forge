import 'package:resume_builder/features/home/model/resume.dart';

class ResumeService {
  final List<Resume> _fakeDb = [
    Resume(name: "asdasdas", age: 22),
    Resume(name: "My Resume", age: 12),
    Resume(name: "My Resume asdasd", age: 23),
     Resume(name: "My Resume asdsad 2", age: 23),
      Resume(name: "My Resume Parsfdsdfdst 2", age: 23)
  ];

  Future<List<Resume>> fetchResumes() async {
    await Future.delayed(Duration(milliseconds: 500));
    return _fakeDb;
  }

  Future<void> addResume(Resume resume) async {
    await Future.delayed(Duration(milliseconds: 300));
    _fakeDb.add(resume);
  }

  Future<void> deleteResume(int index) async {
    await Future.delayed(Duration(milliseconds: 300));
    _fakeDb.removeAt(index);
  }
}