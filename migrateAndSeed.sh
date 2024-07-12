#!/bin/sh
echo "Database is empty. Running migration and seeding."

echo "Running Prisma migrations..."
npx prisma migrate deploy

echo "Migrations completed."

echo "Running Prisma Seed..."
npx prisma db seed

echo "Seed completed."
