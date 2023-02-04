module.exports = {
  env: {
    browser: true,
    es2021: true,
  },
  extends: ['plugin:react/recommended', 'airbnb', 'prettier'],
  overrides: [],
  parserOptions: {
    ecmaVersion: 'latest',
    sourceType: 'module',
  },
  plugins: ['react', 'prettier'],
  rules: {
    'no-console': 1, // Means warning
    'prettier/prettier': 2, // Means error
    'no-use-before-define': 'off',
    'import/no-extraneous-dependencies': ['error', {devDependencies: true}],
  },
}
