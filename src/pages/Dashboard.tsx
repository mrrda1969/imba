import React, { useState, useEffect } from "react";
import { Users, Building2, MapPin, TrendingUp, Image } from "lucide-react";
import { apiService } from "../services/api";
import { LoadingSpinner } from "../components/Common/LoadingSpinner";
import { User, Listing } from "../types";

interface DashboardStats {
  totalUsers: number;
  totalAgencies: number;
  totalListings: number;
  totalImages: number;
  averagePrice: number;
  usersByRole: Record<string, number>;
  recentUsers: User[];
  recentListings: Listing[];
}

export const Dashboard: React.FC = () => {
  const [stats, setStats] = useState<DashboardStats | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    const fetchStats = async () => {
      try {
        const [stats, users, listings] = await Promise.all([
          apiService.getStats(),
          apiService.getUsers(),
          apiService.getListings(),
        ]);
        setStats({
          totalUsers: stats.users,
          totalAgencies: stats.agencies,
          totalListings: stats.listings,
          totalImages: stats.images,
          averagePrice: stats.averagePrice,
          usersByRole: stats.usersByRole,
          recentUsers: users.slice(0, 5),
          recentListings: listings.slice(0, 5),
        });
      } catch (error) {
        setError(`Failed to load dashboard data ${error}`);
      } finally {
        setLoading(false);
      }
    };
    fetchStats();
  }, []);

  if (loading) {
    return (
      <div className="flex items-center justify-center h-64">
        <LoadingSpinner size="lg" />
      </div>
    );
  }

  if (error) {
    return (
      <div className="bg-red-50 border border-red-200 rounded-md p-4">
        <p className="text-sm text-red-600">{error}</p>
      </div>
    );
  }

  const statCards = [
    {
      title: "Total Users",
      value: stats?.totalUsers || 0,
      icon: Users,
      color: "bg-blue-500",
      change: "+12%",
    },
    {
      title: "Total Agencies",
      value: stats?.totalAgencies || 0,
      icon: Building2,
      color: "bg-green-500",
      change: "+8%",
    },
    {
      title: "Total Listings",
      value: stats?.totalListings || 0,
      icon: MapPin,
      color: "bg-purple-500",
      change: "+15%",
    },
    {
      title: "Total Images",
      value: stats?.totalImages || 0,
      icon: Image,
      color: "bg-pink-500",
      change: "",
    },
    {
      title: "Average Price",
      value: stats?.averagePrice
        ? `$${stats.averagePrice.toLocaleString()}`
        : "$0",
      icon: TrendingUp,
      color: "bg-orange-500",
      change: "",
    },
  ];

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold text-gray-900">Dashboard</h1>
        <div className="text-sm text-gray-500">
          Last updated: {new Date().toLocaleString()}
        </div>
      </div>

      {/* Stats Cards */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        {statCards.map((stat, index) => {
          const Icon = stat.icon;
          return (
            <div
              key={index}
              className="bg-white p-6 rounded-lg shadow-sm border"
            >
              <div className="flex items-center justify-between">
                <div>
                  <p className="text-sm font-medium text-gray-600">
                    {stat.title}
                  </p>
                  <p className="text-2xl font-bold text-gray-900">
                    {stat.value}
                  </p>
                </div>
                <div className={`${stat.color} p-3 rounded-lg`}>
                  <Icon className="w-6 h-6 text-white" />
                </div>
              </div>
              <div className="mt-4 flex items-center">
                <span className="text-sm font-medium text-green-600">
                  {stat.change}
                </span>
                <span className="text-sm text-gray-500 ml-2">
                  vs last month
                </span>
              </div>
            </div>
          );
        })}
      </div>

      {/* Users by Role */}
      {stats?.usersByRole && (
        <div className="bg-white p-6 rounded-lg shadow-sm border mt-6">
          <h3 className="text-lg font-semibold text-gray-900 mb-4">
            Users by Role
          </h3>
          <ul>
            {Object.entries(stats.usersByRole).map(([role, count]) => (
              <li key={role} className="text-sm text-gray-700">
                {role}: {count}
              </li>
            ))}
          </ul>
        </div>
      )}

      {/* Recent Activity */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Recent Users */}
        <div className="bg-white p-6 rounded-lg shadow-sm border">
          <h3 className="text-lg font-semibold text-gray-900 mb-4">
            Recent Users
          </h3>
          <div className="space-y-3">
            {stats?.recentUsers.map((user) => (
              <div key={user._id} className="flex items-center space-x-3">
                <div className="w-10 h-10 bg-gray-300 rounded-full flex items-center justify-center">
                  <span className="text-sm font-medium text-gray-700">
                    {user.firstname[0]}
                    {user.lastname[0]}
                  </span>
                </div>
                <div>
                  <p className="text-sm font-medium text-gray-900">
                    {user.firstname} {user.lastname}
                  </p>
                  <p className="text-xs text-gray-500">{user.email}</p>
                </div>
                <div className="ml-auto">
                  <span
                    className={`inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ${
                      user.role === "admin"
                        ? "bg-red-100 text-red-800"
                        : user.role === "agent"
                        ? "bg-blue-100 text-blue-800"
                        : "bg-gray-100 text-gray-800"
                    }`}
                  >
                    {user.role}
                  </span>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Recent Listings */}
        <div className="bg-white p-6 rounded-lg shadow-sm border">
          <h3 className="text-lg font-semibold text-gray-900 mb-4">
            Recent Listings
          </h3>
          <div className="space-y-3">
            {stats?.recentListings.map((listing) => (
              <div
                key={listing._id}
                className="flex items-center justify-between"
              >
                <div>
                  <p className="text-sm font-medium text-gray-900">
                    {listing.title}
                  </p>
                  <p className="text-xs text-gray-500">
                    {listing.suburb}, {listing.city}
                  </p>
                </div>
                <div className="text-right">
                  <p className="text-sm font-medium text-gray-900">
                    ${listing.price.toLocaleString()}
                  </p>
                  <p className="text-xs text-gray-500">
                    {new Date(listing.createdAt).toLocaleDateString()}
                  </p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
};
