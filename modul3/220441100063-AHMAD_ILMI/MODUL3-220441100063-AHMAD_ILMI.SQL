DELIMITER //

CREATE PROCEDURE sp_GetEmployeeByID (
    IN EmployeeID INT
)
BEGIN
    SELECT * FROM Employees WHERE EmployeeID = EmployeeID;
END //

DELIMITER ;

CREATE PROCEDURE sp_GetTotalEmployees
    @TotalEmployees INT OUTPUT
AS
BEGIN
    SELECT @TotalEmployees = COUNT(*) FROM Employees;
END

CREATE PROCEDURE sp_GetEmployeeCountInRange
    @MinSalary DECIMAL(10, 2),
    @MaxSalary DECIMAL(10, 2),
    @EmployeeCount INT OUTPUT
AS
BEGIN
    SELECT @EmployeeCount = COUNT(*) FROM Employees WHERE Salary BETWEEN @MinSalary AND @MaxSalary;
END

CREATE PROCEDURE sp_InsertEmployee
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Salary DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO Employees (FirstName, LastName, Salary)
    VALUES (@FirstName, @LastName, @Salary);
END

CREATE PROCEDURE sp_UpdateEmployeeSalary
    @EmployeeID INT,
    @NewSalary DECIMAL(10, 2)
AS
BEGIN
    UPDATE Employees SET Salary = @NewSalary WHERE EmployeeID = @EmployeeID;
END

CREATE PROCEDURE sp_DeleteEmployee
    @EmployeeID INT
AS
BEGIN
    DELETE FROM Employees WHERE EmployeeID = @EmployeeID;
END

 
