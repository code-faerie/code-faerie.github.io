module.exports = {
    purge: [
      './_layouts/**/*.html',
      './_includes/**/*.html',
      './_posts/*.md',
      './*.md',
      './*.html',
    ],
    darkMode: false,
    theme: {
      extend: {},
    },
    variants: {},
    plugins: [
      require('@tailwindcss/typography'),
    ],
}