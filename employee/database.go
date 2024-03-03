package main

import (
	"database/sql"
	"fmt"
	"log"
	_ "github.com/lib/pq" // PostgreSQL driver
)

func InsertEmployee(db *sql.DB, employee Employee) error {

	// Prepare the SQL statement with placeholders
	sqlStatement := `
		INSERT INTO Employee (lastname, firstname, title, titleofcourtesy, birthdate, hiredate, address, city, region, postalcode, country, phone, extension, photo, notes, mgrid, photopath)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17)
		RETURNING empid`

	// Execute the SQL statement and retrieve the newly inserted empid
	var empID int
	err := db.QueryRow(sqlStatement,
		employee.LastName, employee.FirstName, employee.Title, employee.TitleOfCourtesy,
		employee.BirthDate, employee.HireDate, employee.Address, employee.City,
		employee.Region, employee.PostalCode, employee.Country, employee.Phone,
		employee.Extension, employee.Photo, employee.Notes, employee.MgrID,
		employee.PhotoPath).Scan(&empID)
	if err != nil {
		return err
	}

	fmt.Printf("New employee inserted with empid: %d\n", empID)
	return nil
}

func UpdateEmployee(db *sql.DB, empID int, updatedEmployee Employee) error {
	// Prepare the SQL statement for updating an employee by empid
	sqlStatement := `
		UPDATE Employee
		SET lastname = $1, firstname = $2, title = $3, titleofcourtesy = $4,
			birthdate = $5, hiredate = $6, address = $7, city = $8,
			region = $9, postalcode = $10, country = $11, phone = $12,
			extension = $13, photo = $14, notes = $15, mgrid = $16,
			photopath = $17
		WHERE empid = $18`

	// Execute the SQL statement
	_, err := db.Exec(sqlStatement,
		updatedEmployee.LastName, updatedEmployee.FirstName, updatedEmployee.Title,
		updatedEmployee.TitleOfCourtesy, updatedEmployee.BirthDate, updatedEmployee.HireDate,
		updatedEmployee.Address, updatedEmployee.City, updatedEmployee.Region,
		updatedEmployee.PostalCode, updatedEmployee.Country, updatedEmployee.Phone,
		updatedEmployee.Extension, updatedEmployee.Photo, updatedEmployee.Notes,
		updatedEmployee.MgrID, updatedEmployee.PhotoPath, empID)
	if err != nil {
		return err
	}

	fmt.Printf("Employee with empid %d has been updated.\n", empID)
	return nil
}

func UpsertEmployee(db *sql.DB, emp Employee) error {
	// Prepare the SQL statement for upsert
	sqlStatement := `
		INSERT INTO Employee (empid, lastname, firstname, title, titleofcourtesy, birthdate, hiredate, address, city, region, postalcode, country, phone, extension, photo, notes, mgrid, photopath)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18)
		ON CONFLICT (empid) DO UPDATE
		SET lastname = EXCLUDED.lastname, firstname = EXCLUDED.firstname, title = EXCLUDED.title, ...`

	// Execute the SQL statement
	_, err := db.Exec(sqlStatement,
		emp.EmpId, emp.LastName, emp.FirstName, emp.Title, emp.TitleOfCourtesy,
		emp.BirthDate, emp.HireDate, emp.Address, emp.City, emp.Region,
		emp.PostalCode, emp.Country, emp.Phone, emp.Extension, emp.Photo,
		emp.Notes, emp.MgrID, emp.PhotoPath)
	if err != nil {
		return err
	}

	fmt.Printf("Employee with empid %d upserted.\n", emp.EmpId)
	return nil
}

func DeleteEmployee(db *sql.DB, empID int) error {
	// Prepare the SQL statement for deleting an employee by empid
	sqlStatement := `
		DELETE FROM Employee
		WHERE empid = $1`

	// Execute the SQL statement
	_, err := db.Exec(sqlStatement, empID)
	if err != nil {
		return err
	}

	fmt.Printf("Employee with empid %d has been deleted.\n", empID)
	return nil
}

func Connect(server string, connectionString string) {
	// Replace with your actual database connection details
	db, err := sql.Open(server, "user=myuser dbname=mydb sslmode=disable")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()
	//return db
}