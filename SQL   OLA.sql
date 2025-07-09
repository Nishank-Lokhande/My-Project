create view Successful_Booking as
SELECT * from bookings
where Booking_Status = 'Success'

--1. Retrieve all successful bookings: 
select * from Successful_Booking;

--2. Find the average ride distance for each vehicle type: 
create view ride_distance_for_each_vehicle as
select Vehicle_Type, avg(Ride_Distance) as avg_distance
from bookings
group by Vehicle_Type;

--3. Get the total number of cancelled rides by customers: 
create view cancelled_rides_by_customers as
select count(*) from bookings
where Booking_Status = 'Canceled by Customer';

--4. List the List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
select top 5 Customer_ID, count(Booking_ID) as total_raide
from bookings
group by Customer_ID
order by total_raide desc;

--5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Rides_cancelled_by_Drivers_P_C_Issues as
select count(*) from bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

--6. Find the maximum and minimum driver ratings for Prime Sedan bookings: 
create view Max_Min_Driver_Rating as
select max(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
from bookings where Vehicle_Type = 'Prime Sedan'

--7. Retrieve all rides where payment was made using UPI: 
create view UPI_Payment as
select * from bookings 
where Payment_Method = 'UPI';
--8. Find the average customer rating per vehicle type: 
create view AVG_Cust_Rating as
select Vehicle_Type, avg(Customer_Rating) as avg_customer_rating
from bookings
group by Vehicle_Type;

--9. Calculate the total booking value of rides completed successfully: 
create view total_successful_Ride_value as
select sum(Booking_Value) as total_successful_Ride_value
from bookings 
where Booking_Status = 'Success'


--10. List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Customer_ID, Incomplete_Rides_Reason 
FROM bookings  
WHERE Incomplete_Rides = '1';
