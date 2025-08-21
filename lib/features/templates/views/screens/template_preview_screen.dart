import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:resume_builder/features/templates/model/resume_data.dart';
import 'package:resume_builder/widgets/button_widget.dart';

class TemplatePreviewScreen extends ConsumerWidget {
  final ResumeData resume;
  const TemplatePreviewScreen({super.key, required this.resume});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

     Future<void> _exportToPdf() async {
      final pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Padding(
              padding: const pw.EdgeInsets.all(20),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(resume.fullName, style: pw.TextStyle(fontSize: 30.sp, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 8.h),
                  pw.Text(resume.address),
                  pw.Text(resume.email),
                  pw.Text(resume.phone),
                  pw.SizedBox(height: 16.h),

                  pw.Text("Summary", style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 24.sp)),
                  pw.Text(resume.summary),
                  pw.SizedBox(height: 12.h),
                  pw.Text("Skills", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text(resume.skills.join(", ")),
                  pw.SizedBox(height: 12.h),
                  pw.Text("Experience", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text(resume.experience),
                  pw.SizedBox(height: 12.h),
                  pw.Text("Education", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text(resume.education),
                  pw.SizedBox(height: 12.h),
                  if (resume.certifications != null) ...[
                    pw.Text("Certifications", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text(resume.certifications!),
                  ],
                ],
              ),
            );
          },
        ),
      );

      // Preview and allow printing/saving
      await Printing.layoutPdf(onLayout: (format) async => pdf.save());
    }

    return Scaffold(
      appBar: AppBar(title: Text("Resume Preview"),
      leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // in case it's long
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(resume.fullName, style: Theme.of(context).textTheme.headlineSmall),
              Text(resume.email),
              Text(resume.phone),
              Text(resume.address),
              SizedBox(height: 20),

              Text("Summary", style: TextStyle(fontWeight: FontWeight.bold)),
              Text(resume.summary),
              SizedBox(height: 20),

              Text("Education", style: TextStyle(fontWeight: FontWeight.bold)),
              Text(resume.education),
              SizedBox(height: 20),

              Text("Experience", style: TextStyle(fontWeight: FontWeight.bold)),
              Text(resume.experience),
              SizedBox(height: 20),

              Text("Skills", style: TextStyle(fontWeight: FontWeight.bold)),
              Text(resume.skills.join(", ")),
              SizedBox(height: 20.h),

              Text("Certifications", style: TextStyle(fontWeight: FontWeight.bold)),
              // Text((resume.certifications ?? []).join(", ")),
              SizedBox(height: 10.h,),
             ElevatedButton.icon(
              onPressed: _exportToPdf,
              icon: Icon(Icons.download),
              label: Text("Export"),
)
            ],
          ),
        ),
      ),
    );
  }
}
