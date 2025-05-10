// posts.data.js
import { createContentLoader } from 'vitepress'

export default createContentLoader('posts/*.md', {
  excerpt: true,
  transform(rawData) {
    return rawData
      .filter(p => p.url !== '/posts/' && !p.frontmatter.draft)
      .sort((a, b) => new Date(b.frontmatter.date) - new Date(a.frontmatter.date))
  }
})

// const TWO_YEARS_MS = 2 * 365 * 24 * 60 * 60 * 1000
// export  default createContentLoader('posts/*.md', {
//   excerpt: true,
//   transform(rawData) {
//     const cutoff = Date.now() - TWO_YEARS_MS
//     return rawData
//       .filter(p =>
//         p.url !== '/posts/' &&
//         !p.frontmatter.draft &&
//         new Date(p.frontmatter.date).getTime() >= cutoff
//       )
//       .sort((a, b) => new Date(b.frontmatter.date) - new Date(a.frontmatter.date))
//   }
// })
