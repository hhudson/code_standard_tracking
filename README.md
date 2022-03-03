# APEX Standards Tracker Project

## Introduction

In this repo, I am recording methods and queries to track and enforce APEX standards (including in the supporting database objects).

## The Application Standards Tracker

In this repo, I have included a modified copy of the [Application Standards Tracker](apex/f128.sql), an application that was formerly included in the APEX Sample App Gallery. I have modified the application to expand it's use to cover enforcing coding standards in the supporting database objects (tables, views, packages, etc).

### Modifications to support DB object coding standards

1. I added "Meta" as an application type in the eba_stds_types table ("Sample Data Package body" script).
2. I added "Source Code" to the "TEST LINK TYPES" LOV.
3. I edited the eba_stds_parser package body to support the "Source Code" link type.
3. I edited the eba_stds_data package body to seed the application with my default tests.


## How to use PLScope

Plscope creates dba/all/user_identfiers (since 11.1) and in dba/all/user_statements since 12.2