--South Africa Criminal Database - 30 SQL Questions (Questions Only) 
--TABLE [Police_Case].[dbo].[south_africa_criminal_database]

--1. Display all records from the CriminalCases table. 

SELECT * 
FROM [Police_Case].[dbo].[south_africa_criminal_database];

--2. Count the total number of cases in the table. 

SELECT COUNT (*) AS Total_Number_of_Cases 
FROM [Police_Case].[dbo].[south_africa_criminal_database];

--3. Count the number of cases in each province. 

SELECT ([Province]),
COUNT ([CaseNumber]) AS No_of_Cases_in_each_province
FROM [Police_Case].[dbo].[south_africa_criminal_database]
GROUP BY [Province];

--4. Retrieve all cases where the crime type is Fraud. 

SELECT * 
FROM [Police_Case].[dbo].[south_africa_criminal_database]
WHERE [CrimeType] = 'Fraud';

--5. Count the number of cases for each crime type. 

SELECT CrimeType,

COUNT(*) AS No_of_cases_for_each_crime
FROM [Police_Case].[dbo].[south_africa_criminal_database]
GROUP BY [CrimeType]
ORDER BY[CrimeType] DESC;

--6. Display all cases classified as High or Critical risk.

SELECT *
FROM [Police_Case].[dbo].[south_africa_criminal_database]
WHERE [RiskLevel] = 'High' OR [RiskLevel] = 'Critical';


--7. Calculate the average Financial Score of all suspects. 

SELECT AVG([FinancialScore]) AS Average_Financial_score_for_all_suspects
FROM [Police_Case].[dbo].[south_africa_criminal_database]

--8. Find the highest Estimated Fraud Amount recorded. 

SELECT MAX ([EstimatedFraudAmount_ZAR]) AS Highest_estimated_fraud_amoount
FROM [Police_Case].[dbo].[south_africa_criminal_database];

--9. Retrieve the top 10 cases with the highest Estimated Fraud Amount. 

SELECT TOP 10
[RecordID],
[EstimatedFraudAmount_ZAR]
FROM [Police_Case].[dbo].[south_africa_criminal_database]
WHERE [EstimatedFraudAmount_ZAR] IS NOT NULL
ORDER BY [EstimatedFraudAmount_ZAR] DESC;

--10. Display all cases where the suspect was arrested. 

SELECT * 
FROM [Police_Case].[dbo].[south_africa_criminal_database]
WHERE [Arrested] = 'YES';

--11. Count how many suspects were arrested versus not arrested. 

SELECT
COUNT(CASE WHEN Arrested = 'YES' THEN 1 END) AS suspects_arrested,
COUNT(CASE WHEN Arrested = 'NO' THEN 1 END) AS suspects_not_arrested
FROM [Police_Case].[dbo].[south_africa_criminal_database];


--12. Count the number of cases associated with each bank. 

SELECT [BankInvolved],
COUNT(*) AS No_of_cases_associated_with_each_bank
FROM [Police_Case].[dbo].[south_africa_criminal_database]
GROUP BY [BankInvolved]
ORDER BY [BankInvolved] DESC; 

--13. Calculate the total Estimated Fraud Amount per province. 

SELECT [Province],
SUM(EstimatedFraudAmount_ZAR) AS total_estimated_fraud_amount
FROM [Police_Case].[dbo].[south_africa_criminal_database]
WHERE [EstimatedFraudAmount_ZAR] IS NOT NULL
GROUP BY [Province]
ORDER BY total_estimated_fraud_amount DESC;

--14. Retrieve all suspects older than 50 years. 

SELECT *
FROM [Police_Case].[dbo].[south_africa_criminal_database]
WHERE Age >= 50
ORDER BY Age ASC;

--15. Calculate the average age of suspects per province. 



--16. Display all cases recorded from 2020 onwards. 

--17. Count how many cases resulted in a Convicted status. 

--18. Retrieve all suspects with more than three previous offenses. 

--19. Show the distribution of cases by Risk Level. 

--20. Calculate the total Estimated Fraud Amount across all cases. 

--21. Identify the province with the highest number of cases. 

--22. Retrieve the youngest suspect in the dataset. 

--23. Retrieve the oldest suspect in the dataset. 

--24. Count the number of cases handled by each investigating officer. 

--25. Calculate the average Estimated Fraud Amount per crime type. 

--26. Display all cases occurring in Gauteng province. 

--27. Retrieve all Fraud cases classified as High risk. 

--28. Count the number of cases per year based on CrimeDate. 

--29. Display all suspects with a Financial Score below 500. 

--30. Identify the most common Crime Type in the dataset. 