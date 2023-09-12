select (e1.firstName ||' ' || e1.lastName) as employee,(e2.firstName || ' ' || e2.lastName) as manager
from employee as e1,employee as e2
where e1.managerId=e2.employeeId

select e.firstName,e.lastName,e.employeeId,e.title,s.salesId 
from employee e
left JOIN sales s
on e.employeeId = s.employeeId
where s.salesId is NULL and e.title like 'S%'

select e.firstName,e.lastName,e.employeeId,strftime('%Y', s.soldDate) AS "Year",
count(s.salesAmount) as sum_of_car 
from employee e
JOIN sales s
on e.employeeId=s.employeeId
GROUP BY e.firstName,e.lastName,e.employeeId,strftime('%Y', s.soldDate)