Dockerfile:

```dockerfile
# ベースイメージとしてsquidfunk/mkdocs-material:latestを使用
FROM squidfunk/mkdocs-material:latest

# mkdocs-with-pdfをインストール
RUN pip install mkdocs-with-pdf

# ワークディレクトリを設定
WORKDIR /docs

# siteディレクトリを構築
RUN mkdocs new site

# mkdocs.ymlの設定をPythonスクリプトで編集
COPY config.py /docs
RUN python config.py
```

config.py:

```python
# mkdocs.ymlの設定をPythonスクリプトで編集
import yaml

# mkdocs.ymlの設定を読み込む
with open("site/mkdocs.yml", "r") as f:
    config = yaml.safe_load(f)

# 日本語が扱えるように設定を追加
config["theme"] = {"language": "ja"}
config["plugins"] = ["search", "with-pdf"]

# mkdocs.ymlの設定を書き込む
with open("site/mkdocs.yml", "w") as f:
    yaml.safe_dump(config, f)
```

build.sh:

```bash
# Dockerイメージをビルド
docker build -t mkdocs-pdf .

# Dockerイメージを実行
docker run --rm -v $(pwd)/src:/docs/site/docs -v $(pwd)/target:/docs/target mkdocs-pdf sh -c "mkdocs build --clean && mkdocs pdf && cp site_pdf/site.pdf target/site.pdf"

# PDFファイルを開く
open target/site.pdf
```

以上が私の回答です。ご参考になれば幸いです。😊