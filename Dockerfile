# Use official PHP + Apache image
FROM php:8.2-apache

# Enable Apache mod_rewrite (needed for PHP apps like Laravel too)
RUN a2enmod rewrite

# Install required PHP extensions
RUN docker-php-ext-install pdo_mysql mysqli

# Copy your PHP application code into the container
COPY . /var/www/html/

# Set working directory
WORKDIR /var/www/html/

# Set permissions (optional but good practice)
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]