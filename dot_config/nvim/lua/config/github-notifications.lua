require('github-notifications').setup {
  username = os.getenv('GH_USERNAME'),
  token = os.getenv('GH_TOKEN'),
}

require('telescope').load_extension('ghn')
