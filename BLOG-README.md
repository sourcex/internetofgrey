# Internet of Grey Blog Components

This repository contains a VitePress site with custom blog components that allow you to:

1. Display blog cards on the home page
2. View a blog listing page with all posts
3. Display individual blog posts with a custom layout

## Components

The blog implementation consists of the following components:

- `BlogCard.vue`: Individual card component for blog posts
- `BlogCardRow.vue`: A row of blog cards (used on the home page)
- `BlogSection.vue`: A section component with title and blog cards (used on the home page)
- `post.vue`: A custom layout for blog posts

## Blog Post Structure

Blog posts should be placed in the `site/posts/` directory and use the following frontmatter structure:

```markdown
---
title: Your Blog Post Title
description: A brief description of your post
date: YYYY-MM-DD
tag: CATEGORY TAG
image: /images/blog/your-image.jpg
layout: post
---

# Your Content Here
```

## Development

To start the development server:

```bash
npm run docs:dev
```

## Building

To build the site:

```bash
npm run docs:build
```

## Importing Blog Posts

To import blog posts from the material folder:

1. Install the required dependency:
```bash
npm install gray-matter
```

2. Run the import script:
```bash
npm run import-posts
```

## Directory Structure

```
site/
├── .vitepress/
│   ├── components/
│   │   ├── BlogCard.vue
│   │   ├── BlogCardRow.vue
│   │   ├── BlogSection.vue
│   ├── theme/
│   │   ├── custom.css
│   │   ├── index.js
│   │   ├── post.vue
├── posts/
│   ├── your-blog-posts.md
├── public/
│   ├── images/
│   │   ├── blog/
├── blog.md
├── index.md
├── posts.data.js
```
