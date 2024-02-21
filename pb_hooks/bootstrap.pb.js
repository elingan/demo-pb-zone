/// <reference path="../pb_data/types.d.ts" />

onAfterBootstrap((e) => {
  console.log('Bootstrap finished,', 'Develop mode:', e.app.isDev())
})
