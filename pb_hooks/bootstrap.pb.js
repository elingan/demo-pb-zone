/// <reference path="../pb_data/types.d.ts" />

onAfterBootstrap((e) => {
  console.log('-> Bootstrap finished!')
  console.log(e.app.isDev() ? '-> Development mode' : '-> Production mode')
})
