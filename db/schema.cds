namespace hospital.management;

// Requirement 2: Reusable types
type Name : String(100);
type Phone : String(20);
type Email : String(255);
type Amount : Decimal(10, 2);
type MedicalNote : String(1000);

// Requirement 3: Enums
type Gender : String enum { Male; Female; Other; }
type BloodGroup : String enum { 
    Ap = 'A+'; An = 'A-'; Bp = 'B+'; Bn = 'B-'; 
    Op = 'O+'; ![On] = 'O-'; ABp = 'AB+'; ABn = 'AB-'; 
};
type AppointmentStatus : String enum { Scheduled; Completed; Cancelled; NoShow; }

// Requirement 4: UUID keys for all entities
entity Departments {
    key ID   : UUID;
    name     : Name;
    floor    : Integer;
    head     : Name; 
    capacity : Integer;
    phone    : Phone;
    isActive : Boolean default true; // Requirement 5: Default value
}

entity Doctors {
    key ID         : UUID;
    firstName      : Name;
    lastName       : Name;
    specialization : String(100);
    qualification  : String(100);
    experience     : Integer;
    fee            : Amount;
    departmentId   : UUID; 
    phone          : Phone;
    email          : Email;
    availableDays  : String(100);
    isActive       : Boolean default true; // Requirement 5: Default value
}

entity Patients {
    key ID           : UUID;
    firstName        : Name;
    lastName         : Name;
    dateOfBirth      : Date;
    gender           : Gender;
    bloodGroup       : BloodGroup;
    phone            : Phone;
    email            : Email;
    address          : String(500);
    emergencyContact : Phone;
    registrationDate : Date;
}

entity Appointments {
    key ID          : UUID;
    patientId       : UUID;
    doctorId        : UUID;
    appointmentDate : Date;
    appointmentTime : Time;
    status          : AppointmentStatus default 'Scheduled'; // Requirement 5: Default value
    reason          : String(500);
    notes           : MedicalNote;
    fee             : Amount;
}

entity MedicalRecords {
    key ID          : UUID;
    patientId       : UUID;
    doctorId        : UUID;
    appointmentId   : UUID;
    diagnosis       : String(500);
    prescription    : String(1000);
    testRecommended : String(500);
    recordDate      : Date;
}