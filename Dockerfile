FROM jekyll/jekyll

COPY --chown=jekyll:jekyll Gemfile .
COPY --chown=jekyll:jekyll Gemfile.lock .

ENV BUNDLE_PATH=$GEM_HOME

RUN gem install bundler:1.17.3
RUN bundle install --quiet --clean

CMD ["jekyll", "serve"]
