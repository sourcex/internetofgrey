import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  appearance: false,
  themeConfig: {
    siteTitle: false,
    logo: {
      light: '/images/blog/halftonemarble2.png',
      dark: '/images/blog/halftonemarble2.png',
    },
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Blog', link: '/blog' },
      { text: 'About', link: '/about' }
    ],
  },
  cleanUrls: true,
})