using { logistics.fleet as my } from '../db/schema';

service LogisticsService {
    entity Vehicles as projection on my.Vehicles;
    entity Drivers  as projection on my.Drivers;
    entity Customers as projection on my.Customers;
    entity Shipments as projection on my.Shipments;
    entity Routes    as projection on my.Routes;
}