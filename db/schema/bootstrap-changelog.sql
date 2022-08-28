--liquibase formatted sql

-- the bootstrap changelog file is for creating databases and users
-- this cannot be done in a normal way because the may not already exist
-- so we have to connect to the postgres database for DB and user creation

--changeset jeremyspykerman:1 runInTransaction:false
--comment: create database
CREATE DATABASE "exampledb";
--rollback DROP DATABASE "exampledb";
