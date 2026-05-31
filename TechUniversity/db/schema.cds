namespace edu.university;

// Requirement 2: Reusable types
type Email : String(255);
type Phone : String(20);
type Percentage : Decimal(5, 2);
type GradePoint : Decimal(3, 2);
type Semester : Integer;

// Requirement 3: Enums
type Designation : String enum { Assistant; Associate; Full; Distinguished; }
type EnrollmentStatus : String enum { Enrolled; Dropped; Completed; }
type Grade : String enum { A; B; C; D; F; }
type ExamType : String enum { Midterm; Final; Quiz; Assignment; }

entity Departments {
    key code        : String(10);
    name            : String(100);
    building        : String(100);
    headProfessor   : String(100);
    establishedYear : Integer;
}

entity Professors {
    key ID          : UUID;
    firstName       : String(100);
    lastName        : String(100);
    email           : Email;
    phone           : Phone;
    departmentCode  : String(10);
    designation     : Designation;
    joinDate        : Date;
    salary          : Decimal(10, 2);
    officeRoom      : String(50);
}

entity Courses {
    key code        : String(20);
    title           : String(100);
    description     : String(1000);
    credits         : Integer;
    maxStudents     : Integer;
    currentEnrolled : Integer default 0; // Requirement 5
    semester        : Semester;
    departmentCode  : String(10);
    professorId     : UUID;
    schedule        : String(100);
    roomNumber      : String(50);
    isActive        : Boolean default true; // Requirement 5
}

entity Students {
    key ID           : UUID;
    rollNumber       : String(20); // Unique
    firstName        : String(100);
    lastName         : String(100);
    email            : Email;
    phone            : Phone;
    dateOfBirth      : Date;
    admissionYear    : Integer;
    currentSemester  : Semester;
    cgpa             : GradePoint;
    departmentCode   : String(10);
    isActive         : Boolean default true; // Requirement 5
}

// Requirement 4: Composite Key
entity Enrollments {
    key studentId    : UUID;
    key courseCode   : String(20);
    enrollmentDate   : Date;
    status           : EnrollmentStatus default 'Enrolled'; // Requirement 5
    grade            : Grade;
    gradePoints      : GradePoint;
    attendancePercent: Percentage;
}

entity Exams {
    key ID           : UUID;
    courseCode       : String(20);
    examType         : ExamType;
    date             : Date;
    maxMarks         : Integer;
    weightagePercent : Percentage;
}