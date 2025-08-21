import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_builder/features/templates/model/resume_data.dart';

final resumeViewModelProvider = ChangeNotifierProvider((ref) => ResumeDetailsViewModel());

class ResumeDetailsViewModel extends ChangeNotifier {
   String fullName = '';
  String email = '';
  String address = '';
  String phone = '';
  String summary = '';
  String education = '';
  String experience = '';
  String skills = '';
  String certifications = '';

  // Personal Info
  void updatePersonalInfo({
    required String fullName,
    required String email,
    required String address,
    required String phone,
  }) {
    this.fullName = fullName;
    this.email = email;
    this.address = address;
    this.phone = phone;
    notifyListeners();
  }

  // Summary
  void updateSummary(String summary) {
    this.summary = summary;
    notifyListeners();
  }

  // Education
  void updateEducation(String education) {
    this.education = education;
    notifyListeners();
  }

  // Experience
  void updateExperience(String experience) {
    this.experience = experience;
    notifyListeners();
  }

  // Skills
  void updateSkills(String skills) {
    this.skills = skills;
    notifyListeners();
  }

  // Certifications (optional)
  void updateCertifications(String certifications) {
    this.certifications = certifications;
    notifyListeners();
  }

  // Convert to model if needed
  ResumeData toResumeData() {
    return ResumeData(
      fullName: fullName,
      email: email,
      address: address,
      phone: phone,
      summary: summary,
      education: education,
      experience: experience,
      certifications: certifications.isEmpty ? null : certifications,
      skills: skills
          .split(',')
          .map((s) => s.trim())
          .where((s) => s.isNotEmpty)
          .toList(),
    );
  }
}