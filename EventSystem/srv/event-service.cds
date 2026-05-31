namespace platform.events;

// Requirement 2: Reusable types
type Email : String(255);
type Phone : String(20);
type Amount : Decimal(10, 2);
type Rating : Integer;
type Name : String(100);
type URL : String(500);

// Requirement 3: Enums
type EventType : String enum { Conference; Workshop; Seminar; Webinar; Meetup; }
type EventStatus : String enum { Draft; Published; Ongoing; Completed; Cancelled; }
type TicketType : String enum { General; VIP; Student; }
type RegistrationStatus : String enum { Confirmed; Cancelled; Waitlisted; Attended; }
type VenueType : String enum { Auditorium; ConferenceHall; Outdoor; Virtual; }

entity Venues {
    key ID          : UUID;
    name            : Name;
    address         : String(255);
    city            : String(100);
    capacity        : Integer;
    type            : VenueType;
    amenities       : String; // comma-separated
    hourlyRate      : Amount;
    contactPerson   : Name;
    phone           : Phone;
    isActive        : Boolean default true;
}

entity Events {
    key ID          : UUID;
    title           : String(200);
    description     : String(1000);
    eventType       : EventType;
    venueId         : UUID;
    startDate       : Date;
    endDate         : Date;
    startTime       : Time;
    endTime         : Time;
    maxAttendees    : Integer;
    registeredCount : Integer default 0; // Requirement 5
    ticketPrice     : Amount;
    status          : EventStatus default 'Draft'; // Requirement 5
    organizerName   : Name;
    organizerEmail  : Email;
    tags            : String; // comma-separated
}

entity Speakers {
    key ID          : UUID;
    name            : Name;
    email           : Email;
    phone           : Phone;
    bio             : String(500);
    company         : String(100);
    designation     : String(100);
    expertise       : String;
    photoUrl        : URL;
    rating          : Rating;
    totalTalks      : Integer;
    isActive        : Boolean default true;
}

// Requirement 4: Composite Key
entity EventSpeakers {
    key eventId     : UUID;
    key speakerId   : UUID;
    topic           : String(200);
    sessionTime     : Time;
    sessionDuration : Integer; // minutes
    roomNumber      : String(20);
}

entity Registrations {
    key ID           : UUID;
    eventId          : UUID;
    attendeeName     : Name;
    attendeeEmail    : Email;
    attendeePhone    : Phone;
    company          : String(100);
    ticketType       : TicketType;
    registrationDate : Date;
    status           : RegistrationStatus default 'Confirmed'; // Requirement 5
    amountPaid       : Amount;
    paymentId        : String(100);
}

entity Feedback {
    key ID           : UUID;
    eventId          : UUID;
    attendeeEmail    : Email;
    overallRating    : Rating; // 1-5
    contentRating    : Rating;
    venueRating      : Rating;
    speakerRating    : Rating;
    comment          : String(500);
    submittedAt      : DateTime;
}