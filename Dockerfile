# FROM ruby:3.2-slim

# WORKDIR /app

# # Instala dependências do sistema necessárias para gems nativas
# RUN apt-get update -qq && apt-get install -y --no-install-recommends \
#     build-essential \
#     libpq-dev \
#     libyaml-dev \
#     git \
#     curl \
#     && rm -rf /var/lib/apt/lists/*

# # Copia Gemfile e Gemfile.lock
# COPY Gemfile* ./

# # Instala gems
# RUN bundle install \
#   && gem cleanup \
#   && bundle clean --force \
#   && rm -rf /usr/local/bundle/cache/*.gem

# # Copia o restante da aplicação
# COPY . .

# CMD ["bash"]

# Stage 1: Builder
FROM ruby:3.2-slim AS builder

# Dependências do sistema
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    libyaml-dev \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /app

# Copia apenas arquivos essenciais para instalar gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 4 --retry 3 --without development test

# Copia o restante do app
COPY . .

# Stage 2: Runtime
FROM ruby:3.2-slim

# Dependências do sistema runtime
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    libyaml-dev \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /app

# Copia gems do stage builder
COPY --from=builder /usr/local/bundle /usr/local/bundle

# Copia código
COPY --from=builder /app /app

# Define variável de ambiente
ENV RAILS_ENV=production \
    BUNDLE_PATH=/usr/local/bundle

# Precompile assets e remove cache se houver
RUN bundle exec rake assets:precompile || true \
    && rm -rf tmp/cache

# Comando padrão para Rails (pode alterar para sidekiq se precisar)
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
