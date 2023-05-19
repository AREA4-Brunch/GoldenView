# GoldenView

Done by team Terminal.
<br>
<br>

# Project Structure
<br>
<pre>
GoldenView/
|
│   .gitattributes
│   .gitignore
│   README.md ( you are here ;) )
|
├───deployment
│   │   README.md
│   │
│   ├───databases
│   │
│   └───trading_platform
│       ├───compose
|       ├───config
|       ├───dockerfiles
│       └───src
|
├───development
│   │   requirements.txt (modules needed; used in venv)
│   │   README.md
│   │
│   ├───databases (physical - implementation)
│   │
│   └───trading_platform (Django project dev dir)
│       │   manage.py
│       │
│       ├───static_root (Django root folder for static content)
│       │
│       ├───trading_platform (Django project config files)
│       │
│       ├───deployment (project and local deployment automation commands)
|       |   ├────storage (automation utils for statics and storage)
|       |   └────management
│       |       └───commands (scripts for automating tasks)
│       │
|       ├───assets
|       │   ├───development (editor files, etc)
|       │   │   ├───fonts
|       │   │   ├───images
|       │   │   └───other_assets     
|       │   │
|       │   └───output (exported .png, etc)
|       │       ├───fonts
|       │       ├───images
|       │       └───other_assets
|       │
│       └───apps (encapsulating independent functionalities)
|           ├───common (used across multiple apps)
|           |   └───frontend
|           |       ├───config
|           |       └───src
|           |           ├───static (e.g. js, css )
|           |           ├───components (e.g. buttons/ )
|           |           └───templates (e.g. footer/ )
|           |
│           └───feature_app
|               │   admin.py
|               │   apps.py
|               │   models.py
|               │   tests.py
|               │   views.py
|               │   __init__.py
|               │
|               │
|               ├───backend (server-side code)
|               │   ├───libs (for external libraries and dependencies)
|               │   └───src
|               │       ├───models
|               │       └───utils
|               │
|               ├───frontend
|               │   │
|               │   ├───config (configuring code variables, e.g. endpoints urls)
|               │   │
|               │   └───src (html, views, etc)
|               |       ├───static (contains literally nothing dynamic)
|               |       │   |   favicon.ico
|               |       │   |   robots.txt
|               |       │   |
|               |       │   ├───images
|               |       │   ├───libs  (for external libraries and dependencies)
|               |       │   ├───css
|               |       │   └───js
|               │       │
|               │       ├───components (e.g. buttons/ )
|               │       └───templates (e.g. footer/ )
|               │
|               └───migrations
│
├───documentation
│   │   environment-setup.md
│   │
│   ├───__to_submit
│   │   ├───development (prototype, editor files, etc)
│   │   └───sent (officially submitted via email)
│   │
│   ├───features_specs (main project file and specs of use case scenarios)
│   │
│   ├───formal_review (of GoldenView, done by other team)
│   │
│   ├───databases (logical - models)
│   │   ├───development (prototypes, editor files, etc)
│   │   └───output (db models being used in the implementation)
│   │
│   ├───uml_diagrams ( the good stuff ;) )
│   │
│   ├───api (documentation of endpoints)
│   │
│   └───ideas (final stuff from WhatsApp that is agreed upon)
│           design.docx
│           features.docx
│           tech_stack.docx
|
└───testing
    ├───backend
    │   ├───integration
    │   └───unit
    │
    ├───e2e (end to end, from user perspective)
    │
    └───frontend
        └───unit

</pre>

<br/><br/>
# GitFlow Workflow Guidelines


## Rules

- Only main and develop branches are long lived. All other labels should be cleared once done.
- Never work directly on `develop` or `main` branches.
- Do not ever merge into `main` directly from branches other than `release` or `hotfix` _types_ of branches.
- Before starting any new feature, make sure your `develop` branch is up-to-date with the latest changes from `main`.
- Use clear and descriptive branch names, such as `feature/my-new-feature` or `hotfix/bug-fix`.
- Commit often and with descriptive commit messages.
- Once `develop` is considered ready for release but was not yet entirely tested then according `release` branch <br/>
  is to be created where the software gets tested, and if found ready for release then that `release` branch is <br/>
  to be merged into `main` and back into `develop` and then deleted.

## Workflow

### Working on a new feature

1. Pull the latest changes from the `develop` branch: `git pull origin develop`
2. Create a new feature branch: `git checkout -b feature/my-new-feature`
3. Work on your feature branch and make frequent commits.
4. When you're done, push your feature branch to the remote repository: `git push -u origin feature/my-new-feature`
5. Open a pull request on GitHub and assign someone to review your code.
6. Once your pull request is approved, merge your feature branch into `develop` on GitHub.
7. Delete your feature branch.

### Making a hotfix

1. Create a new hotfix branch from the latest `main` branch
2. Work on your hotfix branch and make frequent commits.
3. When you're done, push your hotfix branch to the remote repository: `git push -u origin hotfix/bug-fix`
4. Open a pull request on GitHub and assign someone to review your code.
5. Once your pull request is approved, merge your hotfix branch into `main` on GitHub.
6. Once your pull request is approved, merge your hotfix branch into `develop` on GitHub.
7. Delete your hotfix branch.
