-- CreateTable
CREATE TABLE "accommodations" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "price" TEXT NOT NULL,
    "available_rooms" INTEGER NOT NULL,
    "start_date" DATETIME NOT NULL,
    "end_date" DATETIME NOT NULL,
    "provider_id" INTEGER NOT NULL,
    "event_id" INTEGER,
    CONSTRAINT "accommodations_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "accommodation_companies" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "accommodations_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "events" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "accommodation_companies" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "phone" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "events" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "start_date" DATETIME NOT NULL,
    "end_date" DATETIME NOT NULL,
    "external_url" TEXT NOT NULL,
    "enabled" BOOLEAN NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "steps_config" TEXT NOT NULL DEFAULT '{}',
    CONSTRAINT "events_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customers" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "activities" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "max_attendance" INTEGER NOT NULL,
    "date" DATETIME NOT NULL,
    "enabled" BOOLEAN NOT NULL,
    "event_id" INTEGER,
    "registration_id" INTEGER,
    CONSTRAINT "activities_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "events" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "activities_registration_id_fkey" FOREIGN KEY ("registration_id") REFERENCES "registrations" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "courses" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "max_attendance" INTEGER NOT NULL,
    "registration_id" INTEGER,
    CONSTRAINT "courses_registration_id_fkey" FOREIGN KEY ("registration_id") REFERENCES "registrations" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "courses_on_activities" (
    "activity_id" INTEGER NOT NULL,
    "course_id" INTEGER NOT NULL,

    PRIMARY KEY ("activity_id", "course_id"),
    CONSTRAINT "courses_on_activities_activity_id_fkey" FOREIGN KEY ("activity_id") REFERENCES "activities" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "courses_on_activities_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "courses" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "activity_tiers" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "price" INTEGER NOT NULL,
    "label" TEXT NOT NULL,
    "activity_id" INTEGER,
    CONSTRAINT "activity_tiers_activity_id_fkey" FOREIGN KEY ("activity_id") REFERENCES "activities" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "course_tiers" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "price" INTEGER NOT NULL,
    "label" TEXT NOT NULL,
    "course_id" INTEGER,
    CONSTRAINT "course_tiers_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "courses" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "customers" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "country" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "discounts" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "max_redeems" INTEGER NOT NULL,
    "valid_until" DATETIME,
    "promo_code_id" INTEGER NOT NULL,
    "event_id" INTEGER NOT NULL,
    CONSTRAINT "discounts_promo_code_id_fkey" FOREIGN KEY ("promo_code_id") REFERENCES "promo_codes" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "discounts_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "events" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "promo_codes" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "payments" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "payment_method" TEXT NOT NULL,
    "payment_date" DATETIME NOT NULL,
    "invoice_number" TEXT NOT NULL,
    "status" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "registrations" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "registration_date" DATETIME NOT NULL,
    "total_price" INTEGER NOT NULL,
    "attendee_id" INTEGER NOT NULL,
    "event_id" INTEGER NOT NULL,
    "accommodation_id" INTEGER NOT NULL,
    "transfer_id" INTEGER NOT NULL,
    "dietary_constraint_id" INTEGER NOT NULL,
    "payment_id" INTEGER NOT NULL,
    CONSTRAINT "registrations_attendee_id_fkey" FOREIGN KEY ("attendee_id") REFERENCES "attendees" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "registrations_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "events" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "registrations_accommodation_id_fkey" FOREIGN KEY ("accommodation_id") REFERENCES "accommodations" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "registrations_transfer_id_fkey" FOREIGN KEY ("transfer_id") REFERENCES "transfers" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "registrations_dietary_constraint_id_fkey" FOREIGN KEY ("dietary_constraint_id") REFERENCES "dietary_constraints" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "registrations_payment_id_fkey" FOREIGN KEY ("payment_id") REFERENCES "payments" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "attendees" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "firstname" TEXT NOT NULL,
    "surname" TEXT NOT NULL,
    "id_type" TEXT NOT NULL,
    "id_code" TEXT NOT NULL,
    "birthdate" DATETIME,
    "email" TEXT,
    "phone" TEXT,
    "profession" TEXT,
    "company" TEXT,
    "photo_url" TEXT
);

-- CreateTable
CREATE TABLE "dietary_constraints" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "transfers" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "price" TEXT NOT NULL,
    "available_rooms" INTEGER NOT NULL,
    "departure_date" DATETIME NOT NULL,
    "return_date" DATETIME NOT NULL,
    "provider_id" INTEGER NOT NULL,
    "event_id" INTEGER,
    CONSTRAINT "transfers_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "transfer_companies" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "transfers_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "events" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "transfer_companies" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "phone" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "registrations_dietary_constraint_id_key" ON "registrations"("dietary_constraint_id");

-- CreateIndex
CREATE UNIQUE INDEX "registrations_payment_id_key" ON "registrations"("payment_id");

-- CreateIndex
CREATE UNIQUE INDEX "transfers_provider_id_key" ON "transfers"("provider_id");
