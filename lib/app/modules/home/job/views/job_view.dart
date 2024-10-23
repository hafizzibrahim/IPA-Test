import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:maritimmuda_connect/themes.dart';
import '../controllers/job_controller.dart';

class JobView extends GetView<JobController> {
  const JobView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neutral02Color,
      appBar: AppBar(
        title: const Text('Available Job'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildJobCard(context),
          _buildJobCard(context),
          _buildJobCard(context),
        ],
      ),
    );
  }

  Widget _buildJobCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      color: neutral01Color,
      child: InkWell(
        onTap: () => _showJobDetails(context),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Commercial Legal Partner',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Rp. 10.000.000 - 15.000.000'),
              SizedBox(height: 8),
              Text('KG, Gading'),
              SizedBox(height: 8),
              Text('Full Time'),
              SizedBox(height: 8),
              Text('Until 15 Apr 2024'),
              SizedBox(height: 8),
              Text('PT Waruna Nusa Sentana'),
            ],
          ),
        ),
      ),
    );
  }

  void _showJobDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          expand: false,
          builder: (_, controller) {
            return SingleChildScrollView(
              controller: controller,
              child: _buildJobDetailsContent(context),
            );
          },
        );
      },
    );
  }

  Widget _buildJobDetailsContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Available Job',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Commercial Legal Partner',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('Rp. 10.000.000 - 15.000.000'),
          const SizedBox(height: 16),
          const Text('Job Details', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('PT Waruna Nusa Sentana • Kelapa Gading, Jakarta Utara'),
          const Chip(label: Text('Full Time')),
          const SizedBox(height: 16),
          const Text('Jobdesk:', style: TextStyle(fontWeight: FontWeight.bold)),
          _buildBulletPoint('Mengawasi dan memberikan tanggapan, saran, dan perbaikan aspek hukum operasional perusahaan'),
          _buildBulletPoint('Monitoring, review, dan memberikan saran terhadap semua perjanjian/kontrak dengan klien (pencharter)'),
          _buildBulletPoint('Memastikan seluruh kontrak/perjanjian sesuai dengan peraturan hukum perundang-undangan yang berlaku'),
          const SizedBox(height: 16),
          const Text('Kualifikasi:', style: TextStyle(fontWeight: FontWeight.bold)),
          _buildBulletPoint('S1 / S2 Jurusan Hukum'),
          _buildBulletPoint('Minimal 5 tahun pengalaman sebagai Legal Manager'),
          _buildBulletPoint('Memiliki lisensi PERADI menjadi nilai tambah'),
          _buildBulletPoint('Familiar dengan regulasi maritim baik nasional maupun internasional'),
          _buildBulletPoint('Menguasai litigasi, drafting, dan review kontrak bisnis (komersial)'),
          _buildBulletPoint('Memiliki leadership yang kuat dan kemampuan interpersonal yang baik'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text('LAMAR'),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 4, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• '),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}



