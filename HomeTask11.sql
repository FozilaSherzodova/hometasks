create table StrTest(PaymentDetails varchar(max))
insert into StrTest values ('Full Name = Abdullayev Shoxruh Account = 20201123456789790001 CorrAccount = 105USD777132005'),
              ('Full Name = Alimboev Hamid Account = 20001123459872543510 CorrAccount = 110USD000177007')
		
select * from StrTest

select 
SUBSTRING(paymentdetails, 
DATALENGTH('Full Name = '),  --start
(charindex('Account' , paymentdetails) - datalength('Full Name = '))) 
as FullName,

SUBSTRING(paymentdetails,
charindex('Account = ', paymentdetails)+datalength('Account = '),(
CHARINDEX('CorrAccount', paymentdetails)- charindex('Account' , paymentdetails)-datalength('Account = ')
))
as Account,

SUBSTRING(paymentdetails,
CHARINDEX('CorrAccount', paymentdetails)+DATALENGTH('CorrAccount = '),
datalength(PaymentDetails)-CHARINDEX('CorrAccount', paymentdetails)-DATALENGTH('CorrAccount'))
as CorrAccount

from StrTest





