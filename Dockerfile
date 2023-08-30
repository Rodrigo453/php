FROM php:8.3.0beta3-apache
COPY ./ ./
EXPOSE 3000
CMD ["php", "-S", "0.0.0.0:3000"]
