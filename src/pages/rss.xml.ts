import rss from '@astrojs/rss';
import { getCollection } from 'astro:content';

export async function GET(context: { site: URL }) {
  const posts = await getCollection('posts');
  const published = posts
    .filter((post) => !post.data.draft)
    .sort((a, b) => b.data.date.getTime() - a.data.date.getTime());

  return rss({
    title: 'Austin Auth',
    description: 'Design thoughts and project case studies from Austin Auth, Senior Product Designer at Microsoft.',
    site: context.site,
    items: published.map((post) => ({
      title: post.data.title,
      pubDate: post.data.date,
      link: `/posts/${post.id}/`,
    })),
  });
}
