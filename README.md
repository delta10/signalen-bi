# Signalen - Business Intelligence (BI)

This repository contains example queries to easily create Business Intelligence (BI) reports and dashboards for [Signalen](https://www.signalen.org).

## General purposes

The following queries can be used for general purposes:

- [signals-overview.sql](./general/signals-overview.sql): an overview of signals with the most important related fields
- [signals-areas.sql](./general/signals-areas.sql): for all signals retrieve the matching areas for all area types
- [signals-sla.sql](./general/signals-sla.sql): for all signals retrieve the deadline and deadline*3
- [signals-feedback.sql](./general/signals-feedback.sql): retrieve the number of feedback items (no response, positive and negative) per category
- [users-per-department.sql](./general/users-per-department.sql): retrieve the users per department

## CSV export

In the folder [./csv](./csv) you can find the SQL statements that replicate the CSV-export functionality of Signalen.
