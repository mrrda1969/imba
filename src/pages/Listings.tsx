import React, { useState, useEffect } from "react";
import { Plus, Edit, Search, Filter } from "lucide-react";
import { apiService } from "../services/api";
import { Listing, User, Agency } from "../types";
import { Button } from "../components/Common/Button";
import { Modal } from "../components/Common/Modal";
import { Table, Column } from "../components/Common/Table";
import { LoadingSpinner } from "../components/Common/LoadingSpinner";

export const Listings: React.FC = () => {
  const [listings, setListings] = useState<Listing[]>([]);
  const [users, setUsers] = useState<User[]>([]);
  const [agencies, setAgencies] = useState<Agency[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [editingListing, setEditingListing] = useState<Listing | null>(null);
  const [searchTerm, setSearchTerm] = useState("");
  const [sortKey, setSortKey] = useState<string>("");
  const [sortOrder, setSortOrder] = useState<"asc" | "desc">("asc");

  const [formData, setFormData] = useState({
    title: "",
    city: "",
    suburb: "",
    price: "",
    listing_agent: "",
    listing_agency: "",
    description: "",
    images: "",
  });

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    try {
      setLoading(true);
      const [listingsData, usersData, agenciesData] = await Promise.all([
        apiService.getListings(),
        apiService.getUsers(),
        apiService.getAgencies(),
      ]);
      setListings(listingsData);
      setUsers(usersData);
      setAgencies(agenciesData);
    } catch (error) {
      setError(`Failed to fetch data ${error}`);
    } finally {
      setLoading(false);
    }
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      const submitData = {
        ...formData,
        price: parseFloat(formData.price),
      };

      if (editingListing) {
        const updatedListing = await apiService.updateListing(
          editingListing._id,
          submitData
        );
        setListings(
          listings.map((listing) =>
            listing._id === editingListing._id ? updatedListing : listing
          )
        );
      } else {
        const newListing = await apiService.createListing(submitData);
        setListings([...listings, newListing]);
      }
      setIsModalOpen(false);
      resetForm();
    } catch (error) {
      setError(`Failed to save listing ${error}`);
    }
  };

  const handleEdit = (listing: Listing) => {
    setEditingListing(listing);
    setFormData({
      title: listing.title,
      city: listing.city,
      suburb: listing.suburb,
      price: listing.price.toString(),
      listing_agent:
        typeof listing.listing_agent === "string"
          ? listing.listing_agent
          : listing.listing_agent._id,
      listing_agency:
        typeof listing.listing_agency === "string"
          ? listing.listing_agency
          : listing.listing_agency._id,
      description: listing.description || "",
      images: listing.images || "",
    });
    setIsModalOpen(true);
  };

  const resetForm = () => {
    setFormData({
      title: "",
      city: "",
      suburb: "",
      price: "",
      listing_agent: "",
      listing_agency: "",
      description: "",
      images: "",
    });
    setEditingListing(null);
  };

  const handleSort = (key: string) => {
    if (sortKey === key) {
      setSortOrder(sortOrder === "asc" ? "desc" : "asc");
    } else {
      setSortKey(key);
      setSortOrder("asc");
    }
  };

  const filteredListings = listings.filter(
    (listing) =>
      listing.title.toLowerCase().includes(searchTerm.toLowerCase()) ||
      listing.city.toLowerCase().includes(searchTerm.toLowerCase()) ||
      listing.suburb.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const sortedListings = [...filteredListings].sort((a, b) => {
    if (!sortKey) return 0;

    const aValue = a[sortKey as keyof Listing];
    const bValue = b[sortKey as keyof Listing];

    if (aValue === undefined) return 1;
    if (bValue === undefined) return -1;
    if (aValue < bValue) return sortOrder === "asc" ? -1 : 1;
    if (aValue > bValue) return sortOrder === "asc" ? 1 : -1;
    return 0;
  });

  const getAgentName = (agent: string | User) => {
    if (typeof agent === "string") {
      const userObj = users.find((u) => u._id === agent);
      return userObj ? `${userObj.firstname} ${userObj.lastname}` : "Unknown";
    }
    return `${agent.firstname} ${agent.lastname}`;
  };

  const getAgencyName = (agency: string | Agency) => {
    if (typeof agency === "string") {
      const agencyObj = agencies.find((a) => a._id === agency);
      return agencyObj ? agencyObj.name : "Unknown";
    }
    return agency.name;
  };

  const columns: Column<Listing>[] = [
    {
      key: "title",
      label: "Title",
      sortable: true,
      render: (listing) => (
        <div>
          <p className="text-sm font-medium text-gray-900">{listing.title}</p>
          <p className="text-xs text-gray-500">
            {listing.suburb}, {listing.city}
          </p>
        </div>
      ),
    },
    {
      key: "price",
      label: "Price",
      sortable: true,
      render: (listing) => (
        <span className="text-sm font-medium text-gray-900">
          ${listing.price.toLocaleString()}
        </span>
      ),
    },
    {
      key: "listing_agent",
      label: "Agent",
      render: (listing) => (
        <span className="text-sm text-gray-900">
          {getAgentName(listing.listing_agent)}
        </span>
      ),
    },
    {
      key: "listing_agency",
      label: "Agency",
      render: (listing) => (
        <span className="text-sm text-gray-900">
          {getAgencyName(listing.listing_agency)}
        </span>
      ),
    },
    {
      key: "createdAt",
      label: "Created",
      sortable: true,
      render: (listing) => (
        <span className="text-sm text-gray-500">
          {new Date(listing.createdAt).toLocaleDateString()}
        </span>
      ),
    },
    {
      key: "actions",
      label: "Actions",
      render: (listing) => (
        <div className="flex space-x-2">
          <Button
            variant="secondary"
            size="sm"
            onClick={() => handleEdit(listing)}
          >
            <Edit className="w-4 h-4" />
          </Button>
        </div>
      ),
    },
  ];

  if (loading) {
    return (
      <div className="flex items-center justify-center h-64">
        <LoadingSpinner size="lg" />
      </div>
    );
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold text-gray-900">Listings</h1>
        <Button onClick={() => setIsModalOpen(true)}>
          <Plus className="w-4 h-4 mr-2" />
          Add Listing
        </Button>
      </div>

      {error && (
        <div className="bg-red-50 border border-red-200 rounded-md p-4">
          <p className="text-sm text-red-600">{error}</p>
        </div>
      )}

      <div className="bg-white shadow-sm rounded-lg">
        <div className="p-6 border-b">
          <div className="flex items-center space-x-4">
            <div className="relative flex-1">
              <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 w-4 h-4 text-gray-400" />
              <input
                type="text"
                placeholder="Search listings..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                className="pl-10 pr-4 py-2 w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
              />
            </div>
            <Button variant="secondary" size="sm">
              <Filter className="w-4 h-4 mr-2" />
              Filter
            </Button>
          </div>
        </div>

        <Table
          data={sortedListings}
          columns={columns}
          sortKey={sortKey}
          sortOrder={sortOrder}
          onSort={handleSort}
        />
      </div>

      <Modal
        isOpen={isModalOpen}
        onClose={() => {
          setIsModalOpen(false);
          resetForm();
        }}
        title={editingListing ? "Edit Listing" : "Add New Listing"}
        maxWidth="lg"
      >
        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Title
            </label>
            <input
              type="text"
              required
              value={formData.title}
              onChange={(e) =>
                setFormData({ ...formData, title: e.target.value })
              }
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                City
              </label>
              <input
                type="text"
                required
                value={formData.city}
                onChange={(e) =>
                  setFormData({ ...formData, city: e.target.value })
                }
                className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Suburb
              </label>
              <input
                type="text"
                required
                value={formData.suburb}
                onChange={(e) =>
                  setFormData({ ...formData, suburb: e.target.value })
                }
                className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Price
            </label>
            <input
              type="number"
              min={0}
              required
              value={formData.price}
              onChange={(e) =>
                setFormData({ ...formData, price: e.target.value })
              }
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Listing Agent
              </label>
              <select
                required
                value={formData.listing_agent}
                onChange={(e) =>
                  setFormData({ ...formData, listing_agent: e.target.value })
                }
                className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
              >
                <option value="">Select agent</option>
                {users
                  .filter(
                    (user) => user.role === "agent" || user.role === "admin"
                  )
                  .map((user) => (
                    <option key={user._id} value={user._id}>
                      {user.firstname} {user.lastname}
                    </option>
                  ))}
              </select>
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Listing Agency
              </label>
              <select
                required
                value={formData.listing_agency}
                onChange={(e) =>
                  setFormData({ ...formData, listing_agency: e.target.value })
                }
                className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
              >
                <option value="">Select agency</option>
                {agencies.map((agency) => (
                  <option key={agency._id} value={agency._id}>
                    {agency.name}
                  </option>
                ))}
              </select>
            </div>
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Description
            </label>
            <textarea
              value={formData.description}
              onChange={(e) =>
                setFormData({ ...formData, description: e.target.value })
              }
              rows={4}
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Images (URLs)
            </label>
            <input
              type="text"
              value={formData.images}
              onChange={(e) =>
                setFormData({ ...formData, images: e.target.value })
              }
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
              placeholder="Enter image URLs separated by commas"
            />
          </div>

          <div className="flex justify-end space-x-3 pt-4">
            <Button
              type="button"
              variant="secondary"
              onClick={() => {
                setIsModalOpen(false);
                resetForm();
              }}
            >
              Cancel
            </Button>
            <Button type="submit">
              {editingListing ? "Update" : "Create"} Listing
            </Button>
          </div>
        </form>
      </Modal>
    </div>
  );
};
