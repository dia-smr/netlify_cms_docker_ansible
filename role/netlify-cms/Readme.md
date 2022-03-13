
 - Для клонирования закрытого репозитория потребуется Логин и Personal access [tokens](https://github.com/settings/tokens), эти данные поттребуется внести при запуске плейбука
 Их также можно дабавить в переменные, чтобы не вводить вручную и при запуске просто нажать Enter 
 ```
export GITHUBUSER="" && export GITHUBACCESSTOKEN=""
 ```

 - Для копирования файлов запустить с тэгом "netlify_file"
```
ansible-playbook  -i ../environments ansible/netlify-cms.yml -t netlify_file
```
 - Для изменения пользователей запустить с тэгом "netlify_sql"
 ```
ansible-playbook  -i ../environments ansible/netlify-cms.yml -t netlify_sql
 ```


<details><summary>Другая инфа</summary>
# Общие описания о сервисах
### Получить токен пользователя 

```
curl --location --request POST 'http://test.example.ru/.netlify/identity/token' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'grant_type=password' \
--data-urlencode 'username=admin@test.example.ru' \
--data-urlencode 'password=password'
```

### Запуск gatsby
- В режиме разработки
gatsby develop -H 0.0.0.0

- В продуктовом режиме
gatsby build
gatsby serve -H 0.0.0.0

# Создать пользователя
gotrue admin createuser -i 00000000-0000-0000-0000-000000000000 admin@test.example.ru password --superadmin


# Примеры Gotrue

GOTRUE_OPERATOR_TOKEN=your-super-secret-operator-token
GOTRUE_JWT_DEFAULT_GROUP_NAME=authenticated

# Make sure this JWT secret matches what was configured during setup
GOTRUE_JWT_SECRET=your-super-secret-jwt-token-with-at-least-32-characters-long

# How long should JWT tokens be valid for?
GOTRUE_JWT_EXP=3600

# Since Supabase is based on Postgres, you shouldn't need to change this
GOTRUE_DB_DRIVER=postgres

# What schema should requests be routed to?
# There should be no reason to change this
DB_NAMESPACE=auth

# Where is our auth/GoTrue located
# You shouldn't need to change these unless the ports are mapped differently
GOTRUE_API_HOST=0.0.0.0
PORT=9999

# Email settings
# You must set these if you want to be able to send emails
GOTRUE_SMTP_HOST=smtp.your-email-host.com
GOTRUE_SMTP_PORT=465
GOTRUE_SMTP_USER=your-smtp-user
GOTRUE_SMTP_PASS=your-smtp-password

# Should users be required to confirm their email address before they can log in?
# If set to false, users won't have to confirm their registration
# If set to true, users will have to click the link in their email to confirm
GOTRUE_MAILER_AUTOCONFIRM=false

# What is the 'from' address that emails are sent from?
GOTRUE_SMTP_ADMIN_EMAIL=noreply@test.example.ru

# Remove this if you don't want debug logs
GOTRUE_LOG_LEVEL=debug

# The connection string for your database
# `@db` says we're looking for the container called 'db' on our docker network
DATABASE_URL=postgres://postgres:your-super-secret-and-long-postgres-password@db:5432/postgres

# Email templates
# Invite user - provide a URL to a HTML or Text template
GOTRUE_MAILER_TEMPLATES_INVITE=https://test.example.ru/path/to/your/invite/template.html

# Confirm registration - provide a URL to a HTML or Text template
GOTRUE_MAILER_TEMPLATES_CONFIRMATION=https://test.example.ru/path/to/your/confirmation/template.html

# Password recovery - provide a URL to a HTML or Text template
GOTRUE_MAILER_TEMPLATES_RECOVERY=https://test.example.ru/path/to/your/password_reset/template.HTML

# Magic link - provide a URL to a HTML or Text template
GOTRUE_MAILER_TEMPLATES_MAGIC_LINK=https://test.example.ru/path/to/your/magic_link/template.html

# GoTrue URLs
# These are appended after the API_EXTERNAL_URL
# You shouldn't need to change these
GOTRUE_MAILER_URLPATHS_CONFIRMATION=/auth/v1/verify
GOTRUE_MAILER_URLPATHS_INVITE=/auth/v1/verify
GOTRUE_MAILER_URLPATHS_CONFIRMATION=/auth/v1/verify
GOTRUE_MAILER_URLPATHS_RECOVERY=/auth/v1/verify

# Site URLs
# This is where the user will be redirected to after clicking a link in an email and after oAuth
GOTRUE_SITE_URL=https://test.example.ru/redirect_to_here
GOTRUE_URI_ALLOW_LIST=https://test.example.ru/redirect_to_here

# This is the URL where your supabase stack is accessible
# i.e. this is the endpoint URL you would pass into a `createClient()` call in the supabase-js library
API_EXTERNAL_URL=https://database.test.example.ru/

# Set this to true if you want to prevent signing up with email and password
GOTRUE_DISABLE_SIGNUP=true

# oAuth
# If you are not using oAuth to login (e.g. Login with Facebook), you can ignore the below
# If you want to disable oAuth for a specific provider, set the `GOTRUE_EXTERNAL_<provider>_ENABLED` to false
# Github oAuth
GOTRUE_EXTERNAL_GITHUB_CLIENT_ID=your_github_client_id
GOTRUE_EXTERNAL_GITHUB_SECRET=your_github_client_secret
GOTRUE_EXTERNAL_GITHUB_ENABLED=true

# Google oAuth
GOTRUE_EXTERNAL_GOOGLE_CLIENT_ID=your-google-client-id.apps.googleusercontent.com
GOTRUE_EXTERNAL_GOOGLE_SECRET=your-google-secret
GOTRUE_EXTERNAL_GOOGLE_ENABLED=true

# Facebook oAuth
GOTRUE_EXTERNAL_FACEBOOK_CLIENT_ID=your-facebook-client-id
GOTRUE_EXTERNAL_FACEBOOK_SECRET=your-facebook-app-secret
GOTRUE_EXTERNAL_FACEBOOK_ENABLED=true

# Add other oAuth provider details below

</details>
