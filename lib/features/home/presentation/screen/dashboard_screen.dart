import 'package:flutter/material.dart';
import 'package:focus_flow_flutter/features/home/presentation/screen/new_entry_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: Row(
      //     children: [
      //       const Icon(Icons.blur_on, color: Color(0xFF5D5FEF)),
      //       const SizedBox(width: 8),
      //       Text(
      //         'FocusFlow',
      //         style: GoogleFonts.outfit(
      //           fontWeight: FontWeight.bold,
      //           color: const Color(0xFF5D5FEF),
      //         ),
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(Icons.search, color: Colors.black54),
      //       style: IconButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.05)),
      //     ),
      //     const SizedBox(width: 8),
      //     const CircleAvatar(
      //       radius: 18,
      //       backgroundColor: Color(0xFF1E1E1E),
      //       child: Icon(Icons.person, size: 20, color: Colors.white),
      //     ),
      //     const SizedBox(width: 16),
      //   ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                'WORKSPACE',
                style: GoogleFonts.outfit(
                  letterSpacing: 2,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF5D5FEF),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Today',
                style: GoogleFonts.outfit(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E1E1E),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _buildHeaderChip(Icons.calendar_today, 'October 24'),
                  const SizedBox(width: 12),
                  _buildHeaderChip(Icons.timer_outlined, '4h 12m spent'),
                ],
              ),
              const SizedBox(height: 30),
              const DeepWorkCard(),
              const SizedBox(height: 16),
              const SmallTaskCard(
                category: 'CREATIVE',
                title: 'UI Refinement',
                subtitle: 'Polishing the sanctuary aesthetic transitions.',
                duration: '45m',
              ),
              const SizedBox(height: 16),
              const SmallTaskCard(
                category: 'ADMIN',
                title: 'Email Sort',
                subtitle: 'Inbound priority filtering for weekly sync.',
                duration: '12m',
              ),
              const SizedBox(height: 16),
              const DailyFlowCard(),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming',
                    style: GoogleFonts.outfit(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View All',
                      style: TextStyle(color: Color(0xFF5D5FEF)),
                    ),
                  ),
                ],
              ),
              const UpcomingItem(
                icon: Icons.door_front_door_outlined,
                title: 'Team Coordination',
                subtitle: 'Global Sync & Goal Alignment',
                time: '14:00',
              ),
              const UpcomingItem(
                icon: Icons.edit_note,
                title: 'Journal Reflections',
                subtitle: 'Daily closure and gratitude exercise',
                time: '17:30',
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => NewEntryScreen()),
          );
        },
        backgroundColor: const Color(0xFF5D5FEF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }

  Widget _buildHeaderChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.black54),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

class DeepWorkCard extends StatelessWidget {
  const DeepWorkCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8E9FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'DEEP WORK',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5D5FEF),
                  ),
                ),
              ),
              const Icon(Icons.more_vert, color: Color(0xFF5D5FEF)),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Architecture Review &\nSystem Documentation',
            style: GoogleFonts.outfit(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Finalizing the structural blueprints for the Q4 infrastructure expansion.',
            style: TextStyle(color: Colors.black54, fontSize: 16),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DURATION',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '2h 45m',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(width: 24),
              Container(height: 40, width: 1, color: Colors.grey.shade200),
              const SizedBox(width: 24),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'STATUS',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: Color(0xFF5D5FEF),
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Active',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5D5FEF),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Color(0xFF5D5FEF),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.pause, color: Colors.white, size: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SmallTaskCard extends StatelessWidget {
  final String category, title, subtitle, duration;

  const SmallTaskCard({
    super.key,
    required this.category,
    required this.title,
    required this.subtitle,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFEDF2F7).withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  category,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              Text(
                duration,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}

class DailyFlowCard extends StatelessWidget {
  const DailyFlowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFEDF2F7).withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'DAILY FLOW',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                '70%',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5D5FEF),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.7,
              minHeight: 8,
              backgroundColor: Colors.white,
              color: const Color(0xFF5D5FEF),
            ),
          ),
        ],
      ),
    );
  }
}

class UpcomingItem extends StatelessWidget {
  final IconData icon;
  final String title, subtitle, time;

  const UpcomingItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFEDF2F7).withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: const Color(0xFF2D3748)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'SCHEDULED',
                style: TextStyle(
                  fontSize: 9,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
