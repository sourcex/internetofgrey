import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import matter from 'gray-matter';

// Get the directory name in ESM
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Directories
const SOURCE_DIR = path.join(__dirname, '..', 'material', 'Blogger Posts');
const TARGET_DIR = path.join(__dirname, '..', 'site', 'posts');

// Make sure the target directory exists
if (!fs.existsSync(TARGET_DIR)){
    fs.mkdirSync(TARGET_DIR, { recursive: true });
}

// Process all markdown files in the source directory
const sourceFiles = fs.readdirSync(SOURCE_DIR)
    .filter(file => file.endsWith('.md'));

console.log(`Found ${sourceFiles.length} source blog posts to process...`);

sourceFiles.forEach(file => {
    const sourcePath = path.join(SOURCE_DIR, file);
    
    // Read the source file
    const fileContent = fs.readFileSync(sourcePath, 'utf8');
    
    try {
        // Parse frontmatter
        const { data, content } = matter(fileContent);
        
        // Create slug from filename
        const slug = file
            .replace(/\.md$/, '')
            .toLowerCase()
            .replace(/[^\w\s-]/g, '')
            .replace(/\s+/g, '-');
        
        // Create new frontmatter
        const newFrontmatter = {
            title: data.title || 'Untitled Post',
            description: '', // You might want to extract this from content
            date: data.date || new Date().toISOString(),
            tag: 'TECHNOLOGY', // Default tag
            image: `/images/blog/placeholder.jpg`, // Default image
            layout: 'post'
        };
        
        // Create new content with frontmatter
        const newFileContent = matter.stringify(content, newFrontmatter);
        
        // Write to target file
        const targetPath = path.join(TARGET_DIR, `${slug}.md`);
        fs.writeFileSync(targetPath, newFileContent);
        
        console.log(`Processed: ${file} -> ${slug}.md`);
    } catch (err) {
        console.error(`Error processing ${file}:`, err);
    }
});

console.log('Import completed!');
