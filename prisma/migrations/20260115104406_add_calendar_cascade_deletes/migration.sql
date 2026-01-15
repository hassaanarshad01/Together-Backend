-- CreateEnum
CREATE TYPE "Priority" AS ENUM ('LOW', 'MEDIUM', 'HIGH');

-- CreateEnum
CREATE TYPE "PlanType" AS ENUM ('ROMANCE', 'MAINTENANCE', 'SOCIAL', 'HEALTH', 'FINANCE', 'KIDS', 'TRAVEL', 'CAREER', 'OTHER');

-- DropForeignKey
ALTER TABLE "categories" DROP CONSTRAINT "categories_coupleId_fkey";

-- DropForeignKey
ALTER TABLE "posts" DROP CONSTRAINT "posts_coupleId_fkey";

-- DropForeignKey
ALTER TABLE "users" DROP CONSTRAINT "users_coupleId_fkey";

-- DropIndex
DROP INDEX "posts_coupleId_idx";

-- AlterTable
ALTER TABLE "posts" ADD COLUMN     "isCompleted" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "planType" "PlanType" NOT NULL DEFAULT 'ROMANCE',
ADD COLUMN     "priority" "Priority" NOT NULL DEFAULT 'MEDIUM';

-- CreateIndex
CREATE INDEX "posts_planType_idx" ON "posts"("planType");

-- AddForeignKey
ALTER TABLE "categories" ADD CONSTRAINT "categories_coupleId_fkey" FOREIGN KEY ("coupleId") REFERENCES "couples"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_coupleId_fkey" FOREIGN KEY ("coupleId") REFERENCES "couples"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "posts" ADD CONSTRAINT "posts_coupleId_fkey" FOREIGN KEY ("coupleId") REFERENCES "couples"("id") ON DELETE CASCADE ON UPDATE CASCADE;
