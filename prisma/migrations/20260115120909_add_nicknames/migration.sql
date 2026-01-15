-- CreateTable
CREATE TABLE "nicknames" (
    "id" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "targetUserId" TEXT NOT NULL,
    "creatorId" TEXT NOT NULL,

    CONSTRAINT "nicknames_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "nicknames_targetUserId_idx" ON "nicknames"("targetUserId");

-- AddForeignKey
ALTER TABLE "nicknames" ADD CONSTRAINT "nicknames_targetUserId_fkey" FOREIGN KEY ("targetUserId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "nicknames" ADD CONSTRAINT "nicknames_creatorId_fkey" FOREIGN KEY ("creatorId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
