import DefaultTheme from 'vitepress/theme'
import PostLayout from './post.vue'
import './custom.css'

export default {
  ...DefaultTheme,
  enhanceApp({ app }) {
    app.component('post', PostLayout)
  },
  layouts: {
    post: PostLayout
  }
}
