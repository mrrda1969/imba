export interface User {
  _id: string;
  firstname: string;
  lastname: string;
  email: string;
  phone?: string;
  role: 'admin' | 'agent' | 'user';
  fullName?: string;
  createdAt: string;
  updatedAt: string;
}

export interface Agency {
  _id: string;
  name: string;
  email: string;
  phone?: string;
  whatsapp_number?: string;
  address?: string;
  primary_suburb?: string;
  allowed_suburbs: string[];
  parent_agency_id?: string;
  logo?: string;
  createdAt: string;
  updatedAt: string;
}

export interface Listing {
  _id: string;
  title: string;
  city: string;
  suburb: string;
  price: number;
  listing_agent: string | User;
  listing_agency: string | Agency;
  description?: string;
  images?: string;
  createdAt: string;
  updatedAt: string;
}

export interface Image {
  _id: string;
  url: string;
  listing_id: string;
  createdAt: string;
  updatedAt: string;
}

export interface AuthResponse {
  token: string;
  user: User;
}

export interface ApiError {
  message: string;
  errors?: Record<string, string>;
}

export interface PaginatedResponse<T> {
  data: T[];
  total: number;
  page: number;
  limit: number;
  totalPages: number;
}