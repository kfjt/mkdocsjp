# ベースイメージとしてsquidfunk/mkdocs-material:latestを使用
FROM squidfunk/mkdocs-material:latest

RUN apk add font-ipa fontconfig && fc-cache -f

# https://doc.courtbouillon.org/weasyprint/stable/first_steps.html#alpine-3-12
# RUN apk add py3-pip py3-pillow py3-cffi py3-brotli gcc musl-dev python3-dev pango g++
RUN apk add py3-brotli gcc musl-dev python3-dev pango g++

# 必要なPythonライブラリをインストール
RUN pip install mkdocs-with-pdf

# ワーキングディレクトリを設定
WORKDIR /docs

# MkDocsを実行して、MarkdownからPDFを生成
CMD ["build"]
