--1) Create a User Defined Function to make it easy to do a frequently needed function. Ex. PC parts - Check if parts are compatible based on their socket type.

CREATE FUNCTION getCurrentWeight(@UserID INT)
RETURNS DECIMAL
AS
BEGIN
	DECLARE @weight DECIMAL;
	@weight = (SELECT TOP 1 (ur.weight)
	FROM tblUSER_REPORT ur
		JOIN tblUSERS u ON u.UserID = ur.UserID
	WHERE u.UserID = @UserID
	ORDER BY ur.ReportDate DESC)
RETURN @weight
END
GO

--2) Create a view to see some useful information. Ex. What sales are each month for the past year, how many users are created each month, what hiking trails are used most frequently, etc.

CREATE VIEW findRecentWeightReports
AS
	SELECT u.UserID, u.FName, u.LName, u.weight, u.height
	FROM tblUSERS u
		JOIN tblUSER_REPORT ur ON ur.userID = u.userID
	WHERE (ur.ReportDate - GETDATE()) > 30
GO

--3) Create a stored procedure to insert data into a table in your team's database passing at least two parameters. -- Not necessary to turn in because it was extra credit in class