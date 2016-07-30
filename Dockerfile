FROM framgia/laravel
ADD . /var/www/html
ENV DB_HOST=localhost DB_DATABASE=demo DB_USERNAME=root DB_PASSWORD=root APP_KEY=base64:3Qnvvim9MN5zjCg3M0cy1ATy/qWISiJOldYPIv3hq5g=
RUN service mysql start \
    && mysql -uroot -proot -e "CREATE DATABASE IF NOT EXISTS demo CHARACTER SET utf8;" \
    && chmod -R 777 storage \
    && chmod -R 777 bootstrap/cache \
    && php artisan migrate --force
