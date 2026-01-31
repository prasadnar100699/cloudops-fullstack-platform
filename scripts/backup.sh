#!/bin/bash

docker exec project-1_db_1 \
pg_dump -U admin appdb > backup.sql
