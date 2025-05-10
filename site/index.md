---
layout: false
---

<section class="hero">
  <div class="hero-overlay"></div>
  <div class="hero-inner">
    <h1>Internet of Grey</h1>
    <p>Exploring IoT, Digital Signage, and Enterprise Technologies</p>
    <div class="hero-buttons">
      <a href="https://linkedin.com/in/your-username" class="button">LinkedIn</a>
      <a href="https://github.com/your-username" class="button">GitHub</a>
      <a href="/blog" class="button primary">Featured Posts</a>
    </div>
  </div>
</section>

<script setup>
import BlogCardRow from './.vitepress/components/BlogCardRow.vue'

const featuredPosts = [
  {
    title: 'Windows 10 IoT Core for Digital Signage',
    description: 'Exploring the capabilities and use cases of this lightweight OS for digital displays and kiosks',
    image: '/images/blog/businesscat_card.jpg',
    link: '/posts/diving-in-windows-10-iot-core-for-digital-signage',
    tag: 'IoT'
  },
  {
    title: 'Building Commercial IoT Core Devices',
    description: 'Requirements and considerations for developing production-ready IoT hardware and software',
    image: '/images/blog/ffucapture_card.jpg',
    link: '/posts/what-does-it-take-to-build-a-commercial-windows-10-iot-core-device',
    tag: 'IoT'
  },
  {
    title: 'Digital Signage Video Wall Implementation',
    description: 'Tales from the lab: Building and configuring a 3x3 video wall system',
    image: '/images/blog/halftonemarble1_card.jpg',
    link: '/posts/tales-from-the-lab-3-x-3-video-wall',
    tag: 'Digital Signage'
  },
  {
    title: 'Intel vPro for Enterprise Management',
    description: 'Implementing Intel vPro beyond the marketing - real-world deployment considerations',
    image: '/images/blog/grittyiothub_card.jpg',
    link: '/posts/implementing-intel-vpro-past-the-marketing',
    tag: 'Enterprise'
  }
]
</script>

<!-- Featured Articles -->
<div class="featured-articles">
  <h2 class="section-title">Featured Articles</h2>
  <BlogCardRow :posts="featuredPosts" />
  <div class="view-all">
    <a href="/blog" class="view-all-link">View All Articles →</a>
  </div>
</div>