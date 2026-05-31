using { edu.university as my } from '../db/schema';

service UniversityService {
    entity Departments as projection on my.Departments;
    entity Professors  as projection on my.Professors;
    entity Courses     as projection on my.Courses;
    entity Students    as projection on my.Students;
    entity Enrollments as projection on my.Enrollments;
    entity Exams       as projection on my.Exams;
}