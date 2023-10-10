#!/usr/local/bin/python

import yaml

with open('/opt/src/mkdocs.yml', mode='r') as file:
    obj = yaml.safe_load(file.read())

setting_material_ja = {
    'theme': {
        'name': 'material',
        'language': 'ja',
    },
    # 'extra': {
    #     'search': {
    #         'language': 'jp',
    #     }
    # }
}
obj.update(setting_material_ja)

with open('/opt/src/mkdocs.yml', mode='w') as file:
    obj = yaml.dump(obj, file, default_flow_style=False, sort_keys=False)
