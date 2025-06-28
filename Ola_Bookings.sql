select* from bookings;

#1. Retrieve all successful bookings:
Create view Successful_Booking as
select * from bookings
where Booking_Status="Success";

#count of successful bookings using view
select count(*) from Successful_Booking;

#Types of vehicle
Select distinct(Vehicle_Type) from bookings;

#2. Find the average ride distance for each vehicle type:
Select Vehicle_Type,avg(Ride_Distance) as Avg from bookings
group by Vehicle_Type;

#3. Get the total number of cancelled rides by customers:
Select count(*) from bookings
where Booking_Status = "Canceled by Customer";

#4. List the top 5 customers who booked the highest number of rides:
Select Customer_ID,count(Booking_ID) as Booking_Count from bookings
group by Customer_Id
Having count(Booking_ID)>1
order by Booking_Count
Desc limit 5;


#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Select count(*) from bookings
where Canceled_Rides_by_Driver = "Personal & car related issue";

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select max(Driver_Ratings) Max_Rating ,Min(Driver_Ratings) Min_Rating from bookings
where Vehicle_Type = "Prime Sedan";

#7. Retrieve all rides where payment was made using UPI:
select * from bookings
where Payment_Method = "UPI";

#Total Bookings via UPI
select count(*) from bookings
where Payment_Method = "UPI";

#8. Find the average customer rating per vehicle type:
select Vehicle_Type,round(avg(Customer_Rating),2) as Avg_Rating from bookings
group by Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully:
select sum(Booking_value) as Total_Value from bookings
Where Booking_Status = "Success";

#10. List all incomplete rides along with the reason:
select * from bookings
where Incomplete_Rides = "Yes";