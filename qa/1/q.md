MarkDownで執筆したドキュメント群からPDFを生成するDockerコンテナを構築するためのDockerfileと、それを使用するためのシェルスクリプトを作成してください。
条件：
- MarkDownのビルドには、[Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)と[mkdocs-with-pdf](https://github.com/orzih/mkdocs-with-pdf)を使用します。
- ベースイメージとして[squidfunk/mkdocs-material:latest](https://hub.docker.com/r/squidfunk/mkdocs-material/)を使用します。
- MarkDownの本文は日本語を使用しており、画像やコードブロックによる実装の紹介、Noteを活用した解説などを含みます。
- 日本語の文字化けしないように日本語フォントを使用します。
- mkdocs newコマンドによりsiteディレクトリを構築し、その中のmkdocs.ymlをPythonスクリプトで編集して日本語が扱えるように設定します。
- Dockerイメージは、実行時にsrcディレクトリを適切なパスにマウントします。
- Dockerイメージは、実行するとホストマシンのtargetディレクトリにPDFファイルを出力します。
- Dockerイメージは、実行後にコンテナを残しません。
