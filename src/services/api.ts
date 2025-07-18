import axios, { AxiosInstance } from "axios";
import { User, Agency, Listing, AuthResponse } from "../types";

const API_BASE_URL =
  import.meta.env.VITE_API_BASE_URL || "http://localhost:3000";

interface StatsResponse {
  users: number;
  agencies: number;
  listings: number;
  images: number;
  averagePrice: number;
  usersByRole: Record<string, number>;
}

class ApiService {
  private api: AxiosInstance;

  constructor() {
    this.api = axios.create({
      baseURL: API_BASE_URL,
      headers: {
        "Content-Type": "application/json",
      },
    });

    this.setupInterceptors();
  }

  private setupInterceptors() {
    this.api.interceptors.request.use((config) => {
      const token = localStorage.getItem("token");
      if (token) {
        config.headers.Authorization = `Bearer ${token}`;
      }
      return config;
    });

    this.api.interceptors.response.use(
      (response) => response,
      async (error) => {
        if (error.response?.status === 401) {
          localStorage.removeItem("token");
          localStorage.removeItem("user");
          window.location.href = "/login";
        }
        return Promise.reject(error);
      }
    );
  }

  // Auth endpoints
  async login(email: string, password: string): Promise<AuthResponse> {
    const response = await this.api.post<AuthResponse>("/api/auth/login", {
      email,
      password,
    });
    return response.data;
  }

  async register(
    userData: Omit<User, "_id" | "createdAt" | "updatedAt"> & {
      password: string;
    }
  ): Promise<AuthResponse> {
    const response = await this.api.post<AuthResponse>(
      "/api/auth/register",
      userData
    );
    return response.data;
  }

  async getProfile(): Promise<User> {
    const response = await this.api.get("/api/auth/profile");
    return response.data.user;
  }

  async updateProfile(userData: Partial<User>): Promise<User> {
    const response = await this.api.put<User>("/api/auth/profile", userData);
    return response.data;
  }

  async changePassword(
    currentPassword: string,
    newPassword: string
  ): Promise<void> {
    await this.api.put("/api/auth/change-password", {
      currentPassword,
      newPassword,
    });
  }

  async logout(): Promise<void> {
    await this.api.post("/api/auth/logout");
  }

  // Users endpoints
  async getUsers(): Promise<User[]> {
    const response = await this.api.get("/api/users");
    return response.data.users;
  }

  async getUserById(id: string): Promise<User> {
    const response = await this.api.get<User>(`/api/users/${id}`);
    return response.data;
  }

  async createUser(
    userData: Omit<User, "_id" | "createdAt" | "updatedAt"> & {
      password: string;
    }
  ): Promise<User> {
    const response = await this.api.post<User>("/api/users", userData);
    return response.data;
  }

  async updateUser(id: string, userData: Partial<User>): Promise<User> {
    const response = await this.api.put<User>(`/api/users/${id}`, userData);
    return response.data;
  }

  async deleteUser(id: string): Promise<void> {
    await this.api.delete(`/api/users/${id}`);
  }

  // Agencies endpoints
  async getAgencies(): Promise<Agency[]> {
    const response = await this.api.get("/api/agencies");
    return response.data.agencies;
  }

  async getAgencyById(id: string): Promise<Agency> {
    const response = await this.api.get<Agency>(`/api/agencies/${id}`);
    return response.data;
  }

  async createAgency(
    agencyData: Omit<Agency, "_id" | "createdAt" | "updatedAt">
  ): Promise<Agency> {
    const response = await this.api.post<Agency>("/api/agencies", agencyData);
    return response.data;
  }

  async updateAgency(id: string, agencyData: Partial<Agency>): Promise<Agency> {
    const response = await this.api.put<Agency>(
      `/api/agencies/${id}`,
      agencyData
    );
    return response.data;
  }

  async deleteAgency(id: string): Promise<void> {
    await this.api.delete(`/api/agencies/${id}`);
  }

  async getChildAgencies(id: string): Promise<Agency[]> {
    const response = await this.api.get<Agency[]>(
      `/api/agencies/${id}/children`
    );
    return response.data;
  }

  // Listings endpoints
  async getListings(): Promise<Listing[]> {
    const response = await this.api.get("/api/listings");
    return response.data.listings;
  }

  async getListingById(id: string): Promise<Listing> {
    const response = await this.api.get<Listing>(`/api/listings/${id}`);
    return response.data;
  }

  async createListing(
    listingData: Omit<Listing, "_id" | "createdAt" | "updatedAt">
  ): Promise<Listing> {
    const response = await this.api.post<Listing>("/api/listings", listingData);
    return response.data;
  }

  async updateListing(
    id: string,
    listingData: Partial<Listing>
  ): Promise<Listing> {
    const response = await this.api.put<Listing>(
      `/api/listings/${id}`,
      listingData
    );
    return response.data;
  }

  async getListingsByAgent(agentId: string): Promise<Listing[]> {
    const response = await this.api.get<Listing[]>(
      `/api/listings/agent/${agentId}`
    );
    return response.data;
  }

  async getListingsByAgency(agencyId: string): Promise<Listing[]> {
    const response = await this.api.get<Listing[]>(
      `/api/listings/agency/${agencyId}`
    );
    return response.data;
  }

  async getMyListings(): Promise<Listing[]> {
    const response = await this.api.get<Listing[]>("/api/listings/my-listings");
    return response.data;
  }

  async getStats(): Promise<StatsResponse> {
    const response = await this.api.get<StatsResponse>("/api/stats");
    return response.data;
  }
}

export const apiService = new ApiService();
