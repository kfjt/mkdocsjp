alias mkdocs=\
'docker run --rm -v "$(pwd)/src:/docs" -u $(id -u):$(id -g) ghcr.io/kfjt/mkdocsjp:latest'

# mkdocs