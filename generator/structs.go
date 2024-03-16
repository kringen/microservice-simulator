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

type Product struct {
	ProductId       int             `json:"product_id"`
	ProductName     string          `json:"product_name"`
	SupplierId      int             `json:"supplier_id"`
	CategoryId      int             `json:"category_id"`
	QuantityPerUnit sql.NullString  `json:"quantity_per_unit"`
	UnitPrice       sql.NullFloat64 `json:"unit_price"`
	UnitsInStock    int             `json:"units_in_stock"`
	UnitsOnOrder    int             `json:"units_on_order"`
	ReorderLevel    int             `json:"reorder_level"`
	Discontinued    sql.NullBool    `json:"region"`
}
