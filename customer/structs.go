package main

// https://github.com/harryho/db-samples/blob/master/pgsql/northwind.sql
type Customer struct {
	CustId       int    `json:"cust_id"`
	CompanyName  string `json:"company_name"`
	ContactName  string `json:"contact_name"`
	ContactTitle string `json:"contact_title"`
	Address      string `json:"address"`
	City         string `json:"city"`
	Region       string `json:"region"`
	PostalCode   string `json:"postal_code"`
	Country      string `json:"country"`
	Phone        string `json:"phone"`
	Fax          string `json:"fax"`
}
