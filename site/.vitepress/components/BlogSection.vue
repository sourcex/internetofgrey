<!-- filepath: site/.vitepress/components/BlogSection.vue -->
<script setup>
import BlogCardRow from './BlogCardRow.vue'

// We can pass custom posts to this component, but by default it will use the example ones
defineProps({
  posts: {
    type: Array,
    default: () => []
  },
  title: {
    type: String,
    default: 'Featured Content'
  },
  background: {
    type: String,
    default: 'light'  // light or dark
  }
})
</script>

<template>
  <section class="blog-section">
    <div class="blog-section-container">
      <h2 class="blog-section-title">{{ title }}</h2>
      <BlogCardRow v-if="posts && posts.length" :posts="posts" />
      <div v-else class="blog-section-empty">No posts available</div>
      <div class="blog-section-actions">
        <a class="blog-section-link" href="/blog">View All Articles →</a>
      </div>
    </div>
  </section>
</template>

<style scoped>
.blog-section {
  padding: 4rem 1rem;
  background-color: var(--vp-c-bg-soft);
  border-top: 1px solid var(--vp-c-divider);
  border-bottom: 1px solid var(--vp-c-divider);
}

.blog-section-container {
  max-width: 1200px;
  margin: 0 auto;
}

.blog-section-title {
  font-size: 2rem;
  font-weight: 700;
  margin-bottom: 2rem;
  text-align: left;
  color: var(--vp-c-text-1);
}

.blog-section-actions {
  margin-top: 2.5rem;
  text-align: center;
}

.blog-section-link {
  display: inline-block;
  padding: 0.5rem 1.5rem;
  font-size: 1rem;
  font-weight: 500;
  color: var(--vp-c-brand);
  text-decoration: none;
  transition: color 0.2s ease;
}

.blog-section-link:hover {
  color: var(--vp-c-brand-dark);
  text-decoration: underline;
}
</style>
