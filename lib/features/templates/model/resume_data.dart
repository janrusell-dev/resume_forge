class ResumeData {
  final String fullName;
  final String address;
  final String phone;
  final String email;
  final List<String>skills;
  final String summary;
  final String education;
  final String experience;
  final String? certifications;

  ResumeData({
    required this.fullName,
    required this.address,
    required this.phone,
    required this.email,
    required this.summary,
    required this.education,
    required this.experience,  
    this.certifications,
    required this.skills,
  });
}
