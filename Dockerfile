FROM composer:2.3

WORKDIR /app

COPY . .

RUN composer install --ignore-platform-reqs

RUN docker-php-ext-install pdo_mysql

CMD php artisan migrate --force --seed & php artisan serve --host=0.0.0.0 --port=8080
