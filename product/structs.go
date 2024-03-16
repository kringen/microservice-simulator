package main

import (
	"database/sql"
)

// https://github.com/harryho/db-samples/blob/master/pgsql/northwind.sql
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
