const { detect } = require('detect-package-manager')
const { argv } = require('node:process')

if (argv.length <= 2) {
  console.error('Missing path argument')
  process.exitCode = 1
} else {
  detect(argv[2])
    .then(pm => {
      console.log(pm)
    })
}
