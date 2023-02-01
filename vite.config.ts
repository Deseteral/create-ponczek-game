/* eslint-disable import/no-extraneous-dependencies, import/no-default-export */
import { defineConfig } from 'vite';
import path from 'path';

export default defineConfig({
  root: path.resolve(__dirname, './src'),
  publicDir: path.resolve(__dirname, './assets'),
  build: {
    outDir: path.join(__dirname, './dist'),
    assetsDir: 'public',
  },
  resolve: {
    alias: {
      'create-ponczek-game': path.resolve(__dirname, './src'),
    },
  },
  server: {
    port: 1234,
  },
  preview: {
    port: 1234,
  },
});
