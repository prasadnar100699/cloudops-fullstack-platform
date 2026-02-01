#!/bin/bash

pg_dump -U admin appdb > /backup/appdb.sql
