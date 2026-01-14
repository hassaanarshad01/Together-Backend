# 🔐 Together — Backend

**Together** is a private web application designed for couples to securely store, manage, and grow their shared life in one digital space.

This repository contains the **backend API and data layer** responsible for authentication, encrypted communication, and persistent storage of shared memories, plans, budgets, and media.

The backend is built with a strong focus on **privacy, relational integrity, and long-term trust**.

---

## 🧠 Core Responsibilities

- 🔑 **Authentication & Authorization**
  - Secure user access
  - Relationship-bound data isolation (two users per shared space)

- 💬 **Encrypted Messaging**
  - Private messaging system designed for couples
  - End-to-end encryption handled at the application layer

- 🗂 **Structured Data Storage**
  - Memories, plans, budgets, dates, and custom categories
  - Image and media metadata management

- 🧱 **Relational Integrity**
  - Strong relational schema enforced by Prisma
  - Safe migrations and schema evolution

---

## 🧱 Tech Stack (Backend)

- **Node.js**
- **Express.js**
- **PostgreSQL**
- **Prisma ORM**
- RESTful API architecture

---

## 🗄 Database Design Philosophy

- Each couple exists within a **shared relational boundary**
- Data is:
  - Scoped
  - Isolated
  - Non-accessible outside the relationship
- PostgreSQL ensures durability and consistency
- Prisma ensures type safety and migration reliability

---

## 🚀 Getting Started (Local Development)

### 1️⃣ Clone the repository
```bash
git clone https://github.com/your-username/together-backend.git
cd together-backend
```

### 2️⃣ Install dependencies
```bash
npm install
```

### 3️⃣ Configure environment variables

Create a `.env` file in the project root:
```env
DATABASE_URL="postgresql://app_user:password@localhost:5432/myapp_dev?schema=public"
```

Ensure PostgreSQL is running and the database exists before continuing.

### 4️⃣ Prisma Setup

Generate Prisma Client:
```bash
npx prisma generate
```

Apply database migrations:
```bash
npx prisma migrate dev --name init
```

### 5️⃣ Start the server
```bash
npm run dev
```

The backend server will be available at the specified port.

---

## 🔍 Prisma Studio (Optional)

To inspect and manage data visually:
```bash
npx prisma studio
```

---

## 🛡 Security Notes

- `.env` files are ignored and must never be committed
- Database credentials remain local
- Messaging encryption logic lives at the application layer
- Prisma migrations should always be committed

---

## 🧪 Development Notes

- After any schema change, regenerate Prisma Client:
```bash
npx prisma generate
```

- For development-only resets:
```bash
npx prisma migrate reset
```

---

## 🖤 Philosophy

Together is built around trust, permanence, and intimacy.

The backend is intentionally quiet and strict — data is relational, scoped, encrypted, and protected by design.

No feeds. No exposure. No surveillance.

Just two people and their shared world.

---

## 📄 License

Private project. All rights reserved.