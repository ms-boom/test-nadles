#!/bin/bash
set -eox pipefail
exec uvicorn app:app

