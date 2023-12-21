use HairStylistDB
drop table if exists dbo.HairStyle
    go 
    create table dbo.HairStyle(
    HairStyleId 
        int not null identity primary key,
    FirstName varchar (20)
        not null 
        constraint ck_FirstName_cannot_be_blank check (FirstName > ''),
    LastName varchar (20)
        not null 
        constraint ck_LastName_cannot_be_blank check (LastName > ''),
    MaritalStatus varchar (8)
        not null 
        constraint ck_MaritalStatus_can_only_be_single_or_married check (MaritalStatus in ('Single', 'Married')),
    PhoneNumber varchar (20)
        not null 
        constraint ck_PhoneNumber_cannot_be_blank check (PhoneNumber > ''),
    AppointmentDate datetime 
        not null
        constraint ck_appointmentdate_cannot_be_future_date check (AppointmentDate < getdate()),     
    AppointmentType varchar (50)
        not null 
        constraint ck_AppointmentType_must_be_Haircut_ProAddiction_Keratin_HairStyle_WigWash_WigStyle 
        check (AppointmentType in ('ProAddiction', 'Haircut', 'Keratin', 'HairStyle' ,'WigWash', 'WigStyle')),
    Fee as case 
        when AppointmentType = 'ProAddiction'
        then 350
        when AppointmentType = 'HairCut'
        then 20
        when AppointmentType = 'Keratin'
        then 400
        when AppointmentType = 'HairStyle'
        then 65
        when AppointmentType = 'WigWash'
        then 50
        when AppointmentType = 'WigStyle'
        then 100
        end persisted) 
