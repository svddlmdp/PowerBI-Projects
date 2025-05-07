select * from Bank_Loan_Data

select count(id) as Total_Loan_Applications from Bank_Loan_Data 

select count(id) as MTD_Total_Loan_Applications 
from Bank_Loan_Data
where month(issue_date)= 12 and YEAR(issue_date) = 2021

select count(id) as MTD_Total_Loan_Applications 
from Bank_Loan_Data
where month(issue_date)= 11 and YEAR(issue_date) = 2021

Select SUM(loan_amount) as Total_Funded_Amount 
from Bank_Loan_Data

Select SUM(loan_amount) as MTD_Total_Funded_Amount 
from Bank_Loan_Data
where month(issue_date) = 12 and Year(issue_date) = 2021

Select SUM(loan_amount) as PMTD_Total_Funded_Amount 
from Bank_Loan_Data
where month(issue_date) = 11 and Year(issue_date) = 2021

Select SUM(total_payment) as Total_Amount_Received
from Bank_Loan_Data

Select SUM(total_payment) as MTD_Total_Amount_Received
from Bank_Loan_Data
where month(issue_date) = 12 and Year(issue_date) = 2021

Select SUM(total_payment) as PMTD_Total_Amount_Received 
from Bank_Loan_Data
where month(issue_date) = 11 and Year(issue_date) = 2021

Select Round(avg(int_rate)*100,2 )AS Avg_Interest_Rate 
From Bank_Loan_Data

Select Round(avg(int_rate)*100,2)AS MTD_Avg_Interest_Rate 
From Bank_Loan_Data
where month(issue_date) = 12 and Year(issue_date) = 2021

Select Round(avg(int_rate)*100,2)AS PMTD_Avg_Interest_Rate 
From Bank_Loan_Data
where month(issue_date) = 11 and Year(issue_date) = 2021

Select Round(avg(dti)*100,2 )AS Avg_DTI
From Bank_Loan_Data

Select Round(avg(dti)*100,2 )AS MTD_Avg_DTI
From Bank_Loan_Data
where month(issue_date) = 12 and Year(issue_date) = 2021

Select Round(avg(dti)*100,2 )AS PMTD_Avg_DTI
From Bank_Loan_Data
where month(issue_date) = 11 and Year(issue_date) = 2021

Select (count(case when loan_status = 'Fully Paid' OR loan_status ='current' THEN id END)*100)/
Count(id) as Good_Loan_Percentage From Bank_Loan_Data

Select count(id) as Good_Loan_Applications from Bank_Loan_Data
where loan_status='Fully Paid' or loan_status='Current'

Select Sum(loan_amount) as Good_Loan_Funded_Amount from Bank_Loan_Data
where loan_status='Fully Paid' or loan_status='Current'

Select Sum(total_payment) as Good_Loan_Received_Amount from Bank_Loan_Data
where loan_status='Fully Paid' or loan_status='Current'

Select (count(case when loan_status = 'Charged Off' THEN id END)*100)/
Count(id) as Bad_Loan_Percentage 
From Bank_Loan_Data

Select count(id) as Bad_Loan_Applications 
from Bank_Loan_Data
where loan_status='Charged Off'

Select Sum(loan_amount) as Bad_Loan_Funded_Amount 
from Bank_Loan_Data
where loan_status='Charged Off'

Select Sum(total_payment) as Bad_Loan_Received_Amount 
from Bank_Loan_Data
where loan_status='Charged Off'

SELECT loan_status, COUNT(id) AS LoanCount, SUM(total_payment) AS Total_Amount_Received,
SUM(loan_amount) AS Total_Funded_Amount, AVG(int_rate * 100) AS Interest_Rate,
AVG(dti * 100) AS DTI
FROM bank_loan_data
GROUP BY loan_status

SELECT loan_status, SUM(total_payment) AS MTD_Total_Amount_Received, SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status

SELECT address_state AS State, COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state

SELECT term AS Term, COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount, SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term

SELECT emp_length AS Employee_Length, COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount, SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length

SELECT purpose AS PURPOSE, COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose

SELECT home_ownership AS Home_Ownership, COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount, SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership