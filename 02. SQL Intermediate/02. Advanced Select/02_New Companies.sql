SELECT company_code, founder,
       (SELECT COUNT(DISTINCT lead_manager_code) FROM Lead_Manager WHERE company_code = C.company_code),
       (SELECT COUNT(DISTINCT senior_manager_code) FROM Senior_Manager WHERE company_code = C.company_code),
       (SELECT COUNT(DISTINCT manager_code) FROM Manager WHERE company_code = C.company_code),
       (SELECT COUNT(DISTINCT employee_code) FROM Employee WHERE company_code = C.company_code)
FROM Company AS C
