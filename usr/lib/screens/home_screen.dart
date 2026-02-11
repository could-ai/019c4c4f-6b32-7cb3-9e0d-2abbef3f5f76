import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsive check
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 900;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context, isDesktop),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Hero Section with Split Layout (Text Left, Form Right)
            _buildHeroSection(context, isDesktop),

            // 2. Trust/Stats Strip
            _buildTrustStrip(context, isDesktop),

            // 3. Why Choose Us (Grid)
            _buildWhyChooseUs(context, isDesktop),

            // 4. Services Section
            _buildServicesSection(context, isDesktop),

            // 5. How It Works
            _buildProcessSection(context, isDesktop),

            // 6. Testimonials
            _buildTestimonialsSection(context, isDesktop),

            // 7. FAQ
            _buildFAQSection(context, isDesktop),

            // 8. Footer
            _buildFooter(context, isDesktop),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, bool isDesktop) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.1),
      toolbarHeight: 70,
      titleSpacing: isDesktop ? 40 : 16,
      title: Row(
        children: [
          Icon(Icons.verified_user, color: Theme.of(context).primaryColor, size: 32),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'MarriageReg',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Text(
                'Official Certificate Services',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: isDesktop
          ? [
              _buildNavLink('Services'),
              _buildNavLink('Process'),
              _buildNavLink('Documents'),
              _buildNavLink('Reviews'),
              const SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.call, size: 18),
                label: const Text('98765-43210'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[600],
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                ),
              ),
              const SizedBox(width: 40),
            ]
          : [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
            ],
    );
  }

  Widget _buildNavLink(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: () {},
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  // ==========================================
  // 1. HERO SECTION (Split Layout)
  // ==========================================
  Widget _buildHeroSection(BuildContext context, bool isDesktop) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF5F7FA), // Light grey background like NoBroker
      padding: EdgeInsets.symmetric(
        vertical: isDesktop ? 60 : 30,
        horizontal: isDesktop ? 80 : 20,
      ),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 6, child: _buildHeroContent(context, isDesktop)),
                const SizedBox(width: 40),
                Expanded(flex: 4, child: _buildEnquiryForm(context)),
              ],
            )
          : Column(
              children: [
                _buildHeroContent(context, isDesktop),
                const SizedBox(height: 30),
                _buildEnquiryForm(context),
              ],
            ),
    );
  }

  Widget _buildHeroContent(BuildContext context, bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.orange[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '⭐ #1 Trusted Marriage Service in India',
            style: TextStyle(color: Colors.orange[900], fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Legally Valid Marriage Certificate\nWithout The Hassle',
          style: TextStyle(
            fontSize: isDesktop ? 42 : 32,
            fontWeight: FontWeight.w800,
            height: 1.2,
            color: const Color(0xFF2D2D2D),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Get your marriage registered from the comfort of your home. Expert legal assistance, document verification, and doorstep delivery.',
          style: TextStyle(
            fontSize: isDesktop ? 18 : 16,
            color: Colors.grey[700],
            height: 1.5,
          ),
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 20,
          runSpacing: 15,
          children: [
            _buildFeatureCheck('Lowest Price Guarantee'),
            _buildFeatureCheck('100% Online Process'),
            _buildFeatureCheck('Expert Legal Support'),
          ],
        ),
      ],
    );
  }

  Widget _buildFeatureCheck(String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.check_circle, color: Colors.green, size: 20),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _buildEnquiryForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Get Free Consultation',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Fill the form to get a callback from our legal experts.',
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Your Name',
              prefixIcon: Icon(Icons.person_outline),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Mobile Number',
              prefixIcon: Icon(Icons.phone_android),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Select Service',
              prefixIcon: Icon(Icons.category_outlined),
              border: OutlineInputBorder(),
            ),
            items: const [
              DropdownMenuItem(value: 'new', child: Text('New Registration')),
              DropdownMenuItem(value: 'correction', child: Text('Certificate Correction')),
              DropdownMenuItem(value: 'special', child: Text('Special Marriage Act')),
            ],
            onChanged: (v) {},
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/apply');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE63946), // Red accent button
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Check Eligibility',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              '🔒 Your data is 100% secure',
              style: TextStyle(color: Colors.grey[500], fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // 2. TRUST STRIP
  // ==========================================
  Widget _buildTrustStrip(BuildContext context, bool isDesktop) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: isDesktop ? 80 : 30,
        runSpacing: 20,
        children: [
          _buildTrustItem(Icons.people, '15,000+', 'Happy Couples'),
          _buildTrustItem(Icons.star, '4.8/5', 'Google Rating'),
          _buildTrustItem(Icons.verified, '100%', 'Legally Valid'),
          _buildTrustItem(Icons.location_on, '50+', 'Cities Covered'),
        ],
      ),
    );
  }

  Widget _buildTrustItem(IconData icon, String title, String subtitle) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.blue[800], size: 24),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
          ],
        ),
      ],
    );
  }

  // ==========================================
  // 3. WHY CHOOSE US
  // ==========================================
  Widget _buildWhyChooseUs(BuildContext context, bool isDesktop) {
    return Container(
      color: const Color(0xFFF9FAFB),
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: isDesktop ? 80 : 20),
      child: Column(
        children: [
          const Text(
            'Why Choose MarriageReg?',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'We make the complex legal process simple and stress-free',
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              _buildFeatureCard(
                Icons.timer,
                'Fastest Processing',
                'Get your certificate in the shortest possible time with our express service.',
                Colors.orange,
              ),
              _buildFeatureCard(
                Icons.home_work,
                'Doorstep Service',
                'We collect documents and deliver the certificate to your home.',
                Colors.blue,
              ),
              _buildFeatureCard(
                Icons.support_agent,
                'Dedicated Manager',
                'A personal relationship manager to guide you through every step.',
                Colors.purple,
              ),
              _buildFeatureCard(
                Icons.security,
                'Data Privacy',
                'Your personal documents are handled with bank-grade security.',
                Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(IconData icon, String title, String desc, Color color) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 20),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(desc, style: TextStyle(color: Colors.grey[600], height: 1.5)),
        ],
      ),
    );
  }

  // ==========================================
  // 4. SERVICES SECTION
  // ==========================================
  Widget _buildServicesSection(BuildContext context, bool isDesktop) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: isDesktop ? 80 : 20),
      child: Column(
        children: [
          const Text(
            'Our Services',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildServiceItem('New Registration', 'For newly married couples', Icons.app_registration),
              _buildServiceItem('Tatkal Service', 'Urgent registration support', Icons.speed),
              _buildServiceItem('Court Marriage', 'Legal solemnization', Icons.gavel),
              _buildServiceItem('Name Change', 'Post-marriage name update', Icons.badge),
              _buildServiceItem('Certificate Correction', 'Fix errors in old certificates', Icons.edit_document),
              _buildServiceItem('Foreign Marriage', 'Registration for NRIs', Icons.public),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceItem(String title, String subtitle, IconData icon) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 40, color: const Color(0xFF1A237E)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        ],
      ),
    );
  }

  // ==========================================
  // 5. PROCESS SECTION
  // ==========================================
  Widget _buildProcessSection(BuildContext context, bool isDesktop) {
    return Container(
      color: const Color(0xFF1A237E),
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: isDesktop ? 80 : 20),
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            'How It Works',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 50),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              _buildProcessStep('1', 'Fill Details', 'Submit your details online via our form.', Icons.edit_note),
              _buildProcessStep('2', 'Verification', 'Our experts verify your documents.', Icons.verified_user),
              _buildProcessStep('3', 'Appointment', 'Visit registrar office on scheduled date.', Icons.calendar_month),
              _buildProcessStep('4', 'Delivery', 'Get certificate delivered to your home.', Icons.mark_email_read),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProcessStep(String number, String title, String desc, IconData icon) {
    return SizedBox(
      width: 220,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withOpacity(0.3)),
            ),
            child: Icon(icon, color: Colors.white, size: 32),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(
            desc,
            style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14, height: 1.4),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // ==========================================
  // 6. TESTIMONIALS
  // ==========================================
  Widget _buildTestimonialsSection(BuildContext context, bool isDesktop) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: isDesktop ? 80 : 20),
      child: Column(
        children: [
          const Text(
            'What Our Customers Say',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              _buildReviewCard(
                'Rahul & Priya',
                'Bangalore',
                'Excellent service! We got our certificate within 3 days without any hassle. Highly recommended.',
                5,
              ),
              _buildReviewCard(
                'Amit Kumar',
                'Mumbai',
                'Very professional team. They handled all the documentation perfectly. Saved me a lot of time.',
                5,
              ),
              _buildReviewCard(
                'Sneha Reddy',
                'Hyderabad',
                'The process was smooth. The agent came home to collect documents. Very convenient.',
                4,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(String name, String city, String text, int stars) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(5, (index) => Icon(
              Icons.star,
              size: 18,
              color: index < stars ? Colors.amber : Colors.grey[300],
            )),
          ),
          const SizedBox(height: 16),
          Text(
            '"$text"',
            style: TextStyle(color: Colors.grey[800], height: 1.5, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: Text(name[0], style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(city, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ==========================================
  // 7. FAQ SECTION
  // ==========================================
  Widget _buildFAQSection(BuildContext context, bool isDesktop) {
    return Container(
      color: const Color(0xFFF5F7FA),
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: isDesktop ? 150 : 20),
      child: Column(
        children: [
          const Text(
            'Frequently Asked Questions',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          _buildFAQItem('Is physical presence required?', 'Yes, both husband and wife along with 3 witnesses must be present at the registrar office for the final signature.'),
          _buildFAQItem('How long does it take?', 'Usually, it takes 15-30 days depending on the state and type of marriage act.'),
          _buildFAQItem('What documents are needed?', 'Age proof, Address proof, Wedding invitation card, and Photos of the couple.'),
          _buildFAQItem('Can I apply for a marriage that happened years ago?', 'Yes, you can register your marriage at any time, but a late fee may apply.'),
        ],
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: ExpansionTile(
        title: Text(question, style: const TextStyle(fontWeight: FontWeight.w600)),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(answer, style: TextStyle(color: Colors.grey[700])),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // 8. FOOTER
  // ==========================================
  Widget _buildFooter(BuildContext context, bool isDesktop) {
    return Container(
      color: const Color(0xFF111111),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MarriageReg',
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Simplifying legal documentation for Indian citizens. Fast, Secure, and Reliable.',
                      style: TextStyle(color: Colors.grey[400], height: 1.5),
                    ),
                  ],
                ),
              ),
              if (isDesktop) ...[
                const SizedBox(width: 40),
                Expanded(child: _buildFooterLinks('Company', ['About Us', 'Careers', 'Contact', 'Blog'])),
                Expanded(child: _buildFooterLinks('Services', ['Registration', 'Name Change', 'Affidavits', 'Legal Advice'])),
                Expanded(child: _buildFooterLinks('Support', ['Help Center', 'Terms of Service', 'Privacy Policy', 'Sitemap'])),
              ],
            ],
          ),
          const SizedBox(height: 60),
          Divider(color: Colors.grey[800]),
          const SizedBox(height: 30),
          Text(
            '© 2024 MarriageReg Services Pvt Ltd. All rights reserved.',
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLinks(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 20),
        ...links.map((link) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(link, style: TextStyle(color: Colors.grey[400], fontSize: 14)),
        )),
      ],
    );
  }
}
