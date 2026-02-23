--South Africa Criminal Database - 30 SQL Questions (Questions Only) 
--TABLE [Police_Case].[dbo].[south_africa_criminal_database]

--1. Display all records from the CriminalCases table. 

SELECT * 
FROM [Police_Case].[dbo].[south_africa_criminal_database];

--2. Count the total number of cases in the table. 

SELECT 
COUNT (*) AS Total_Number_of_Cases 
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

SELECT 
AVG([FinancialScore]) AS Average_Financial_score_for_all_suspects
FROM [Police_Case].[dbo].[south_africa_criminal_database]

--8. Find the highest Estimated Fraud Amount recorded. 

SELECT 
MAX ([EstimatedFraudAmount_ZAR]) AS Highest_estimated_fraud_amoount
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

SELECT [Province],
AVG([Age]) AS Average_age_of_suspects
FROM [Police_Case].[dbo].[south_africa_criminal_database]
WHERE [Age] IS NOT NULL
GROUP BY [Province]
ORDER BY Average_age_of_suspects DESC;

--16. Display all cases recorded from 2020 onwards. 

SELECT *
FROM [Police_Case].[dbo].[south_africa_criminal_database]
WHERE CrimeDate >= '2020-01-01'
ORDER BY CrimeDate ASC;

--17. Count how many cases resulted in a Convicted status. 

SELECT [CaseStatus],
COUNT(*) AS convicted_status
FROM [Police_Case].[dbo].[south_africa_criminal_database]
WHERE [CaseStatus] = 'Convicted'
GROUP BY [CaseStatus];

--18. Retrieve all suspects with more than three previous offenses. 

SELECT *
FROM [Police_Case].[dbo].[south_africa_criminal_database]
WHERE [PreviousOffenses] >= 3
ORDER BY [PreviousOffenses] DESC;

--19. Show the distribution of cases by Risk Level. 

SELECT [RiskLevel],
COUNT (*) AS distribution_of_cases_by_risk_level
FROM [Police_Case].[dbo].[south_africa_criminal_database]
GROUP BY [RiskLevel]
ORDER BY [RiskLevel] DESC;

--20. Calculate the total Estimated Fraud Amount across all cases. 

SELECT
SUM(CAST([EstimatedFraudAmount_ZAR] AS BIGINT)) AS total_Estimated_Fraud_aount
FROM [Police_Case].[dbo].[south_africa_criminal_database];

--21. Identify the province with the highest number of cases. 

SELECT TOP 1 [Province], 
COUNT (*) AS highest_no_cases
FROM [Police_Case].[dbo].[south_africa_criminal_database]
GROUP BY [Province]
ORDER BY highest_no_cases DESC;

--22. Retrieve the youngest suspect in the dataset. 

SELECT TOP 1 *
FROM [Police_Case].[dbo].[south_africa_criminal_database]
ORDER BY [Age] ASC;

--23. Retrieve the oldest suspect in the dataset. 

SELECT TOP 1 *
FROM [Police_Case].[dbo].[south_africa_criminal_database]
ORDER BY [Age] DESC;

--24. Count the number of cases handled by each investigating officer. 

SELECT [InvestigatingOfficer],
COUNT(*) AS No_of_cases_handled_by_investigating_officer
FROM [Police_Case].[dbo].[south_africa_criminal_database]
GROUP BY [InvestigatingOfficer]
ORDER BY [InvestigatingOfficer] DESC; 

--25. Calculate the average Estimated Fraud Amount per crime type. 

SELECT [CrimeType],
AVG([EstimatedFraudAmount_ZAR]) AS Average_Estimated_Fraud_amount_per_crime_type
FROM [Police_Case].[dbo].[south_africa_criminal_database]
WHERE [EstimatedFraudAmount_ZAR] IS NOT NULL
GROUP BY [CrimeType]
ORDER BY Average_Estimated_Fraud_amount_per_crime_type DESC;

--26. Display all cases occurring in Gauteng province. 

SELECT * 
FROM [Police_Case].[dbo].[south_africa_criminal_database]
WHERE [Province] = 'Gauteng'

--27. Retrieve all Fraud cases classified as High risk. 

SELECT *
FROM [Police_Case].[dbo].[south_africa_criminal_database]
WHERE [CrimeType] = 'Fraud' AND [RiskLevel] = 'High';

--28. Count the number of cases per year based on CrimeDate. 

SELECT 
YEAR ([CrimeDate]) AS No_of_cases_per_year,
COUNT(*) AS Total_no_of_cases
FROM [Police_Case].[dbo].[south_africa_criminal_database]
WHERE [CrimeDate] IS NOT NULL
GROUP BY YEAR ([CrimeDate])
ORDER BY No_of_cases_per_year;

--29. Display all suspects with a Financial Score below 500. 

SELECT *
FROM [Police_Case].[dbo].[south_africa_criminal_database]
WHERE [FinancialScore] < 500
ORDER BY [FinancialScore] DESC;

--30. Identify the most common Crime Type in the dataset. 

SELECT TOP 1 [CrimeType],
COUNT (*) AS Most_common_crime_type
FROM [Police_Case].[dbo].[south_africa_criminal_database]
WHERE [CrimeType] IS NOT NULL
GROUP BY [CrimeType]
ORDER BY Most_common_crime_type DESC;