import type { ColumnType, GeneratedAlways } from 'kysely';
export type Generated<T> = T extends ColumnType<infer S, infer I, infer U>
  ? ColumnType<S, I | undefined, U>
  : ColumnType<T, T | undefined, T>;
export type Timestamp = ColumnType<Date, Date | string, Date | string>;

export type Accommodation = {
  id: GeneratedAlways<number>;
  name: string;
  description: string;
  price: string;
  availableRooms: number;
  startDate: string;
  endDate: string;
  providerId: number;
  eventId: number | null;
};
export type AccommodationCompany = {
  id: GeneratedAlways<number>;
  name: string;
  address: string;
  city: string;
  state: string;
  country: string;
  phone: string;
};
export type Activity = {
  id: GeneratedAlways<number>;
  name: string;
  description: string;
  maxAttendance: number;
  date: string;
  enabled: number;
  eventId: number | null;
  registrationId: number | null;
};
export type ActivityTier = {
  id: GeneratedAlways<number>;
  price: number;
  label: string;
  activityId: number | null;
};
export type Attendee = {
  id: GeneratedAlways<number>;
  username: string;
  password: string;
  firstname: string;
  surname: string;
  idType: string;
  idCode: string;
  birthdate: string | null;
  email: string | null;
  phone: string | null;
  profession: string | null;
  company: string | null;
  photoUrl: string | null;
};
export type Course = {
  id: GeneratedAlways<number>;
  name: string;
  description: string;
  maxAttendance: number;
  registrationId: number | null;
};
export type CourseOnActivity = {
  activityId: number;
  courseId: number;
};
export type CourseTier = {
  id: GeneratedAlways<number>;
  price: number;
  label: string;
  courseId: number | null;
};
export type Customer = {
  id: GeneratedAlways<number>;
  name: string;
  address: string;
  state: string;
  country: string;
};
export type DietaryConstraint = {
  id: GeneratedAlways<number>;
  name: string;
  description: string;
};
export type Discount = {
  id: GeneratedAlways<number>;
  maxRedeems: number;
  validUntil: string | null;
  promoCodeId: number;
  eventId: number;
};
export type Event = {
  id: GeneratedAlways<number>;
  name: string;
  address: string;
  city: string;
  state: string;
  country: string;
  startDate: string;
  endDate: string;
  externalUrl: string;
  enabled: number;
  customerId: number;
  stepsConfig: Generated<string>;
};
export type Payment = {
  id: GeneratedAlways<number>;
  paymentMethod: string;
  paymentDate: string;
  invoiceNumber: string;
  status: string;
};
export type PromoCode = {
  id: GeneratedAlways<number>;
  name: string;
  code: string;
};
export type Registration = {
  id: GeneratedAlways<number>;
  registrationDate: string;
  totalPrice: number;
  attendeeId: number;
  eventId: number;
  accommodationId: number;
  transferId: number;
  dietaryConstraintId: number;
  paymentId: number;
};
export type Transfer = {
  id: GeneratedAlways<number>;
  name: string;
  description: string;
  price: string;
  availableRooms: number;
  departureDate: string;
  returnDate: string;
  providerId: number;
  eventId: number | null;
};
export type TransferCompany = {
  id: GeneratedAlways<number>;
  name: string;
  address: string;
  city: string;
  state: string;
  country: string;
  phone: string;
};
export type DB = {
  accommodationCompanies: AccommodationCompany;
  accommodations: Accommodation;
  activities: Activity;
  activityTiers: ActivityTier;
  attendees: Attendee;
  courseTiers: CourseTier;
  courses: Course;
  coursesOnActivities: CourseOnActivity;
  customers: Customer;
  dietaryConstraints: DietaryConstraint;
  discounts: Discount;
  events: Event;
  payments: Payment;
  promoCodes: PromoCode;
  registrations: Registration;
  transferCompanies: TransferCompany;
  transfers: Transfer;
};
