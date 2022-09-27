select count(name)
from {{ ref('email_providers') }}