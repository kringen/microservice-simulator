package main

import (
	"database/sql"
)

// https://github.com/harryho/db-samples/blob/master/pgsql/northwind.sql
type Employee struct {
	EmpId           int            `json:"empid"`
	LastName        string         `json:"last_name"`
	FirstName       string         `json:"first_name"`
	Title           sql.NullString `json:"title"`
	TitleOfCourtesy sql.NullString `json:"title_of_courtesy"`
	BirthDate       sql.NullTime   `json:"birth_date"`
	HireDate        sql.NullTime   `json:"hire_date"`
	Address         sql.NullString `json:"address"`
	City            sql.NullString `json:"city"`
	Region          sql.NullString `json:"region"`
	PostalCode      sql.NullString `json:"postal_code"`
	Country         sql.NullString `json:"country"`
	Phone           sql.NullString `json:"phone"`
	Extension       sql.NullString `json:"extension"`
	Photo           []byte         `json:"photo"`
	Notes           sql.NullString `json:"notes"`
	MgrID           sql.NullInt64  `json:"mgr_id"`
	PhotoPath       sql.NullString `json:"photo_path"`
}
