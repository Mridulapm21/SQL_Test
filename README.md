# SQL_Test
This query selects the PolicyholderID, PolicyholderName, and Relation from the Policyholders table. It uses a CASE statement to replace "Child" with "Child1", "Child2", etc. for each policyholder. It then calculates the TotalClaims for each policyholder by summing the TotalClaims from the Claims table. Finally, it calculates the ClaimValue by multiplying the TotalClaims by the assumed claim value of Rs 50000. "ph.PolicyholderID", it means that "PolicyholderID" is a column in the "Policyholders" table, and "ph" is used as a shorthand or alias to refer to the "Policyholders" table in the query.

Aliases are commonly used in SQL to simplify and clarify queries, especially when dealing with multiple tables or when joining tables together. They make the code more readable and concise. Instead of writing the full table name each time you reference a column, you can use an alias to refer to the table by a shorter name.

So, "ph.PolicyholderID" simply means the "PolicyholderID" column from the "Policyholders" table, with "ph" being the alias for "Policyholders".
