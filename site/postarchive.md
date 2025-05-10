---
title: Post Archive
description: Internet of Grey Blog Archive - Historical Posts on IoT, Digital Signage, and Enterprise Technologies
---

<script setup>
import { data } from './posts.data.js'
import BlogCard from './.vitepress/components/BlogCard.vue'
import { ref, computed } from 'vue'

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
  if (!data) return [] 

    if (data.length === 0) {
        console.error('No posts available:', data)
        return []
    }

    console.log('Post count:', data.length)

  if (selectedCategory.value === 'all') return data
  return data.filter(post => {
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

<div class="archive-header">
  <h1>Blog Archive</h1>
  <p class="subtitle">Historical posts from the Internet of Grey blog</p>
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
  <p>No posts found in this category. Try another or check back soon.</p>
</div>