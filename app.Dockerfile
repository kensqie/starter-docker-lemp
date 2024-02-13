FROM php:8-fpm

# Arguments defined in docker-compose.yml
ARG user
ARG uid

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    zip \
    unzip \
    libzip-dev \
    libxml2-dev \
    libonig-dev \
    libpng-dev \
    libwebp-dev \
    libavif-dev \
    libxpm-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Config php extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp --with-avif --with-xpm

# Install php extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath simplexml zip gd

# Get latest composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run composer and artisan commands
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

# Set working directory
WORKDIR /var/www/app

USER $user
