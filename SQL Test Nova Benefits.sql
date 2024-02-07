USE nova_benefits;
CREATE TABLE Policyholders (
    PolicyholderID INT,
    PolicyholderName VARCHAR(255),
    Relation VARCHAR(255)
);
INSERT INTO Policyholders (PolicyholderID, PolicyholderName, Relation)
VALUES 
    (1, 'Rose', 'Self'),
    (1, 'Rose', 'Spouse'),
    (1, 'Rose', 'Child'),
    (3, 'Tim', 'Self'),
    (3, 'Tim', 'Father'),
    (3, 'Tim', 'Mother'),
    (4, 'Kate', 'Self'),
    (4, 'Kate', 'Spouse'),
    (4, 'Kate', 'Child'),
    (4, 'Kate', 'Child'),
    (6, 'Aaron', 'Self'),
    (6, 'Aaron', 'Father'),
    (6, 'Aaron', 'Spouse'),
    (6, 'Aaron', 'Child'),
    (6, 'Aaron', 'Child');
    CREATE TABLE Claims (
    PolicyholderID INT,
    Relation VARCHAR(255),
    TotalClaims INT
);
INSERT INTO Claims (PolicyholderID, Relation, TotalClaims)
VALUES
    (1, 'Self', 2),
    (1, 'Spouse', 1),
    (1, 'Child', 0),
    (3, 'Self', 0),
    (3, 'Father', 3),
    (3, 'Mother', 2),
    (4, 'Self', 1),
    (4, 'Spouse', 0),
    (4, 'Child', 1),
    (4, 'Child', 2),
    (6, 'Self', 0),
    (6, 'Father', 4),
    (6, 'Spouse', 2),
    (6, 'Child', 0),
    (6, 'Child', 1);
    SELECT 
    ph.PolicyholderID,
    ph.PolicyholderName,
    CASE 
        WHEN ph.Relation = 'Child' THEN CONCAT('Child', ROW_NUMBER() OVER (PARTITION BY ph.PolicyholderID, ph.Relation ORDER BY ph.PolicyholderID))
        ELSE ph.Relation
    END AS Relation,
    SUM(c.TotalClaims) AS TotalClaims,
    SUM(c.TotalClaims) * 50000 AS ClaimValue
FROM 
    Policyholders ph
LEFT JOIN 
    Claims c ON ph.PolicyholderID = c.PolicyholderID
GROUP BY 
    ph.PolicyholderID,
    ph.PolicyholderName,
    ph.Relation;


