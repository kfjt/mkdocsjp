#!/usr/bin/env python3

import yaml

# mkdocs.ymlを読み込む
with open('/docs/mkdocs.yml', 'r') as f:
    config = yaml.safe_load(f)

# 日本語を扱う設定を追記
config['theme'] = {
    'name': 'material',
    'language': 'ja'
}
config["plugins"] = ["search", "with-pdf"]

# mkdocs.ymlに書き込む
with open('/docs/mkdocs.yml', 'w') as f:
    yaml.safe_dump(config, f)
