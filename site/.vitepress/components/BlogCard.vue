<!-- filepath: site/.vitepress/components/BlogCard.vue -->
<script setup>
defineProps({
  title: {
    type: String,
    required: true
  },
  image: {
    type: String,
    required: true
  },
  description: {
    type: String,
    required: true
  },
  tag: {
    type: String,
    required: true
  },
  date: {
    type: String,
    default: ''
  },
  link: {
    type: String,
    required: true
  }
})
</script>

<template>
  <article class="blog-card">
    <a :href="link" class="blog-card-container">
      <div class="blog-card-image">
        <img :src="image" :alt="title">
      </div>
      <div class="blog-card-content">
        <div class="blog-card-tag">{{ tag }}</div>
        <h3 class="blog-card-title">{{ title }}</h3>
        <!-- <p class="blog-card-description">{{ description }}</p> -->
        <span class="blog-card-read-more">Read more</span>
      </div>
    </a>
  </article>
</template>

<style scoped>
.blog-card {
  display: flex;
  flex-direction: column;
  height: 100%;
  border-radius: 0px;
  overflow: hidden;
  transition: all 0.3s;
  background-color: var(--vp-c-bg);
  border: 1px solid var(--vp-c-divider);
}

.blog-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.08);
  border-color: var(--vp-c-brand-lighter);
}

.blog-card-container {
  display: flex;
  flex-direction: column;
  height: 100%;
  text-decoration: none;
  color: inherit;
}

.blog-card-image {
  height: 220px;
  overflow: hidden;
  position: relative;
}

.blog-card-image::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  height: 40px;
  background: linear-gradient(to top, rgba(0,0,0,0.2), transparent);
}

.blog-card-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.5s;
}

.blog-card:hover .blog-card-image img {
  transform: scale(1.05);
}

.blog-card-content {
  padding: 1.25rem 1.75rem;
  display: flex;
  flex-direction: column;
  flex-grow: 1;
  justify-content: space-between;
}

.blog-card-tag {
  background-color: var(--vp-c-brand-dimm);
  color: var(--vp-c-brand-dark);
  display: inline-block;
  font-size: 0.75rem;
  font-weight: 600;
  padding: 0.25rem 0.75rem;
  border-radius: 0px;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  margin-bottom: 0.75rem;
  align-self: flex-start;
}

.blog-card-title {
  font-size: 1.25rem;
  font-weight: 600;
  line-height: 1.3;
  margin: 0 0 0.5rem 0;
  color: var(--vp-c-text-1);
}

.blog-card-description {
  color: var(--vp-c-text-2);
  font-size: 0.95rem;
  line-height: 1.5;
  margin: 0 0 1rem 0;
  flex-grow: 1;
}

.blog-card-read-more {
  color: var(--vp-c-brand);
  font-size: 0.9rem;
  font-weight: 500;
  display: flex;
  align-items: center;
  margin-top: auto;
}

.blog-card:hover .blog-card-read-more {
  text-decoration: underline;
}
</style>
