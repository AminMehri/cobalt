FROM node:20-alpine

WORKDIR /app

# نصب pnpm
RUN npm install -g pnpm

# کپی کل پروژه (نه فقط api/src)
COPY . .

# رفتن به پوشه مربوط به api
WORKDIR /app/api

# نصب وابستگی‌ها
RUN pnpm install

# ست کردن ENV پیش‌فرض
ENV API_URL=http://localhost:9000/

# اجرای برنامه
CMD ["pnpm", "start"]
