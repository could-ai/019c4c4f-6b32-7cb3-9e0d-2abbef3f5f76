import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Basic responsive check
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Row(
          children: [
            Icon(Icons.verified_user, color: Theme.of(context).primaryColor),
            const SizedBox(width: 10),
            const Text(
              'MarriageReg',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: isDesktop
            ? [
                TextButton(onPressed: () {}, child: const Text('Home')),
                TextButton(onPressed: () {}, child: const Text('Services')),
                TextButton(onPressed: () {}, child: const Text('Process')),
                TextButton(onPressed: () {}, child: const Text('Contact')),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/apply');
                  },
                  child: const Text('Apply Now'),
                ),
                const SizedBox(width: 20),
              ]
            : [
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    // Mobile menu implementation would go here
                  },
                ),
              ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            _buildHeroSection(context, isDesktop),
            
            // Services Section
            _buildServicesSection(context, isDesktop),
            
            // Process Section
            _buildProcessSection(context, isDesktop),
            
            // Documents Section
            _buildDocumentsSection(context, isDesktop),
            
            // Footer
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isDesktop) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isDesktop ? 100 : 60,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.05),
        image: const DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1515934751635-c81c6bc9a2d8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80'), // Placeholder wedding background
          fit: BoxFit.cover,
          opacity: 0.1,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Official Marriage Registration Services',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isDesktop ? 48 : 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A237E),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Fast, Secure, and Legally Recognized Marriage Certification.\nApply online from the comfort of your home.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isDesktop ? 20 : 16,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/apply');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              textStyle: const TextStyle(fontSize: 18),
            ),
            child: const Text('Start Application'),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection(BuildContext context, bool isDesktop) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [
          const Text(
            'Our Services',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Comprehensive solutions for all your marriage registration needs',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 50),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              _buildServiceCard(
                context,
                Icons.app_registration,
                'New Registration',
                'Register your marriage officially within 30 days of the ceremony.',
              ),
              _buildServiceCard(
                context,
                Icons.edit_document,
                'Corrections',
                'Correct spelling mistakes or data errors in existing certificates.',
              ),
              _buildServiceCard(
                context,
                Icons.copy,
                'Certified Copies',
                'Request duplicate or certified copies of your marriage certificate.',
              ),
              _buildServiceCard(
                context,
                Icons.gavel,
                'Special Marriage Act',
                'Registration under Special Marriage Act for inter-faith marriages.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, IconData icon, String title, String description) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 50, color: Theme.of(context).primaryColor),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildProcessSection(BuildContext context, bool isDesktop) {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            'How It Works',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),
          Wrap(
            spacing: 20,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              _buildProcessStep('1', 'Fill Application', 'Complete the online form with accurate details.'),
              _buildArrow(isDesktop),
              _buildProcessStep('2', 'Upload Docs', 'Upload scanned copies of ID and address proofs.'),
              _buildArrow(isDesktop),
              _buildProcessStep('3', 'Verification', 'Officials verify your documents and application.'),
              _buildArrow(isDesktop),
              _buildProcessStep('4', 'Get Certificate', 'Download your digitally signed certificate.'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProcessStep(String number, String title, String desc) {
    return SizedBox(
      width: 200,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0xFF1A237E),
              shape: BoxShape.circle,
            ),
            child: Text(
              number,
              style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            desc,
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildArrow(bool isDesktop) {
    if (!isDesktop) return const SizedBox(height: 20, width: double.infinity); // Break line on mobile
    return const Padding(
      padding: EdgeInsets.only(top: 15),
      child: Icon(Icons.arrow_forward, color: Colors.grey, size: 30),
    );
  }

  Widget _buildDocumentsSection(BuildContext context, bool isDesktop) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [
          const Text(
            'Required Documents',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Keep these ready before applying',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 40),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    _buildDocItem('Proof of Age (Birth Certificate/Passport)'),
                    const Divider(),
                    _buildDocItem('Address Proof (Voter ID/Driving License)'),
                    const Divider(),
                    _buildDocItem('Wedding Invitation Card'),
                    const Divider(),
                    _buildDocItem('Passport Sized Photographs'),
                    const Divider(),
                    _buildDocItem('Affidavit (if applicable)'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green),
          const SizedBox(width: 15),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      color: const Color(0xFF1A237E),
      padding: const EdgeInsets.all(40),
      child: const Column(
        children: [
          Text(
            'MarriageReg Services',
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            '© 2024 Marriage Registration Services. All rights reserved.',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
