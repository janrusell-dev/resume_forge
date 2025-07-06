import 'package:flutter/material.dart';
import 'package:resume_builder/features/templates/model/resume_data.dart';

class CelesteTemplate extends StatelessWidget {
  final ResumeData data;

  const CelesteTemplate(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data.fullName)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.summary),
            const SizedBox(height: 8),
            Text('Email: ${data.email}'),
            Text('Phone: ${data.phone}'),
          ],
        ),
      ),
    );
  }
}
