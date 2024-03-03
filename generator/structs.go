package main

import (
	"database/sql"
)

// https://github.com/harryho/db-samples/blob/master/pgsql/northwind.sql
type Employee struct {
	EmpId           int
	LastName        string
	FirstName       string
	Title           sql.NullString
	TitleOfCourtesy sql.NullString
	BirthDate       sql.NullTime
	HireDate        sql.NullTime
	Address         sql.NullString
	City            sql.NullString
	Region          sql.NullString
	PostalCode      sql.NullString
	Country         sql.NullString
	Phone           sql.NullString
	Extension       sql.NullString
	Photo           []byte
	Notes           sql.NullString
	MgrID           sql.NullInt64
	PhotoPath       sql.NullString
}

type EmployeeGetRequest struct {
	EmpId         string
	CorrelationId string
	ReplyQueue    string
}
