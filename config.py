site_title = 'fred6'
site_dir = 'site'
out_dir = 'out'
templates_dir = 'templates'
pages_ext = '.md'
page_format = 'markdown'

templates = {}
templates['default_layout'] = 'layout'
templates['default_page'] = 'page_default'

r = [['/blather/*', 'page_router', {'page_template': 'page_blather'}],
     ['/notes/*', 'page_router'],
     ['/', 'index_router', {'page_template': 'index_content'}],
     ['*.md', 'page_router'],
     ['*.*', 'id_router']]
