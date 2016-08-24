# Start with the offical image for PHP 5.6
FROM php:5.6

# Install additonal packages
RUN apt-get update
RUN apt-get install -y git unzip libmcrypt-dev libmemcached-dev libz-dev
RUN pecl install memcached

# Install/Enable PHP extensions
RUN docker-php-ext-install pcntl mcrypt
RUN echo extension=memcached.so >> /usr/local/etc/php/conf.d/memcached.ini

# Install Composer and make it available in the PATH
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

# Copy all files to docker
ADD . /app

# Set the current working directory
WORKDIR /app
