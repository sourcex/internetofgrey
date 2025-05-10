---
title: Blog
description: Internet of Grey Blog - IoT, Digital Signage, and Enterprise Technologies
---

<script setup>
import { data } from './posts.data.js'
import BlogCard from './.vitepress/components/BlogCard.vue'
import { ref, computed } from 'vue'

const recentPosts = computed(() => {
  if (!data) 
  {
    console.error('No data available for recent posts:', data)
    return []
  }

  console.log('Post count:', data.length)

  return data.filter(post => {
    const date = new Date(post.frontmatter.date)
    const twoYearsAgo = new Date()
    twoYearsAgo.setFullYear(twoYearsAgo.getFullYear() - 2)
    return date >= twoYearsAgo
  })
})

const selectedCategory = ref('all')
const categories = [
  { id: 'all',             name: 'All Posts' },
  { id: 'iot',             name: 'IoT & Embedded' },
  { id: 'digital-signage', name: 'Digital Signage' },
  { id: 'enterprise',      name: 'Enterprise Tech' }
]

const defaultCardImages = [
  '/images/blog/computerdecay_card.jpg',
  '/images/blog/businesscat_card.jpg',
  '/images/blog/catheadshot_card.jpg',
  '/images/blog/cement1_card.jpg',
  '/images/blog/cement2_card.jpg',
  '/images/blog/cement3_card.jpg',
  '/images/blog/chromedevicefleet_card.jpg',
  '/images/blog/computerlabdebay1_card.jpg',
  '/images/blog/computerlabdebay2_card.jpg',
  '/images/blog/computerlabdebay3_card.jpg',
  '/images/blog/ffucapture_card.jpg',
  '/images/blog/grittyiothub_card.jpg',
  '/images/blog/halftonemarble1_card.jpg',
  '/images/blog/halftonemarble2_card.jpg',
  '/images/blog/house-fire_card.jpg',
  '/images/blog/minimalclouds_card.jpg',
  '/images/blog/whimsigoth2_card.jpg',
  '/images/blog/adu-la_card.jpg'
]

const getDefaultImage = (post) => {
  return post.frontmatter.image
    ? post.frontmatter.image
    : defaultCardImages[Math.floor(Math.random() * defaultCardImages.length)]
}

const filteredPosts = computed(() => {
  if (selectedCategory.value === 'all') return recentPosts.value
  return recentPosts.value.filter(post => {
    const tag = (post.frontmatter.tag || '').toLowerCase()
    if (selectedCategory.value === 'iot')
      return tag.includes('iot') || tag.includes('embedded')
    if (selectedCategory.value === 'digital-signage')
      return tag.includes('signage') || tag.includes('digital signage')
    if (selectedCategory.value === 'enterprise')
      return tag.includes('enterprise') || tag.includes('commercial')
    return true
  })
})
</script>

<!-- Hero -->
<div class="blog-header">
  <h1>Blog</h1>
  <p class="subtitle">Recent insights on IoT, Digital Signage & Enterprise Tech</p>
  <p class="archive-link"><a href="/postarchive">View complete post archive →</a></p>
</div>

  <!-- Category Filters -->
  <div class="blog-categories">
    <button
      v-for="cat in categories"
      :key="cat.id"
      :class="{ active: selectedCategory === cat.id }"
      @click="selectedCategory = cat.id"
      class="category-button">
      {{ cat.name }}
    </button>
  </div>

  <!-- Responsive Grid -->
  <div class="blog-grid">
    <div v-for="post in filteredPosts" :key="post.url" class="blog-grid-item">
      <BlogCard
        :title="post.frontmatter.title"
        :image="getDefaultImage(post)"
        :description="post.frontmatter.description"
        :tag="post.frontmatter.tag || 'Technology'"
        :date="new Date(post.frontmatter.date)
          .toLocaleDateString('en-US',{year:'numeric',month:'long',day:'numeric'})"
        :link="post.url"
      />
    </div>
  </div>
  <!-- Empty State -->
  <div v-if="filteredPosts.length === 0" class="no-results">
    <p>No recent posts found in this category. Try another category or check the <a href="/postarchive">archive</a>.</p>
  </div>
  
  <div class="blog-note">
    <p><small><a href="/postarchive">Archive</a></small></p>
  </div>

