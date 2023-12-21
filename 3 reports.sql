
--Reports:
--1) A list of all clients who's charge is less than $125
select * from HairStyle h
where h.Fee < 125
--2) The average profit earned in the 1990's
select AvgPofit = avg(h.fee)
from HairStyle h
where year(h.AppointmentDate) between 1900 and 1999
--3) The number of patients who's last name has an 'e' or their phone number has a '6' or '7'
select count(*)
from HairStyle h 
where h.LastName like '%e%' or h.PhoneNumber like '%[67]%' 
--4) which month had the most haircuts
select count(*), month(AppointmentDate)
from HairStyle h 
where h.AppointmentType = 'HairCut'
group by month(AppointmentDate)
having count(*) > 1
