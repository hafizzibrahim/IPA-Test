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
        title: Text('Available Job'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
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
      margin: EdgeInsets.all(16),
      color: neutral01Color,
      child: InkWell(
        onTap: () => _showJobDetails(context),
        child: Padding(
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
      shape: RoundedRectangleBorder(
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
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Available Job',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Commercial Legal Partner',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Rp. 10.000.000 - 15.000.000'),
          SizedBox(height: 16),
          Text('Job Details', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('PT Waruna Nusa Sentana • Kelapa Gading, Jakarta Utara'),
          Chip(label: Text('Full Time')),
          SizedBox(height: 16),
          Text('Jobdesk:', style: TextStyle(fontWeight: FontWeight.bold)),
          _buildBulletPoint('Mengawasi dan memberikan tanggapan, saran, dan perbaikan aspek hukum operasional perusahaan'),
          _buildBulletPoint('Monitoring, review, dan memberikan saran terhadap semua perjanjian/kontrak dengan klien (pencharter)'),
          _buildBulletPoint('Memastikan seluruh kontrak/perjanjian sesuai dengan peraturan hukum perundang-undangan yang berlaku'),
          SizedBox(height: 16),
          Text('Kualifikasi:', style: TextStyle(fontWeight: FontWeight.bold)),
          _buildBulletPoint('S1 / S2 Jurusan Hukum'),
          _buildBulletPoint('Minimal 5 tahun pengalaman sebagai Legal Manager'),
          _buildBulletPoint('Memiliki lisensi PERADI menjadi nilai tambah'),
          _buildBulletPoint('Familiar dengan regulasi maritim baik nasional maupun internasional'),
          _buildBulletPoint('Menguasai litigasi, drafting, dan review kontrak bisnis (komersial)'),
          _buildBulletPoint('Memiliki leadership yang kuat dan kemampuan interpersonal yang baik'),
          SizedBox(height: 16),
          ElevatedButton(
            child: Text('LAMAR'),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 4, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• '),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}



