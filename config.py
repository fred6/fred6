site_title = 'fred6'
site_dir = 'site'
out_dir = 'out'
templates_dir = 'templates'

templates = {}
templates['default_layout'] = 'layout'
templates['default_page'] = 'page_default'


r = [('/blather/*', 'page_router', 'page_blather'),
     ('/notes/*', 'page_router'),
     ('/', 'index_router', 'index_content'),
     ('/*', 'page_router'),
     ('/css/*', 'id_router'),
     ('/images/*', 'id_router')]
