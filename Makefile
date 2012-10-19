ROOT=$(shell pwd)
CACHE_ROOT=${ROOT}/.cache
PKG_ROOT=${ROOT}/.pkg

-include Makefile.local

.PHONY: all
all: ${PKG_ROOT}/.stamp-h

.PHONY: shell
run: all
	RBENV_ROOT="${PKG_ROOT}" "${PKG_ROOT}"/bin/rbenv exec \
	    jekyll --server --pygments --no-lsi --safe

.PHONY: shell
shell: all
	RBENV_ROOT="${PKG_ROOT}" "${PKG_ROOT}"/bin/rbenv exec \
	    irb

.PHONY: mostlyclean
mostlyclean:

.PHONY: clean
clean: mostlyclean
	-rm -rf "${PKG_ROOT}"

.PHONY: distclean
distclean: clean
	-rm -rf "${CACHE_ROOT}"
	-rm -rf Makefile.local

.PHONY: maintainer-clean
maintainer-clean: distclean
	@echo 'This command is intended for maintainers to use; it'
	@echo 'deletes files that may need special tools to rebuild.'

# ===--------------------------------------------------------------------===

${CACHE_ROOT}/rbenv/rbenv-0.3.0.tar.gz:
	mkdir -p ${CACHE_ROOT}/rbenv
	curl -L 'https://nodeload.github.com/sstephenson/rbenv/tarball/v0.3.0' >'$@'

${CACHE_ROOT}/rbenv/rbenv-gemset-0.3.0.tar.gz:
	mkdir -p ${CACHE_ROOT}/rbenv
	curl -L 'https://nodeload.github.com/jamis/rbenv-gemset/tarball/v0.3.0' >'$@'

${CACHE_ROOT}/rbenv/ruby-build-20120815.tar.gz:
	mkdir -p ${CACHE_ROOT}/rbenv
	curl -L 'https://nodeload.github.com/sstephenson/ruby-build/tarball/v20120815' >'$@'

${PKG_ROOT}/.stamp-h: Gemfile Gemfile.lock ${CACHE_ROOT}/rbenv/rbenv-0.3.0.tar.gz ${CACHE_ROOT}/rbenv/rbenv-gemset-0.3.0.tar.gz ${CACHE_ROOT}/rbenv/ruby-build-20120815.tar.gz
	# Because build and run-time dependencies are not thoroughly tracked,
	# it is entirely possible that rebuilding the development environment
	# on top of an existing one could result in a broken build. For the
	# sake of consistency and preventing unnecessary, difficult-to-debug
	# problems, the entire development environment is rebuilt from scratch
	# everytime this make target is selected.
	${MAKE} clean
	
	# The `${PKG_ROOT}` directory, if it exists, is removed by the `clean`
	# target. This might cause problems with build scripts executed later
	# which assume their existence, so they are created now if they don't
	# already exist.
	mkdir -p "${PKG_ROOT}"
	
	# rbenv (and its plugins, ruby-build and rbenv-gemset) is used to build,
	# install, and manage ruby environments:
	tar \
	    -C "${PKG_ROOT}" --strip-components 1 --gzip \
	    -xf "${CACHE_ROOT}"/rbenv/rbenv-0.3.0.tar.gz
	mkdir -p "${PKG_ROOT}"/plugins/ruby-build
	tar \
	    -C "${PKG_ROOT}"/plugins/ruby-build --strip-components 1 --gzip \
	    -xf "${CACHE_ROOT}"/rbenv/ruby-build-20120815.tar.gz
	mkdir -p "${PKG_ROOT}"/plugins/rbenv-gemset
	tar \
	    -C "${PKG_ROOT}"/plugins/rbenv-gemset --strip-components 1 --gzip \
	    -xf "${CACHE_ROOT}"/rbenv/rbenv-gemset-0.3.0.tar.gz
	
	# Trigger a build and install of our required ruby version, configure our
	# gemset, and select ruby version & gemset environments:
	- RBENV_ROOT="${PKG_ROOT}" "${PKG_ROOT}"/bin/rbenv install 1.9.3-p194
	- RBENV_ROOT="${PKG_ROOT}" "${PKG_ROOT}"/bin/rbenv rehash
	echo 1.9.3-p194 >.rbenv-version
	
	# Install bundler & gemset dependencies:
	RBENV_ROOT="${PKG_ROOT}" "${PKG_ROOT}"/bin/rbenv exec gem install bundler
	- RBENV_ROOT="${PKG_ROOT}" "${PKG_ROOT}"/bin/rbenv rehash
	RBENV_ROOT="${PKG_ROOT}" "${PKG_ROOT}"/bin/rbenv exec bundle install
	- RBENV_ROOT="${PKG_ROOT}" "${PKG_ROOT}"/bin/rbenv rehash
	
	# All done!
	touch "${PKG_ROOT}"/.stamp-h

# ===--------------------------------------------------------------------===
# End of File
# ===--------------------------------------------------------------------===
