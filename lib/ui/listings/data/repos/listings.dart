import 'package:imba/ui/listings/data/models/image_model.dart';
import 'package:imba/ui/listings/data/models/listing.dart';

final List<Listing> staticListings = [
  Listing(
    id: 'luxury-villa-1',
    title: 'Luxury Family Villa',
    city: 'Harare',
    surburb: 'Borrowdale',
    price: 850000.00,
    listingAgent: 'agent@example.com',
    agencyId: 'agency-1',
    description:
        'Stunning 5-bedroom villa with manicured gardens, swimming pool, and modern amenities. Located in the prestigious Borrowdale Brook area.',
    images: [
      ImageModel(
        id: 'img1',
        url:
            'https://plus.unsplash.com/premium_photo-1687960116957-ab813e1e66e6?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        propertyListingId: 'luxury-villa-1',
      ),
    ],
  ),
  Listing(
    id: 'safari-lodge-1',
    title: 'Executive Family Home',
    city: 'Bulawayo',
    surburb: 'Burnside',
    price: 450000.00,
    listingAgent: 'agent@example.com',
    agencyId: 'agency-2',
    description:
        'Magnificent 4-bedroom home with spacious entertainment area, double garage, and beautiful garden in the sought-after Burnside suburb.',
    images: [
      ImageModel(
        id: 'img2',
        url:
            'https://images.unsplash.com/photo-1480074568708-e7b720bb3f09?q=80&w=2948&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        propertyListingId: 'safari-lodge-1',
      ),
    ],
  ),
  Listing(
    id: 'apartment-1',
    title: 'Modern City Apartment',
    city: 'Harare',
    surburb: 'Avondale',
    price: 200000.00,
    listingAgent: 'agency-1',
    description:
        'Contemporary 3-bedroom apartment in peaceful Avondale, featuring modern finishes, 24/7 security, and close proximity to shopping centers.',
    images: [
      ImageModel(
        id: 'img3',
        url:
            'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?q=80&w=2950&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        propertyListingId: 'apartment-1',
      ),
    ],
  ),
  Listing(
    id: 'coastal-home-1',
    title: 'Family Estate',
    city: 'Bulawayo',
    surburb: 'Hillside',
    price: 550000.00,
    listingAgent: 'agency-2',
    description:
        'Beautiful 4-bedroom family home in tranquil Hillside, featuring a tennis court, swimming pool, and established garden.',
    images: [
      ImageModel(
        id: 'img4',
        url:
            'https://images.unsplash.com/photo-1568605114967-8130f3a36994?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        propertyListingId: 'coastal-home-1',
      ),
    ],
  ),
  Listing(
    id: 'mountain-retreat-1',
    title: 'Luxury Estate',
    city: 'Harare',
    surburb: 'Glen Lorne',
    price: 1200000.00,
    listingAgent: 'agency-1',
    description:
        'Luxurious 6-bedroom estate in Glen Lorne with spectacular views. Features include a wine cellar, home theater, and landscaped gardens.',
    images: [
      ImageModel(
        id: 'img5',
        url:
            'https://plus.unsplash.com/premium_photo-1689609950112-d66095626efb?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        propertyListingId: 'mountain-retreat-1',
      ),
    ],
  ),
];
