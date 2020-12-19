#!/bin/bash

TOKEN="eyJhbGciOiJIUzI1NiJ9.eyJhcGlfa2V5IjoiMjhlOWI2OTI3N2MxY2RjYyIsImlhdCI6MTYwODQwMTIwNSwiZXhwIjoxNjA4NDg3NjA1LCJpc3MiOiJodHRwczovL2RldmFwaS5nb3NwbGFuLmluZm8iLCJhdWQiOiJodHRwczovL2FwaS5nb3NwbGFuLmluZm8vYXBpL3YxIiwianRpIjoiZjg1NzFmNjgtZWU0ZS00ZDEzLTk1YzQtYWU5MzI4NDYyNmQzIn0.AtrCUF4RcLeTI9LktwF6hI2GSKwGY8w2ZwXnHwIZVw4"

curl -H "Content-type: application/json" -H "Authorization: Bearer $TOKEN"  https://fz44.gosplan.info/api/v1/purchases > purchases.json
curl -H "Content-type: application/json" -H "Authorization: Bearer $TOKEN"  https://fz44.gosplan.info/api/v1/notifications > notifications.json
curl -H "Content-type: application/json" -H "Authorization: Bearer $TOKEN"  https://fz44.gosplan.info/api/v1/protocols > protocols.json
curl -H "Content-type: application/json" -H "Authorization: Bearer $TOKEN"  https://fz44.gosplan.info/api/v1/plangraphs2020 > plangraphs2020.json

