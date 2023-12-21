use HairStylistDB
delete HairStyle
go
insert HairStyle(FirstName, LastName, MaritalStatus, PhoneNumber, AppointmentDate, AppointmentType)
select m.FirstName,
m.LastName,
case when m.AgeWonMedal >= 23 then 'Married'
else 'Single' end,
concat(845,'-', m.YearBorn,'-', substring(convert(varchar, m.OlympicYear), 1,3)),
concat(month(CURRENT_TIMESTAMP), '/', day(CURRENT_TIMESTAMP), '/', (m.YearBorn + 10)),
case when m.medal = 'Gold'
then 'ProAddiction'
when m.season = 'Summer' and m.medal <> 'Gold'
then 'HairCut'
when m.AgeWonMedal between 25 and 50 
then 'WigWash'
when m.medal = 'Bronze' and m.Season <> 'Summer'
then 'Keratin'
else 'WigStyle'
end
from RecordKeeperDB.dbo.Medalist m 
where m.SportSubcategory not like '%men''s%'

select * from HairStyle
