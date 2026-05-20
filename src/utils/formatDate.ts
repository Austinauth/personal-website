export function formatDate(date: Date, includeYear = true): string {
  const day = date.getDate();
  const suffix = day === 1 || day === 21 || day === 31 ? 'st'
    : day === 2 || day === 22 ? 'nd'
    : day === 3 || day === 23 ? 'rd'
    : 'th';
  const month = date.toLocaleDateString('en-US', { month: 'short' });
  if (!includeYear) return `${month} ${day}${suffix}`;
  const year = date.getFullYear();
  return `${month} ${day}${suffix}, ${year}`;
}
