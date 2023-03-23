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
│
├───backend (server-side code)
│   ├───src
│   └───libs (for external libraries and dependencies)
|
├───database
|
├───documentation
│   │   environment-setup.md
│   │
│   ├───__to_submit
│   │   ├───development (editor files, etc)
│   │   └───sent (officially submitted via email)
│   │
│   ├───ideas (final stuff from WhatsApp that is agreed upon)
│   │       design.docx
│   │       features.docx
│   │       tech_stack.docx
│   │
│   └───uml_diagrams ( the good stuff ;) )
|
├───frontend
│   ├───assets
│   │   ├───development (editor files, etc)
│   │   │   ├───fonts
│   │   │   ├───images
│   │   │   └───other_assets
│   │   └───output (exported .png, etc)
│   │       ├───fonts
│   │       ├───images
│   │       └───other_assets
│   │
│   ├───libs (for external libraries and dependencies)
│   │
│   └───src (client-side code)
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
- Never work directly on `develop` or `main`.
- Do not ever merge into `main` directly from branches other than `release` or `hotfix` _types_ of branches.
- Before starting any new feature, make sure your `develop` branch is up-to-date with the latest changes from `main`.
- Use clear and descriptive branch names, such as `feature/my-new-feature` or `hotfix/bug-fix`.
- Commit often and with descriptive commit messages.

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