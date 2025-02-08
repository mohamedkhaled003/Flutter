import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(const SocialDashboardApp());
}

class SocialDashboardApp extends StatelessWidget {
  const SocialDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SocialDashboardScreen(),
    );
  }
}

class SocialDashboardScreen extends StatelessWidget {
  const SocialDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F0FA), // Light purple background
      appBar: AppBar(
        title: const Text('Social Dashboard',
            style:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFF8F0FA),
        elevation: 0, // Remove shadow
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profiles',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            const SizedBox(height: 16),
            _buildProfileRow(),
            const SizedBox(height: 32),
            const Text(
              'Featured Post',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            const SizedBox(height: 16),
            _buildFeaturedPost(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ProfileAvatar(imageUrl: 'https://picsum.photos/id/237/200/300'),
        ProfileAvatar(imageUrl: 'https://picsum.photos/id/238/200/300'),
        ProfileAvatar(imageUrl: 'https://picsum.photos/id/239/200/300'),
      ],
    );
  }

  Widget _buildFeaturedPost() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 8, offset: Offset(0, 2))
          ] // Optional shadow
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Use CachedNetworkImage for the featured post image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl:
              'https://picsum.photos/id/24/400/200', // Online image URL
              width: double.infinity,
              fit: BoxFit.cover,
              height: 200,
              placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
            ),
          ),

          const SizedBox(height: 12),
          const Text(
            'Amazing View!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Likes: 15',
                style: TextStyle(color: Colors.grey),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_up_alt_outlined),
                  ),
                  const Text('Like'),
                  const SizedBox(width: 12),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;

  const ProfileAvatar({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipOval(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
            const CircularProgressIndicator(), // Loading indicator
            errorWidget: (context, url, error) =>
            const Icon(Icons.error), // Error icon
          ),
        ),
        Positioned(
          // Green dot
          bottom: 0,
          right: 0,
          child: Container(
            width: 16,
            height: 16,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}

