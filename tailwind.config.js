module.exports = {
    purge: [
      './dist/_includes/**/*.html',
      './dist/_layouts/**/*.html',
      './dist/_posts/*.md',
      './dist/*.md',
      './dist/*.html',
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