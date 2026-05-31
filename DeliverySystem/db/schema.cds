namespace logistics.fleet;

// Requirement 2: Reusable types
type Phone : String(20);
type Email : String(255);
type Amount : Decimal(10, 2);
type Distance : Decimal(10, 2);
type City : String(100);
type Address : String(500);
type Rating : Integer;

// Requirement 3: Enums
type VehicleType : String enum { Bike; Van; Truck; Trailer; }
type FuelType : String enum { Petrol; Diesel; Electric; CNG; }
type VehicleStatus : String enum { Available; OnTrip; Maintenance; Retired; }
type DriverStatus : String enum { Available; OnTrip; OnLeave; }
type ShipmentStatus : String enum { Booked; PickedUp; InTransit; OutForDelivery; Delivered; Failed; }
type PaymentStatus : String enum { Pending; Paid; COD; }
type CustomerTier : String enum { Regular; Premium; Enterprise; }

entity Vehicles {
    key ID             : UUID;
    registrationNumber : String(20);
    type               : VehicleType;
    make               : String(100);
    model              : String(100);
    year               : Integer;
    capacity           : Integer; // kg
    fuelType           : FuelType;
    status             : VehicleStatus default 'Available'; // Requirement 5
    lastServiceDate    : Date;
    mileage            : Integer;
    insuranceExpiry    : Date;
}

entity Drivers {
    key ID             : UUID;
    name               : String(100);
    licenseNumber      : String(50);
    licenseExpiry      : Date;
    phone              : Phone;
    email              : Email;
    experience         : Integer;
    rating             : Rating;
    status             : DriverStatus;
    vehicleId          : UUID;
    joinDate           : Date;
}

entity Customers {
    key ID             : UUID;
    name               : String(100);
    company            : String(100);
    phone              : Phone;
    email              : Email;
    address            : Address;
    city               : City;
    pincode            : String(10);
    gstNumber          : String(15);
    tier               : CustomerTier;
}

entity Shipments {
    key ID             : UUID;
    trackingNumber     : String(30); // e.g., SL-2026-00001
    customerId         : UUID;
    driverId           : UUID;
    vehicleId          : UUID;
    pickupAddress      : Address;
    deliveryAddress    : Address;
    pickupCity         : City;
    deliveryCity       : City;
    weight             : Decimal(10, 2);
    status             : ShipmentStatus default 'Booked'; // Requirement 5
    bookedAt           : DateTime;
    pickedUpAt         : DateTime;
    deliveredAt        : DateTime;
    estimatedDelivery  : Date;
    actualDistance     : Distance;
    charges            : Amount;
    paymentStatus      : PaymentStatus default 'Pending'; // Requirement 5
}

entity Routes {
    key ID             : UUID;
    fromCity           : City;
    toCity             : City;
    distance           : Distance;
    estimatedHours     : Decimal(5, 2);
    tollCharges        : Amount;
    isActive           : Boolean default true;
}