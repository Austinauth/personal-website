import { visit } from 'unist-util-visit';

const base = '/personal-website';

export function remarkBaseUrl() {
  return (tree) => {
    // Handle markdown images ![alt](url)
    visit(tree, 'image', (node) => {
      if (node.url && node.url.startsWith('/') && !node.url.startsWith(base)) {
        node.url = base + node.url;
      }
    });

    // Handle raw HTML in markdown (remark html nodes)
    visit(tree, 'html', (node) => {
      if (node.value) {
        node.value = node.value.replace(
          /src="(\/(?!personal-website)[^"]*)"/g,
          `src="${base}$1"`
        );
      }
    });
  };
}

export function rehypeBaseUrl() {
  return (tree) => {
    visit(tree, 'element', (node) => {
      if (node.tagName === 'img' && node.properties?.src) {
        const src = node.properties.src;
        if (typeof src === 'string' && src.startsWith('/') && !src.startsWith(base)) {
          node.properties.src = base + src;
        }
      }
    });
  };
}
