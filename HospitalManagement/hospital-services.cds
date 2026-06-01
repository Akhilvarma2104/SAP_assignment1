using { hospital.management as my } from '../db/schema';

service HospitalService {
    entity Departments as projection on my.Departments;
    entity Doctors     as projection on my.Doctors;
    entity Patients    as projection on my.Patients;
    entity Appointments as projection on my.Appointments;
    entity MedicalRecords as projection on my.MedicalRecords;
}
