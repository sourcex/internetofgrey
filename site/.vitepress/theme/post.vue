<!-- filepath: site/.vitepress/theme/post.vue -->
<script setup>
import DefaultTheme from 'vitepress/theme'
import { useData } from 'vitepress'

const { Layout } = DefaultTheme
const { frontmatter } = useData()
</script>

<template>
  <Layout>
    <template #doc-before>
      <div class="blog-post-header">
        <div class="container">
          <div class="blog-post-meta">
            <div v-if="frontmatter.tag" class="blog-post-tag">{{ frontmatter.tag }}</div>
            <div v-if="frontmatter.date" class="blog-post-date">{{ new Date(frontmatter.date).toLocaleDateString('en-US', { year: 'numeric', month: 'long', day: 'numeric' }) }}</div>
          </div>
          <h1 class="blog-post-title">{{ frontmatter.title }}</h1>
          <p v-if="frontmatter.description" class="blog-post-description">{{ frontmatter.description }}</p>
          <div v-if="frontmatter.image" class="blog-post-image">
            <img :src="frontmatter.image" :alt="frontmatter.title">
          </div>
        </div>
      </div>
    </template>
  </Layout>
</template>

<style scoped>
.blog-post-header {
  padding: 3rem 0 2rem;
}

.container {
  max-width: 800px;
  margin: 0 auto;
  padding: 0 1.5rem;
}

.blog-post-meta {
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  gap: 1rem;
  margin-bottom: 1.5rem;
}

.blog-post-tag {
  background-color: #f0f0f0;
  color: #666;
  display: inline-block;
  font-size: 0.75rem;
  font-weight: 700;
  padding: 0.25rem 0.75rem;
  border-radius: 2rem;
  text-transform: uppercase;
  letter-spacing: 0.05em;
}

.blog-post-date {
  color: #666;
  font-size: 0.9rem;
}

.blog-post-title {
  font-size: 2.5rem;
  font-weight: 700;
  line-height: 1.2;
  margin: 0 0 1rem;
}

.blog-post-description {
  font-size: 1.25rem;
  color: #666;
  line-height: 1.5;
  margin: 0 0 2rem;
}

.blog-post-image {
  margin: 0 0 3rem;
  border-radius: 8px;
  overflow: hidden;
}

.blog-post-image img {
  width: 100%;
  height: auto;
  display: block;
}
</style>
