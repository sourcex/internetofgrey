<!-- filepath: site/.vitepress/components/BlogCardRow.vue -->
<script setup>
import BlogCard from './BlogCard.vue'
import { ref } from 'vue'

// Props with default example posts (these will be replaced by real data)
const props = defineProps({
  posts: {
    type: Array,
    default: () => [
      {
        title: 'Windows 10 IoT Core for Digital Signage',
        image: '/images/blog/iot-core-signage.jpg',
        description: 'Exploring the capabilities and use cases of this lightweight OS for digital displays and kiosks',
        tag: 'IoT',
        link: '/posts/diving-in-windows-10-iot-core-for-digital-signage'
      },
      {
        title: 'Building Commercial IoT Core Devices',
        image: '/images/blog/commercial-iot.jpg',
        description: 'Requirements and considerations for developing production-ready IoT hardware and software',
        tag: 'IoT',
        link: '/posts/what-does-it-take-to-build-a-commercial-windows-10-iot-core-device'
      },
      {
        title: 'Digital Signage Video Wall Implementation',
        image: '/images/blog/video-wall.jpg',
        description: 'Tales from the lab: Building and configuring a 3x3 video wall system',
        tag: 'Digital Signage',
        link: '/posts/tales-from-the-lab-3-x-3-video-wall'
      },
      {
        title: 'Intel vPro for Enterprise Management',
        image: '/images/blog/enterprise-tech.jpg',
        description: 'Implementing Intel vPro beyond the marketing - real-world deployment considerations',
        tag: 'Enterprise',
        link: '/posts/implementing-intel-vpro-past-the-marketing'
      }
    ]
  }
})
</script>

<template>
  <div class="blog-card-row">
    <div v-for="(post, index) in posts" :key="index" class="blog-card-col">
      <BlogCard
        :title="post.title"
        :image="post.image"
        :description="post.description"
        :tag="post.tag"
        :date="post.date"
        :link="post.link"
      />
    </div>
  </div>
</template>

<style scoped>
.blog-card-row {
  display: grid;
  grid-template-columns: repeat(1, 1fr);
  gap: 2rem;
}

@media (min-width: 640px) {
  .blog-card-row {
    grid-template-columns: repeat(2, 1fr);
    gap: 1.5rem;
  }
}

@media (min-width: 960px) {
  .blog-card-row {
    grid-template-columns: repeat(3, 1fr);
    gap: 1.75rem;
  }
}

@media (min-width: 1280px) {
  .blog-card-row {
    grid-template-columns: repeat(4, 1fr);
    gap: 2rem;
  }
}

.blog-card-col {
  display: flex;
  flex-direction: column;
  height: 100%;
}
</style>
