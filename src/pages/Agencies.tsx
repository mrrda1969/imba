import React, { useState, useEffect } from 'react';
import { Plus, Edit, Trash2, Search } from 'lucide-react';
import { apiService } from '../services/api';
import { Agency } from '../types';
import { Button } from '../components/Common/Button';
import { Modal } from '../components/Common/Modal';
import { Table, Column } from '../components/Common/Table';
import { LoadingSpinner } from '../components/Common/LoadingSpinner';

export const Agencies: React.FC = () => {
  const [agencies, setAgencies] = useState<Agency[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [editingAgency, setEditingAgency] = useState<Agency | null>(null);
  const [searchTerm, setSearchTerm] = useState('');
  const [sortKey, setSortKey] = useState<string>('');
  const [sortOrder, setSortOrder] = useState<'asc' | 'desc'>('asc');

  const [formData, setFormData] = useState({
    name: '',
    email: '',
    phone: '',
    whatsapp_number: '',
    address: '',
    primary_suburb: '',
    allowed_suburbs: [] as string[],
    parent_agency_id: ''
  });

  useEffect(() => {
    fetchAgencies();
  }, []);

  const fetchAgencies = async () => {
    try {
      setLoading(true);
      const data = await apiService.getAgencies();
      setAgencies(data);
    } catch (error) {
      setError('Failed to fetch agencies');
    } finally {
      setLoading(false);
    }
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      const submitData = {
        ...formData,
        parent_agency_id: formData.parent_agency_id || undefined
      };

      if (editingAgency) {
        const updatedAgency = await apiService.updateAgency(editingAgency._id, submitData);
        setAgencies(agencies.map(agency => agency._id === editingAgency._id ? updatedAgency : agency));
      } else {
        const newAgency = await apiService.createAgency(submitData);
        setAgencies([...agencies, newAgency]);
      }
      setIsModalOpen(false);
      resetForm();
    } catch (error) {
      setError('Failed to save agency');
    }
  };

  const handleEdit = (agency: Agency) => {
    setEditingAgency(agency);
    setFormData({
      name: agency.name,
      email: agency.email,
      phone: agency.phone || '',
      whatsapp_number: agency.whatsapp_number || '',
      address: agency.address || '',
      primary_suburb: agency.primary_suburb || '',
      allowed_suburbs: agency.allowed_suburbs || [],
      parent_agency_id: agency.parent_agency_id || ''
    });
    setIsModalOpen(true);
  };

  const handleDelete = async (agencyId: string) => {
    if (window.confirm('Are you sure you want to delete this agency?')) {
      try {
        await apiService.deleteAgency(agencyId);
        setAgencies(agencies.filter(agency => agency._id !== agencyId));
      } catch (error) {
        setError('Failed to delete agency');
      }
    }
  };

  const resetForm = () => {
    setFormData({
      name: '',
      email: '',
      phone: '',
      whatsapp_number: '',
      address: '',
      primary_suburb: '',
      allowed_suburbs: [],
      parent_agency_id: ''
    });
    setEditingAgency(null);
  };

  const handleSort = (key: string) => {
    if (sortKey === key) {
      setSortOrder(sortOrder === 'asc' ? 'desc' : 'asc');
    } else {
      setSortKey(key);
      setSortOrder('asc');
    }
  };

  const filteredAgencies = agencies.filter(agency =>
    agency.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    agency.email.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const sortedAgencies = [...filteredAgencies].sort((a, b) => {
    if (!sortKey) return 0;
    
    const aValue = a[sortKey as keyof Agency];
    const bValue = b[sortKey as keyof Agency];
    
    if (aValue < bValue) return sortOrder === 'asc' ? -1 : 1;
    if (aValue > bValue) return sortOrder === 'asc' ? 1 : -1;
    return 0;
  });

  const columns: Column<Agency>[] = [
    {
      key: 'name',
      label: 'Name',
      sortable: true,
      render: (agency) => (
        <div>
          <p className="text-sm font-medium text-gray-900">{agency.name}</p>
          <p className="text-xs text-gray-500">{agency.email}</p>
        </div>
      )
    },
    {
      key: 'phone',
      label: 'Contact',
      render: (agency) => (
        <div>
          <p className="text-sm text-gray-900">{agency.phone || '-'}</p>
          {agency.whatsapp_number && (
            <p className="text-xs text-gray-500">WhatsApp: {agency.whatsapp_number}</p>
          )}
        </div>
      )
    },
    {
      key: 'primary_suburb',
      label: 'Primary Suburb',
      render: (agency) => agency.primary_suburb || '-'
    },
    {
      key: 'allowed_suburbs',
      label: 'Allowed Suburbs',
      render: (agency) => (
        <div className="max-w-48">
          {agency.allowed_suburbs.length > 0 ? (
            <div className="flex flex-wrap gap-1">
              {agency.allowed_suburbs.slice(0, 3).map((suburb, index) => (
                <span key={index} className="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-blue-100 text-blue-800">
                  {suburb}
                </span>
              ))}
              {agency.allowed_suburbs.length > 3 && (
                <span className="text-xs text-gray-500">+{agency.allowed_suburbs.length - 3} more</span>
              )}
            </div>
          ) : (
            '-'
          )}
        </div>
      )
    },
    {
      key: 'actions',
      label: 'Actions',
      render: (agency) => (
        <div className="flex space-x-2">
          <Button
            variant="secondary"
            size="sm"
            onClick={() => handleEdit(agency)}
          >
            <Edit className="w-4 h-4" />
          </Button>
          <Button
            variant="danger"
            size="sm"
            onClick={() => handleDelete(agency._id)}
          >
            <Trash2 className="w-4 h-4" />
          </Button>
        </div>
      )
    }
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
        <h1 className="text-2xl font-bold text-gray-900">Agencies</h1>
        <Button onClick={() => setIsModalOpen(true)}>
          <Plus className="w-4 h-4 mr-2" />
          Add Agency
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
                placeholder="Search agencies..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                className="pl-10 pr-4 py-2 w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
              />
            </div>
          </div>
        </div>

        <Table
          data={sortedAgencies}
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
        title={editingAgency ? 'Edit Agency' : 'Add New Agency'}
        maxWidth="lg"
      >
        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Agency Name
            </label>
            <input
              type="text"
              required
              value={formData.name}
              onChange={(e) => setFormData({ ...formData, name: e.target.value })}
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Email
              </label>
              <input
                type="email"
                required
                value={formData.email}
                onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Phone
              </label>
              <input
                type="tel"
                value={formData.phone}
                onChange={(e) => setFormData({ ...formData, phone: e.target.value })}
                className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              WhatsApp Number
            </label>
            <input
              type="tel"
              value={formData.whatsapp_number}
              onChange={(e) => setFormData({ ...formData, whatsapp_number: e.target.value })}
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Address
            </label>
            <textarea
              value={formData.address}
              onChange={(e) => setFormData({ ...formData, address: e.target.value })}
              rows={3}
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Primary Suburb
            </label>
            <input
              type="text"
              value={formData.primary_suburb}
              onChange={(e) => setFormData({ ...formData, primary_suburb: e.target.value })}
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Allowed Suburbs (comma-separated)
            </label>
            <input
              type="text"
              value={formData.allowed_suburbs.join(', ')}
              onChange={(e) => setFormData({ 
                ...formData, 
                allowed_suburbs: e.target.value.split(',').map(s => s.trim()).filter(s => s)
              })}
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
              placeholder="Enter suburbs separated by commas"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Parent Agency
            </label>
            <select
              value={formData.parent_agency_id}
              onChange={(e) => setFormData({ ...formData, parent_agency_id: e.target.value })}
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
              <option value="">Select parent agency (optional)</option>
              {agencies
                .filter(agency => agency._id !== editingAgency?._id)
                .map(agency => (
                  <option key={agency._id} value={agency._id}>
                    {agency.name}
                  </option>
                ))}
            </select>
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
              {editingAgency ? 'Update' : 'Create'} Agency
            </Button>
          </div>
        </form>
      </Modal>
    </div>
  );
};