/*
  Warnings:

  - You are about to drop the column `category` on the `posts` table. All the data in the column will be lost.
  - Added the required column `categoryId` to the `posts` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "posts_category_idx";

-- AlterTable
ALTER TABLE "posts" DROP COLUMN "category",
ADD COLUMN     "categoryId" TEXT NOT NULL;

-- DropEnum
DROP TYPE "Category";

-- CreateTable
CREATE TABLE "categories" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "isSystem" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "coupleId" TEXT NOT NULL,

    CONSTRAINT "categories_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "categories_coupleId_idx" ON "categories"("coupleId");

-- CreateIndex
CREATE UNIQUE INDEX "categories_coupleId_name_key" ON "categories"("coupleId", "name");

-- CreateIndex
CREATE INDEX "posts_categoryId_idx" ON "posts"("categoryId");

-- AddForeignKey
ALTER TABLE "categories" ADD CONSTRAINT "categories_coupleId_fkey" FOREIGN KEY ("coupleId") REFERENCES "couples"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "posts" ADD CONSTRAINT "posts_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
